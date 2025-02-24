using System;
using System.Data;
using System.Security.Cryptography;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections.Generic;

public partial class add_flat_floor_plan : System.Web.UI.Page
{
    ClientDashboardError CI = new ClientDashboardError();
    Key2hFloorPlan KF = new Key2hFloorPlan();
    Key2hProject K2 = new Key2hProject();
    ClientUsers CU = new ClientUsers();


    Key2hProjectblock KB = new Key2hProjectblock();
    Key2hFlat KFF = new Key2hFlat();
    Key2hBlockFloorPlan KBF=new Key2hBlockFloorPlan();
    public static string Userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        Userid = CU.GetClientLoginID();

        if (!IsPostBack)
        {
            Bindprojects();
            if (Request.QueryString["ID"] != null)
            {
                int value = 0;
                if (int.TryParse(Request.QueryString["ID"], out value))
                {
                    lbldisplaymsg.Text = " Edit Block Floor Plan";
                    btnSave.Text = "Submit";
                    //ddlProName.Attributes.Add("disabled", "true");
                    Bind(value);
                }
                else
                {
                    string script = string.Format(@"<script>
                        Swal.fire({{ 
                        title: 'URL is incorrect. please try again', 
                        confirmButtonText: 'OK', 
                        customClass: {{ 
                            confirmButton: 'handle-btn-success'  
                        }}
                        }}).then((result) => {{ 
                                window.location.href = 'add-block-floor-plan.aspx'; 
                        }});
                    </script>");
                    ClientScript.RegisterStartupScript(this.GetType(), "alertAndRedirect", script, false);
                }
            }
            else
            {
                lbldisplaymsg.Text = " Add Block Floor Plan";
                btnSave.Text = "Submit";
            }
        }
    }
    public void Bind(int ID)
    {
        try
        {
            DataTable dt = KBF.ViewBlockPlansbyFilter("", Convert.ToString(ID), "");
            if (dt != null && dt.Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(dt.Rows[0]["ProjectID"].ToString()) && dt.Rows[0]["ProjectID"] != null)
                {
                    ddlProName.SelectedValue = dt.Rows[0]["ProjectID"].ToString();
                    Bindblock();
                    //  BindUsersList(Convert.ToInt32(ddlProName.SelectedValue));
                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["BlockID"].ToString()) && dt.Rows[0]["BlockID"] != null)
                {
                    ddlblocknumber.SelectedValue = dt.Rows[0]["BlockID"].ToString();
                    BlockFunction();
                }
              
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-block-floor-plan.aspx", "Bind", ex.Message, "Not Fixed");
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
            CI.StoreExceptionMessage("add-block-floor-plan.aspx", "Bindprojects", ex.Message, "Not Fixed");
        }
    }
    public void BindUsersList(string BID)
    {
        try
        {
            DataTable dt = KBF.ViewBlockfloorplanByID(Convert.ToInt32(BID));
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
            CI.StoreExceptionMessage("add-block-floor-plan.aspx", "BindUsersList", ex.Message, "Not Fixed");
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
            ret = AddflatFloorPlan();
            if (ret == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
             "Swal.fire({ " +
                "  title: 'Block floor plan added successfully', " +
                "  icon: 'success', " +
                "  customClass: { " +
                "    icon: 'handle-icon-clr', " +
                "    confirmButton: 'handle-btn-success' " +
                "  } " +
                "});", true);
                txtTitle.Text = "";
                BindUsersList(ddlblocknumber.SelectedValue);
            }
            else
            {
                string script = string.Format(@" <script>
                        Swal.fire({{ 
                            title: 'Block floor plan details couldn't be added due to a server or network issue. Please try again in some time!', 
                            confirmButtonText: 'OK', 
                            customClass: {{ 
                                confirmButton: 'handle-btn-success' 
                            }} 
                        }}).then((result) => {{  
                                window.location.href = 'add-block-floor-plan.aspx';  
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
            CI.StoreExceptionMessage("add-block-floor-plan.aspx", "Bindprojectname", ex.Message, "Not Fixed");
        }
        return strname;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["ProjectID"] == null)
        {
            Clear();
        }
        else
        {
            Response.Redirect("view-floor-plan.aspx");
        }
    }
    public int AddflatFloorPlan()
    {
        int ret = 0;
        try
        {
            KBF.ProjectID = Convert.ToInt32(ddlProName.SelectedValue);
            KBF.BlockID = Convert.ToInt32(ddlblocknumber.SelectedValue);
            KBF.Title = txtTitle.Text;
            KBF.Status = true;
            KBF.ImagePath = SaveFile(FluploadImageUpload, "BlockFloorPlan", ddlProName.SelectedItem.Text);
            KBF.AddedBy = Userid;
            ret = KBF.AddBlockFloorPlan(KBF);
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-block-floor-plan.aspx", "AddBlockFloorPlan", ex.Message, "Not Fixed");
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
            CI.StoreExceptionMessage("add-block-floor-plan.aspx", "SaveFile", ex.Message, "Not Fixed");
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
        public int FloorPlanID { get; set; }
        public string ProjectID { get; set; }
        public string BlockID { get; set; }
       
        public string Title { get; set; }
        public string ImagePath { get; set; }

    }
    [WebMethod]
    public static List<CostDetail> GetCostDetails(string selectedValue)
    {
        Key2hBlockFloorPlan KFP = new Key2hBlockFloorPlan();
        ClientDashboardError CE = new ClientDashboardError();
        List<CostDetail> costDetails = new List<CostDetail>();
        try
        {
            if (!string.IsNullOrEmpty(selectedValue))
            {
                DataTable dt = KFP.ViewBlockfloorplanByID(Convert.ToInt32(selectedValue));

                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        CostDetail costDetail = new CostDetail
                        {
                            FloorPlanID = Convert.ToInt32(row["BlockFloorPlanID"]),
                            ProjectID = WebBindprojectname(Convert.ToInt32(row["ProjectID"])),
                            BlockID = BindBlockname(Convert.ToInt32(row["BlockID"])),
                         
                            Title = Convert.ToString(row["Title"]),
                            ImagePath = Convert.ToString(row["ImagePath"]),
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
            CE.StoreExceptionMessage("add-block-floor-plan.aspx", "GetCostDetails", ex.Message, "Not Fixed");
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
            CE.StoreExceptionMessage("add-block-floor-plan.aspx", "WEBBindprojectname", ex.Message, "Not Fixed");
        }
        return strname;
    }

    [System.Web.Services.WebMethod]
    public static string DeleteCustomer(string FloorID)
    {
        Key2hBlockFloorPlan KBF=new Key2hBlockFloorPlan();
        ClientDashboardError CE = new ClientDashboardError();
        string strerror = string.Empty;
        int ret = 0;
        try
        {
            Key2hCostDetails KD = new Key2hCostDetails();
            ret = KBF.DeleteBlockFloorPlanbyBlockPlanID(Convert.ToInt32(FloorID));

            if (ret == 1)
            {
                strerror = "Row deleted successfully!";
            }
            else
            {
                strerror = "Row not deleted!";
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-block-floor-plan.aspx", "DeleteCustomer", ex.Message, "Not Fixed");
        }
        return strerror;
    }




    public void BlockFunction()
    {
        if (!string.IsNullOrEmpty(ddlProName.SelectedValue) && !string.IsNullOrEmpty(ddlblocknumber.SelectedValue))
        {
            BindUsersList(ddlblocknumber.SelectedValue);
        }
        else
        {
            divrptCustomers.Style.Add("display", "none");
        }
    }


    public static string BindBlockname(int ID)
    {
        Key2hProjectblock KB = new Key2hProjectblock();
        ClientDashboardError CI = new ClientDashboardError();
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
            CI.StoreExceptionMessage("view-flat-booking.aspx", "BindBlockname", ex.Message, "Not Fixed");
        }
        return Block;
    }
    public static string ViewFlatNameByFlatID(int ID)
    {
        Key2hFlat KFF = new Key2hFlat();
        ClientDashboardError CI = new ClientDashboardError();
        string Block = string.Empty;
        try
        {
            DataTable dt = KFF.ViewAllFlatByFlatID(Convert.ToInt32(ID));
            if (dt != null && dt.Rows.Count > 0)
            {
                Block = dt.Rows[0]["FlatName"].ToString();
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("view-flat-booking.aspx", "ViewFlatNameByFlatID", ex.Message, "Not Fixed");
        }
        return Block;
    }




    protected void ddlProName_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bindblock();
        BlockFunction();
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
                }
            }
            else
            {
                ddlblocknumber.Items.Clear();
                ddlblocknumber.Items.Insert(0, new ListItem("", ""));
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-flat-booking.aspx", "Bindblock", ex.Message, "Not Fixed");
        }
    }
    protected void ddlblocknumber_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        BlockFunction();
    }

  
}