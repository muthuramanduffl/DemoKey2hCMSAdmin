using System;
using System.Data;
using System.Security.Cryptography;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections.Generic;

public partial class add_flat_quality_reports : System.Web.UI.Page
{
    ClientDashboardError CI = new ClientDashboardError();
    key2hFlatQR KFQR = new key2hFlatQR();
    Key2hProject K2 = new Key2hProject();
    ClientUsers CU = new ClientUsers();
    Key2hFlat KF = new Key2hFlat();
    Key2hProjectblock KB = new Key2hProjectblock();
    public static string Userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        Userid = CU.GetClientLoginID();

        if (!IsPostBack)
        {
            Bindprojects();
            lbldisplaymsg.Text = " Add Flat Quality Reports";
            btnSave.Text = "Submit";
        }
    }

    public string BindBlockname(int ID)
    {
        string Block = string.Empty;
        try
        {
            DataTable dt = KB.ViewAllBlock(Convert.ToString(ID), "", "");
            if (dt != null && dt.Rows.Count > 0)
            {
                Block = dt.Rows[0]["BlockName"].ToString();
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-flat-quality-reports.aspx", "BindBlockname", ex.Message, "Not Fixed");
        }
        return Block;
    }
    public string ViewFlatNameByFlatID(int ID)
    {
        string Block = string.Empty;
        try
        {
            DataTable dt = KF.ViewAllFlatByFlatID(Convert.ToInt32(ID));
            if (dt != null && dt.Rows.Count > 0)
            {
                Block = dt.Rows[0]["FlatName"].ToString();
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-flat-quality-reports.aspx", "ViewFlatNameByFlatID", ex.Message, "Not Fixed");
        }
        return Block;
    }

    public void Bindprojects()
    {
        try
        {
            DataTable dt = K2.ViewActiveprojects();
            if (dt!=null && dt.Rows.Count > 0)
            {
                ddlProName.DataSource = dt;
                ddlProName.DataTextField = "ProjectName";
                ddlProName.DataValueField = "ProjectID";
                ddlProName.DataBind();
                ddlProName.Items.Insert(0, new ListItem("", ""));
            }
            else
            {
                ddlblocknumber.Items.Clear();
                ddlblocknumber.Items.Insert(0, new ListItem("", ""));
                ddlflatNumber.Items.Clear();
                ddlflatNumber.Items.Insert(0, new ListItem("", ""));
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-flat-quality-reports.aspx", "Bindprojects", ex.Message, "Not Fixed");
        }
    }
    public void BindUsersList(int PrID,int BlockID,int FlatID)
    {
        try
        {
            DataTable dt = KFQR.ViewAllQualityReportbyPIDBIDFID(PrID,BlockID,FlatID);
            if (dt != null && dt.Rows.Count > 0)
            {
                divrptCustomers.Style.Add("display", "block");
                rpruser.Visible = true;
                rpruser.DataSource = dt;
                rpruser.DataBind();
            }
            else
            {
                divrptCustomers.Style.Add("display", "none");
                rpruser.Visible = false;
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-flat-quality-reports.aspx", "BindUsersList", ex.Message, "Not Fixed");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string labelerror = string.Empty;
        if (string.IsNullOrEmpty(ddlProName.SelectedValue) && string.IsNullOrEmpty(ddlblocknumber.SelectedValue) && string.IsNullOrEmpty(ddlflatNumber.SelectedValue) && string.IsNullOrEmpty(txtTitle.Text))
        {
            labelerror = "Fill the mandatory fields.";
        }
        else if (string.IsNullOrEmpty(ddlProName.SelectedValue))
        {
            labelerror = "Select project name";
        }

        else if (string.IsNullOrEmpty(ddlblocknumber.SelectedValue))
        {
            labelerror = "Select block name";
        }
        else if (string.IsNullOrEmpty(ddlflatNumber.SelectedValue))
        {
            labelerror = "Select flat name";
        }
        else if (string.IsNullOrEmpty(txtTitle.Text))
        {
            labelerror = "Enter title";
        }
        int pro = Convert.ToInt32(ddlProName.SelectedValue);

        if (string.IsNullOrEmpty(labelerror))
        {
            // if (Request.QueryString["ProjectID"] == null)
            // {
            // if (!Isalreadyexist(ddlProName.SelectedValue, "", ""))

            // {
            int ret = 0;
            ret = AddflatQP();
            if (ret == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
             "Swal.fire({ " +
                "  title: 'Flat quality report added successfully', " +
                "  icon: 'success', " +
                "  customClass: { " +
                "    icon: 'handle-icon-clr', " +
                "    confirmButton: 'handle-btn-success' " +
                "  } " +
                "});", true);
                BindUsersList(Convert.ToInt32(ddlProName.SelectedValue), Convert.ToInt32(ddlblocknumber.SelectedValue), Convert.ToInt32(ddlflatNumber.SelectedValue));
                txtTitle.Text = "";
                ddlProName.SelectedIndex = 0;                
            }
            else
            {
                string script = string.Format(@" <script>
                        Swal.fire({{ 
                            title: 'Project floor plan details couldn't be added due to a server or network issue. Please try again in some time!', 
                            confirmButtonText: 'OK', 
                            customClass: {{ 
                                confirmButton: 'handle-btn-success' 
                            }} 
                        }}).then((result) => {{  
                                window.location.href = 'add-flat-quality-reports.aspx';  
                            }} 
                        }});
                        </script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alertAndRedirect", script, false);
            }
        }
        else
        {
            //alert labelerror
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
            //"Swal.fire('Validation Alert', '" + labelerror + "!.', 'success');", true);
        }
    }
    public string Bindprojectname(int Prid)
    {
        string strname = string.Empty;
        try
        {
            DataTable dt = K2.ViewAllProjectsByid(Prid);
            if (dt.Rows.Count > 0)
            {
                strname = Convert.ToString(dt.Rows[0]["ProjectName"]);
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-flat-quality-reports.aspx", "Bindprojectname", ex.Message, "Not Fixed");
        }
        return strname;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    public int AddflatQP()
    {
        int ret = 0;
        try
        {
            KFQR.ProjectID = Convert.ToInt32(ddlProName.SelectedValue);
            KFQR.BlockID = Convert.ToInt32(ddlblocknumber.SelectedValue);
            KFQR.FlatID = Convert.ToInt32(ddlflatNumber.SelectedValue);
            KFQR.Title = txtTitle.Text;
            KFQR.Status = true;
            KFQR.PDFName = SaveFile(FluploadImageUpload, "FlatQualityReportDoc", ddlProName.SelectedItem.Text);
            KFQR.AddedBy = Userid;
            ret = KFQR.AddFlatQualityReport(KFQR);
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-flat-quality-reports.aspx", "AddProjectQP", ex.Message, "Not Fixed");
        }
        return ret;
    }
   
    public string SaveFile(FileUpload uploadedFile, string appkey, string Projectname)
    {
        int savefile = 0;
        string filename = string.Empty;
        try
        {
            if (uploadedFile.HasFile)
            {
                string filepath = System.Configuration.ConfigurationManager.AppSettings[appkey];
                string fileName = Path.GetFileName(uploadedFile.FileName);
                string fileExtension = Path.GetExtension(fileName);
                filename = GenerateFileName(Projectname.Trim(), fileExtension).Trim('-');
                string temppath = filepath.Trim() + @"\" + filename.Trim().Replace(" ", "");
                string savepath = Server.MapPath(temppath);
                uploadedFile.SaveAs(savepath);
                savefile = 1;
            }
            else
            {
                filename = "";
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-flat-quality-reports.aspx", "SaveFile", ex.Message, "Not Fixed");
        }
        return filename.Contains(" ") ? filename.Replace(" ", "") : filename;
    }
    public string GenerateFileName(string Projectname, string fileExtension)
    {
        string randomString = GenerateRandomString(4);
        string newFileName = Projectname + randomString + fileExtension;
        return newFileName;
    }
    private string GenerateRandomString(int length)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        var byteArray = new byte[length];
        using (var rng = RandomNumberGenerator.Create())
        {
            rng.GetBytes(byteArray);
        }
        var randomString = new char[length];
        for (int i = 0; i < length; i++)
        {
            randomString[i] = chars[byteArray[i] % chars.Length];
        }
        return new string(randomString);
    }
    public void Clear()
    {
        Response.Redirect(Request.Url.AbsolutePath);
    }
    protected string GetRowNo(string itemIndex)
    {
        return PageIndex > 1 ? (((PageIndex - 1) * 10) + Convert.ToInt32(itemIndex)).ToString() : itemIndex;
    }
    public int PageIndex
    {
        get { return ViewState["PageIndex"] != null ? (int)ViewState["PageIndex"] : 1; }
        set { ViewState["PageIndex"] = value; }
    }

    //[WebMethod]
    //public static List<key2hFlatQR> GetCostDetails(string selectedValue)
    //{
    //    Key2hQualityreport KQR = new Key2hQualityreport();
    //    ClientDashboardError CE = new ClientDashboardError();
    //    List<key2hFlatQR> costDetails = new List<key2hFlatQR>();
    //    try
    //    {
    //        if (!string.IsNullOrEmpty(selectedValue))
    //        {
    //            DataTable dt = KQR.ViewAllProjectQPbyProjectID(Convert.ToInt32(selectedValue));

    //            if (dt != null && dt.Rows.Count > 0)
    //            {
    //                foreach (DataRow row in dt.Rows)
    //                {
    //                    key2hFlatQR costDetail = new key2hFlatQR
    //                    {
    //                        QFID = Convert.ToInt32(row["QPID"]),
    //                        ProjectID = WebBindprojectname(Convert.ToInt32(row["ProjectID"])),
    //                        BlockID = WebBindprojectname(Convert.ToInt32(row["ProjectID"])),
    //                        FlatID = WebBindprojectname(Convert.ToInt32(row["ProjectID"])),
    //                        Title = Convert.ToString(row["Title"]),
    //                        PDFName = Convert.ToString(row["PDFName"]),
    //                    };
    //                    costDetails.Add(costDetail);
    //                }
    //            }
    //        }
    //        else
    //        {
    //            // no action
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        CE.StoreExceptionMessage("add-flat-quality-reports.aspx", "GetCostDetails", ex.Message, "Not Fixed");
    //    }
    //    return costDetails;
    //}

    public static string WebBindprojectname(int Prid)
    {
        string strname = string.Empty;
        ClientDashboardError CE = new ClientDashboardError();
        Key2hProject K2 = new Key2hProject();
        try
        {
            DataTable dt = K2.ViewAllProjectsByid(Prid);
            if (dt.Rows.Count > 0)
            {
                strname = Convert.ToString(dt.Rows[0]["ProjectName"]);
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-flat-quality-reports.aspx", "WEBBindprojectname", ex.Message, "Not Fixed");
        }
        return strname;
    }

    [System.Web.Services.WebMethod]
    public static string DeleteCustomer(string QFID)
    {
        key2hFlatQR KFQR = new key2hFlatQR();
        ClientDashboardError CE = new ClientDashboardError();
        ClientUsers CU = new ClientUsers();

        HttpCookie LoginIDCookie = HttpContext.Current.Request.Cookies["clientid"];
        string clientLoginId = CU.GetClientLoginID();
        if (!string.IsNullOrEmpty(clientLoginId) && clientLoginId.Contains("clientid="))
        {
            Userid = clientLoginId.Replace("clientid=", "");
        }

        string strerror = string.Empty;
        int ret = 0;
        try
        {
            Key2hCostDetails KD = new Key2hCostDetails();
            ret = KFQR.DeleteFlatQPbyQFID(Convert.ToInt32(QFID), Userid);

            if (ret == 1)
            {
                strerror = "Flat quality report has been deleted.";
            }
            else
            {
                strerror = "Flat quality report has been not deleted.";
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-flat-quality-reports.aspx", "DeleteCustomer", ex.Message, "Not Fixed");
        }
        return strerror;
    }

    protected void ddlProName_SelectedIndexChanged(object sender, EventArgs e)
    {
        DDlChangeEvent();
        Bindblock();
    }

    protected void ddlflatNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        DDlChangeEvent();
    }

    protected void ddlblocknumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        DDlChangeEvent();
        BindFlat();
    }


    public void DDlChangeEvent()
    {
        if (!string.IsNullOrEmpty(ddlProName.SelectedValue) && !string.IsNullOrEmpty(ddlblocknumber.SelectedValue) && !string.IsNullOrEmpty(ddlflatNumber.SelectedValue))
        {
            BindUsersList(Convert.ToInt32(ddlProName.SelectedValue), Convert.ToInt32(ddlblocknumber.SelectedValue), Convert.ToInt32(ddlflatNumber.SelectedValue));
        }
        else
        {
            divrptCustomers.Style.Add("display", "none");
        }
    }

    public void BindFlat()
    {
        try
        {
            if (!string.IsNullOrEmpty(ddlblocknumber.SelectedValue))
            {
                DataTable DT = KF.ViewAllflatByBlockID(Convert.ToInt32(ddlblocknumber.SelectedValue));

                if (DT.Rows.Count > 0)
                {
                    ddlflatNumber.DataSource = DT;
                    ddlflatNumber.DataTextField = "FlatName";
                    ddlflatNumber.DataValueField = "FlatID";
                    ddlflatNumber.DataBind();
                    ddlflatNumber.Items.Insert(0, new ListItem("", ""));

                }
                else
                {
                    ddlflatNumber.Items.Clear();
                    ddlflatNumber.Items.Insert(0, new ListItem("", ""));
                    ddlflatNumber.Items.Insert(1, new ListItem("No Flat number", ""));
                }
            }
            else
            {
                ddlflatNumber.Items.Clear();
                ddlflatNumber.Items.Insert(0, new ListItem("", ""));
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-flat-quality-reports.aspx", "BindFlat", ex.Message, "Not Fixed");
        }
    }


    public void Bindblock()
    {
        try
        {
            if (!string.IsNullOrEmpty(ddlProName.SelectedValue))
            {
                DataTable DT = KB.ViewBlockbyProjectID(Convert.ToInt32(ddlProName.SelectedValue));

                if (DT.Rows.Count > 0)
                {
                    ddlblocknumber.DataSource = DT;
                    ddlblocknumber.DataTextField = "BlockName";
                    ddlblocknumber.DataValueField = "BlockID";
                    ddlblocknumber.DataBind();
                    ddlblocknumber.Items.Insert(0, new ListItem("", ""));
                }
                else
                {
                    ddlblocknumber.Items.Clear();
                    ddlblocknumber.Items.Insert(0, new ListItem("No block name", ""));
                    ddlflatNumber.Items.Clear();
                    ddlflatNumber.Items.Insert(0, new ListItem("", ""));
                }
            }
            else
            {
                ddlblocknumber.Items.Clear();
                ddlblocknumber.Items.Insert(0, new ListItem("", ""));
                ddlflatNumber.Items.Clear();
                ddlflatNumber.Items.Insert(0, new ListItem("", ""));
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-flat-quality-reports.aspx", "Bindblock", ex.Message, "Not Fixed");
        }
    }

}