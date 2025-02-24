using System;
using System.Data;
using System.Security.Cryptography;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections.Generic;

public partial class adminkey2hcom_AddFloorPlan : System.Web.UI.Page
{
    ClientDashboardError CI = new ClientDashboardError();
    Key2hQualityreport KF = new Key2hQualityreport();
    Key2hProject K2 = new Key2hProject();
    ClientUsers CU = new ClientUsers();
    public static string Userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        Userid = CU.GetClientLoginID();

        if (!IsPostBack)
        {
            Bindprojects();
            lbldisplaymsg.Text = " Add Project Quality Reports";
            btnSave.Text = "Submit";
        }
    }
    public void Bind(int ID)
    {
        try
        {
            DataTable dt = KF.ViewAllProjectQPbyProjectID(ID);
            if (dt != null && dt.Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(dt.Rows[0]["ProjectID"].ToString()) && dt.Rows[0]["ProjectID"] != null)
                {
                    ddlProName.SelectedValue = dt.Rows[0]["ProjectID"].ToString();
                    BindUsersList(Convert.ToInt32(ddlProName.SelectedValue));
                }
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-quality-reports.aspx", "Bind", ex.Message, "Not Fixed");
        }
    }

    public void Bindprojects()
    {
        try
        {
            DataTable dt = K2.ViewActiveprojects();
            if (dt.Rows.Count > 0)
            {
                ddlProName.DataSource = dt;
                ddlProName.DataTextField = "ProjectName";
                ddlProName.DataValueField = "ProjectID";
                ddlProName.DataBind();
                ddlProName.Items.Insert(0, new ListItem("", ""));
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-quality-reports.aspx", "Bindprojects", ex.Message, "Not Fixed");
        }
    }
    public void BindUsersList(int id)
    {
        try
        {
            DataTable dt = KF.ViewAllProjectQPbyProjectID(id);
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
            CI.StoreExceptionMessage("add-quality-reports.aspx", "BindUsersList", ex.Message, "Not Fixed");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string labelerror = string.Empty;
        if (string.IsNullOrEmpty(ddlProName.SelectedValue) && string.IsNullOrEmpty(txtTitle.Text))
        {
            labelerror = "Fill the mandatory fields.";
        }
        else if (string.IsNullOrEmpty(ddlProName.SelectedValue))
        {
            labelerror = "Select project name";
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
            ret = AddProjectQP();
            if (ret == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
             "Swal.fire({ " +
                "  title: 'Project quality report added successfully', " +
                "  icon: 'success', " +
                "  customClass: { " +
                "    icon: 'handle-icon-clr', " +
                "    confirmButton: 'handle-btn-success' " +
                "  } " +
                "});", true);
                txtTitle.Text = "";
                BindUsersList(pro);
            }
            else
            {
                string script = string.Format(@" <script>
                        Swal.fire({{ 
                            title: 'Project quality report couldn't be added due to a server or network issue. Please try again in some time!', 
                            confirmButtonText: 'OK', 
                            customClass: {{ 
                                confirmButton: 'handle-btn-success' 
                            }} 
                        }}).then((result) => {{  
                                window.location.href = 'add-quality-reports.aspx';  
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
            CI.StoreExceptionMessage("add-quality-reports.aspx", "Bindprojectname", ex.Message, "Not Fixed");
        }
        return strname;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    public int AddProjectQP()
    {
        int ret = 0;
        try
        {
            KF.ProjectID = Convert.ToInt32(ddlProName.SelectedValue);
            KF.Title = txtTitle.Text;
            KF.Status = true;
            KF.PDFName = SaveFile(FluploadImageUpload, "QualityReports", ddlProName.SelectedItem.Text);
            KF.AddedBy = Userid;
            ret = KF.AddProjectQP(KF);
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-quality-reports.aspx", "AddProjectQP", ex.Message, "Not Fixed");
        }
        return ret;
    }
    public int UpdateProjectQP()
    {
        int ret = 0;
        try
        {
            KF.ProjectID = Convert.ToInt32(ddlProName.SelectedValue);
            KF.Title = txtTitle.Text;
            if (FluploadImageUpload.HasFile)
            {
                KF.PDFName = SaveFile(FluploadImageUpload, "QualityReports", ddlProName.SelectedItem.Text);
            }
            else
            {
                KF.PDFName = hdnImageUpload.Value;
            }
            ret = KF.UpdateProjectQP(KF);
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-quality-reports.aspx", "UpdateProjectQP", ex.Message, "Not Fixed");
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
            CI.StoreExceptionMessage("add-quality-reports.aspx", "SaveFile", ex.Message, "Not Fixed");
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

    public class CostDetail
    {
        public int QID { get; set; }
        public string ProjectID { get; set; }
        public string Title { get; set; }
        public string PDFName { get; set; }

    }
    [WebMethod]
    public static List<CostDetail> GetCostDetails(string selectedValue)
    {
        Key2hQualityreport KF = new Key2hQualityreport();
        ClientDashboardError CE = new ClientDashboardError();
        List<CostDetail> costDetails = new List<CostDetail>();
        try
        {
            if (!string.IsNullOrEmpty(selectedValue))
            {
                DataTable dt = KF.ViewAllProjectQPbyProjectID(Convert.ToInt32(selectedValue));

                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        CostDetail costDetail = new CostDetail
                        {
                            QID = Convert.ToInt32(row["QPID"]),
                            ProjectID = WebBindprojectname(Convert.ToInt32(row["ProjectID"])),
                            Title = Convert.ToString(row["Title"]),
                            PDFName = Convert.ToString(row["PDFName"]),
                        };
                        costDetails.Add(costDetail);
                    }
                }
            }
            else
            {
                // no action
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-quality-reports.aspx", "GetCostDetails", ex.Message, "Not Fixed");
        }
        return costDetails;
    }

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
            CE.StoreExceptionMessage("add-quality-reports.aspx", "WEBBindprojectname", ex.Message, "Not Fixed");
        }
        return strname;
    }

    [System.Web.Services.WebMethod]
    public static string DeleteCustomer(string QFID)
    {
        Key2hQualityreport KF = new Key2hQualityreport();
        ClientDashboardError CE = new ClientDashboardError();
        string strerror = string.Empty;
         int ret = 0;
        try
        {
            Key2hCostDetails KD = new Key2hCostDetails();
            ret = KF.DeleteProjectQPbyQFID(Convert.ToInt32(QFID));

            if (ret == 1)
            {
                strerror = "Project quality report has been deleted.";
            }
            else
            {
                strerror = "Project quality report has been not deleted.";
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-quality-reports.aspx", "DeleteCustomer", ex.Message, "Not Fixed");
        }
        return strerror;
    }

    protected void ddlProName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlProName.SelectedValue))
        {
            BindUsersList(Convert.ToInt32(ddlProName.SelectedValue));
        }
        else
        {
            divrptCustomers.Style.Add("display", "none");
            rpruser.Visible = false;
        }
    }
}