using System;
using System.Data;
using System.Security.Cryptography;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;

public partial class add_amenities : System.Web.UI.Page
{
    ClientDashboardError CI = new ClientDashboardError();
    Key2hAmenities K2A = new Key2hAmenities();
    Key2hProject K2 = new Key2hProject();
    ClientUsers CU = new ClientUsers();
    public static string Userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        Userid = CU.GetClientLoginID();
        if (!IsPostBack)
        {
            Bindprojects();
            lbldisplaymsg.Text = " Add Amenities";
            btnSave.Text = "Submit";
        }

        if (Request.QueryString["ID"] != null)
        {
            int value = 0;
            if (int.TryParse(Request.QueryString["ID"], out value))
            {
                lbldisplaymsg.Text = " Edit Amenities";
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
                                window.location.href = 'add-amenities.aspx'; 
                        }});
                    </script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alertAndRedirect", script, false);
            }
        }
        else
        {
            lbldisplaymsg.Text = " Add Amenities";
            btnSave.Text = "Submit";
        }
    }


    public void Bind(int ID)
    {
        try
        {
            DataTable dt = K2A.ViewAllAmenities(ID, Userid);
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
            CI.StoreExceptionMessage("add-amenities.aspx", "Bind", ex.Message, "Not Fixed");
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
            CI.StoreExceptionMessage("add-amenities.aspx", "Bindprojects", ex.Message, "Not Fixed");
        }
    }
    public void BindUsersList(int id)
    {
        try
        {
            DataTable dt = K2A.ViewAllAmenities(Convert.ToInt32(ddlProName.SelectedValue), Userid);
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
            CI.StoreExceptionMessage("add-amenities.aspx", "BindUsersList", ex.Message, "Not Fixed");
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


            DataTable dt = K2A.ViewAllAmenities(Convert.ToInt32(ddlProName.SelectedValue), Convert.ToString(Userid));
            if (dt.Rows.Count < 10)
            {

                int ret = 0;
                ret = AddAmenities();
                if (ret == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                 "Swal.fire({ " +
                    "  title: 'Amenities added successfully', " +
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
                            title: 'Project floor plan details couldn't be added due to a server or network issue. Please try again in some time!', 
                            confirmButtonText: 'OK', 
                            customClass: {{ 
                                confirmButton: 'handle-btn-success' 
                            }} 
                        }}).then((result) => {{  
                                window.location.href = 'add-amenities.aspx';  
                            }} 
                        }});
                        </script>");
                    ClientScript.RegisterStartupScript(this.GetType(), "alertAndRedirect", script, false);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "Swal.fire('Maximum limit', '" + 10 + " amenities');", true);
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
            CI.StoreExceptionMessage("add-amenities.aspx", "Bindprojectname", ex.Message, "Not Fixed");
        }
        return strname;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    public int AddAmenities()
    {
        int ret = 0;
        try
        {
            K2A.intProjectID = Convert.ToInt32(ddlProName.SelectedValue);
            K2A.strTitle = txtTitle.Text;
            int dOrder = GetMissingDisplayOrders(Convert.ToInt32(ddlProName.SelectedValue));
            K2A.intDisplayOrder = dOrder > 0 ? dOrder : 1;
            K2A.strimage = SaveFile(FluploadImageUpload, "AmenitiesDoc", ddlProName.SelectedItem.Text);
            K2A.AddedBy = Convert.ToInt32(Userid);
            ret = K2A.AddProjectAmenities(K2A);
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-amenities.aspx", "AddProjectQP", ex.Message, "Not Fixed");
        }
        return ret;
    }

    public int GetMissingDisplayOrders(int projectId)
    {
        List<int> existingOrders = new List<int>();
        int maxOrder = 10;

        DataTable dt = K2A.ViewAllAmenities(Convert.ToInt32(ddlProName.SelectedValue), Convert.ToString(Userid));
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                existingOrders.Add(Convert.ToInt32(dt.Rows[i]["DisplayOrder"]));
            }
        }
        List<int> allOrders = Enumerable.Range(1, maxOrder).ToList();
        List<int> missingOrders = allOrders.Except(existingOrders).ToList();
        return missingOrders.FirstOrDefault();
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
            CI.StoreExceptionMessage("add-amenities.aspx", "SaveFile", ex.Message, "Not Fixed");
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
            CE.StoreExceptionMessage("add-amenities.aspx", "WEBBindprojectname", ex.Message, "Not Fixed");
        }
        return strname;
    }

    [System.Web.Services.WebMethod]
    public static string DeleteCustomer(string QFID)
    {
        Key2hAmenities K2A = new Key2hAmenities();
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
            ret = K2A.DeleteProjectAmenities(Convert.ToInt32(QFID), Userid);

            if (ret == 1)
            {
                strerror = "Amenities has been deleted.";
            }
            else
            {
                strerror = "Amenities has been not deleted.";
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-amenities.aspx", "DeleteCustomer", ex.Message, "Not Fixed");
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