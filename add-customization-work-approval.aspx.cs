using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_customization_work_approval : System.Web.UI.Page
{
    Key2hProject K2 = new Key2hProject();
    Key2hFlat KF = new Key2hFlat();
    Key2hCustomer KC = new Key2hCustomer();
    Key2hProjectblock KB = new Key2hProjectblock();
    ClientDashboardError CE = new ClientDashboardError();
    Key2hCustomizationTransaction KCWT = new Key2hCustomizationTransaction();

    Key2hCustomisationWorkApproval KCWA = new Key2hCustomisationWorkApproval();


    Key2hcustomizationWork KCZW = new Key2hcustomizationWork();
    ClientUsers CU = new ClientUsers();
    public static int CZWID;
    public static string Userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Userid = CU.GetClientLoginID();
            if (!IsPostBack)
            {
                BindAllDDl();
            }
            if (Request.QueryString["CWAID"] != null)
            {
                int value = 0;
                if (int.TryParse(Request.QueryString["CWAID"], out value))
                {
                    hdnCostID.Value = value.ToString();
                    Bind(value.ToString());
                    divrptCustomers.Style["Display"] = "none";
                    lblDisplaytext.Text = "Edit Customization Work Approval";
                    SetDropdownAttributes(true);
                }
                else
                {
                    ShowAlertAndRedirect("URL is incorrect. please try again", "view-customization-work.aspx");
                }
            }

            else if (Request.QueryString["FlatID"] != null)
            {
                int flatIdValue = 0;
                if (int.TryParse(Request.QueryString["FlatID"], out flatIdValue))
                {
                    lblDisplaytext.Text = "Edit Customization Work Approval";
                    BindFlatID(flatIdValue.ToString());
                    SetDropdownAttributes(true);
                }
                else
                {
                    ShowAlertAndRedirect("URL is incorrect. please try again", "view-customization-work.aspx");
                }
            }
            else
            {


                divrptCustomers.Style["Display"] = "none";
                lblDisplaytext.Text = "Add Customization Work Approval";

                // SetDropdownAttributes(false);
            }


        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-customization-work-approval.aspx", "BindCity", ex.Message, "Not Fixed");
        }
    }
    // Helper Methods
    private void BindAllDDl()
    {
        Bindblock();
        BindFlat();
        Bindprojects();
        //  BindWorkProgress();
    }
    private void SetDropdownAttributes(bool isDisabled)
    {
        ddlProName.Attributes["disabled"] = isDisabled ? "true" : null;
        ddlBlockNumber.Attributes["disabled"] = isDisabled ? "true" : null;
        ddlFlatNumber.Attributes["disabled"] = isDisabled ? "true" : null;
    }
    private void ShowAlertAndRedirect(string message, string redirectUrl)
    {
        string script = string.Format(@"
        <script>
        Swal.fire({{
            title: '{0}',
            confirmButtonText: 'OK',
            customClass: {{
                confirmButton: 'handle-btn-success'
            }}
        }}).then((result) => {{
            window.location.href = '{1}';
        }});
        </script>", message, redirectUrl);

        ClientScript.RegisterStartupScript(this.GetType(), "alertAndRedirect", script, false);
    }
    public void Bind(string ID)
    {
        try
        {
            DataTable dt = KCZW.ViewAllFlatCustomizationWorks("", "", "", ID, "");
            if (dt != null && dt.Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(dt.Rows[0]["ProjectID"].ToString()) && dt.Rows[0]["ProjectID"] != null)
                {
                    ddlProName.SelectedValue = dt.Rows[0]["ProjectID"].ToString();
                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["BlockID"].ToString()) && dt.Rows[0]["BlockID"] != null)
                {
                    Bindblock();
                    ddlBlockNumber.SelectedValue = dt.Rows[0]["BlockID"].ToString();
                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["FlatID"].ToString()) && dt.Rows[0]["FlatID"] != null)
                {
                    BindFlat();
                    ddlFlatNumber.SelectedValue = dt.Rows[0]["FlatID"].ToString();
                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["FlatID"].ToString()) && dt.Rows[0]["FlatID"] != null)
                {
                    BindFlat();
                    ddlFlatNumber.SelectedValue = dt.Rows[0]["FlatID"].ToString();
                    FlatFunction();
                }
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-customization-work-approval.aspx", "Bind", ex.Message, "Not Fixed");
        }
    }
    public void BindFlatID(string ID)
    {
        try
        {
            DataTable dt = KCZW.ViewAllFlatCustomizationWorks("", "", ID, "", "");
            if (dt != null && dt.Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(dt.Rows[0]["ProjectID"].ToString()) && dt.Rows[0]["ProjectID"] != null)
                {

                    ddlProName.SelectedValue = dt.Rows[0]["ProjectID"].ToString();
                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["BlockID"].ToString()) && dt.Rows[0]["BlockID"] != null)
                {
                    Bindblock();
                    ddlBlockNumber.SelectedValue = dt.Rows[0]["BlockID"].ToString();
                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["FlatID"].ToString()) && dt.Rows[0]["FlatID"] != null)
                {
                    BindFlat();
                    ddlFlatNumber.SelectedValue = dt.Rows[0]["FlatID"].ToString();
                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["FlatID"].ToString()) && dt.Rows[0]["FlatID"] != null)
                {
                    BindFlat();
                    ddlFlatNumber.SelectedValue = dt.Rows[0]["FlatID"].ToString();
                    FlatFunction();
                }
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-customization-work-approval.aspx", "Bind", ex.Message, "Not Fixed");
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
            else
            {
                divrptCustomers.Style.Add("Display", "none");
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-customization-work-approval.aspx", "Bindprojects", ex.Message, "Not Fixed");
        }
    }
    protected void ddlProName_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bindblock();
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
                    ddlBlockNumber.DataSource = DT;
                    ddlBlockNumber.DataTextField = "BlockName";
                    ddlBlockNumber.DataValueField = "BlockID";
                    ddlBlockNumber.DataBind();
                    ddlBlockNumber.Items.Insert(0, new ListItem("", ""));
                    ddlFlatNumber.Items.Clear();
                    ddlFlatNumber.Items.Insert(0, new ListItem("", ""));
                    txtCustomerName.Text = "";
                    lblcustomernameerror.Text = "";
                }
                else
                {
                    ddlBlockNumber.Items.Clear();
                    ddlBlockNumber.Items.Insert(0, new ListItem("No block name", ""));
                    divrptCustomers.Style.Add("Display", "none");
                    ddlFlatNumber.Items.Clear();
                    ddlFlatNumber.Items.Insert(0, new ListItem("", ""));
                    txtCustomerName.Text = "";
                    lblcustomernameerror.Text = "";
                    txtCustomerName.Text = "";
                }
            }
            else
            {
                ddlBlockNumber.Items.Clear();
                ddlBlockNumber.Items.Insert(0, new ListItem("", ""));
                divrptCustomers.Style.Add("Display", "none");
                ddlFlatNumber.Items.Clear();
                ddlFlatNumber.Items.Insert(0, new ListItem("", ""));
                txtCustomerName.Text = "";
                lblcustomernameerror.Text = "";
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-customization-work-approval.aspx", "Bindblock", ex.Message, "Not Fixed");
        }
    }

    public bool Getreceiptstatus(int id)
    {
        bool isavail = true;
        try
        {
           
            if (KCWA.existworkapprovalbyid(Convert.ToString(id), Convert.ToString(Userid)))
            {
                isavail = false;
            }
        }
        catch(Exception ex)
        {
            CE.StoreExceptionMessage("add-customization-work-approval.aspx", "Getreceiptstatus", ex.Message, "Not Fixed");
        }
        return isavail;
    }
    protected void ddlBlockNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindFlat();
    }
    public void BindFlat()
    {
        try
        {
            if (!string.IsNullOrEmpty(ddlBlockNumber.SelectedValue))
            {
                DataTable DT = KF.ViewAllflatByBlockID(Convert.ToInt32(ddlBlockNumber.SelectedValue));
                if (DT.Rows.Count > 0)
                {
                    ddlFlatNumber.DataSource = DT;
                    ddlFlatNumber.DataTextField = "FlatName";
                    ddlFlatNumber.DataValueField = "FlatID";
                    ddlFlatNumber.DataBind();
                    ddlFlatNumber.Items.Insert(0, new ListItem("", ""));
                }
                else
                {
                    ddlFlatNumber.Items.Clear();
                    ddlFlatNumber.Items.Insert(0, new ListItem("", ""));
                    ddlFlatNumber.Items.Insert(1, new ListItem("No Flat number", ""));
                    divrptCustomers.Style.Add("Display", "none");
                }
            }
            else
            {
                ddlFlatNumber.Items.Clear();
                ddlFlatNumber.Items.Insert(0, new ListItem("", ""));
                txtCustomerName.Text = "";
                divrptCustomers.Style.Add("Display", "none");
                lblcustomernameerror.Text = "";
                txtCustomerName.Text = "";
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-customization-work-approval.aspx", "BindFlat", ex.Message, "Not Fixed");
        }
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
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["CWID"] == null)
        {
            Clear();
            //'Your action has been canceled.'
        }

        else
        {
            Response.Redirect("view-customization-work.aspx");
        }
    }
    public void Clear()
    {
        Response.Redirect(Request.Url.AbsolutePath);
    }
    protected void ddlFlatNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlFlatNumber.SelectedValue))
        {
            FlatFunction();
        }
        else
        {
            divrptCustomers.Style.Add("Display", "block");
            txtCustomerName.Text = "";
            divrptCustomers.Style.Add("Display", "none");
            lblcustomernameerror.Text = "";
        }
    }
    public void FlatFunction()
    {
        try
        {
            DataTable dt = KC.ViewAllflatBookingCustomerDetails(ddlProName.SelectedValue, ddlBlockNumber.SelectedValue, ddlFlatNumber.SelectedValue, "", "");
            if (dt != null && dt.Rows.Count > 0)
            {
                txtCustomerName.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["ApplicantFirstName"])) ? "N/A" : Convert.ToString(dt.Rows[0]["ApplicantFirstName"]);
                lblcustomernameerror.Text = "";
                divrptCustomers.Style.Add("Display", "block");
                BindCustomizationWorkList();

            }
            else
            {
                txtCustomerName.Text = "N/A";
                divrptCustomers.Style.Add("Display", "none");
                lblcustomernameerror.Text = "Selected flat has no customer records";  //due out
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-customization-work-approval.aspx", "FlatFunction", ex.Message, "Not Fixed");
        }
    }
    [System.Web.Services.WebMethod]
    public static string Updateapproval(string costLabelID, string title, string Amount, string selectedValue, string selectedStatus, string fileupload, string remarks)
    {
        string strret = string.Empty;
        string strfilename = string.Empty;
        int ID = 0;
        int ret = 0;
        string strClientID = string.Empty;
        ClientDashboardError CE = new ClientDashboardError();
        Key2hCustomisationWorkApproval KCWA = new Key2hCustomisationWorkApproval();
        HttpCookie LoginIDCookie = HttpContext.Current.Request.Cookies["clientid"];
        if (LoginIDCookie != null)
        {
            if (!string.IsNullOrEmpty(LoginIDCookie.Value) && LoginIDCookie.Value.Contains("clientid="))
            {
                strClientID = LoginIDCookie.Value.Replace("clientid=", "");
            }
            else
            {
                HttpContext.Current.Response.Redirect("index.aspx");
            }
        }
        else
        {
            HttpContext.Current.Response.Redirect("index.aspx", false);
        }
        try
        {
            if (KCWA.CustomisationWorkApprovalAlreadyExist(costLabelID, selectedValue, title, Convert.ToString(strClientID)) == 0)
            {
                KCWA.intCWAID = Convert.ToInt32(costLabelID);
                KCWA.strFlatID = selectedValue;
                KCWA.strCustomizationWork = title;
                KCWA.strCustomizationDetails = fileupload;
                KCWA.strApprovalStatus = selectedStatus;


                KCWA.strClientApprovalStatus = selectedStatus;




                KCWA.strRemarks = remarks;
                KCWA.strAmount = Amount;
                KCWA.strAddedBy = strClientID;

                ID = KCWA.UpdateCustomisationWorkApproval(KCWA);


                if (ID != 0)
                {
                    KCWA.intCWAID = Convert.ToInt32(costLabelID);
                    KCWA.strRemarks = remarks;
                    KCWA.strCustomizationDetails = fileupload;
                    KCWA.strCustomizationWork = title;
                    KCWA.strClientApprovalStatus = selectedStatus;
                    KCWA.strApprovalStatus = selectedStatus;
                    KCWA.strFlatID = selectedValue;
                    KCWA.strAmount = Amount;
                    ret = KCWA.AddCustomisationWorkApprovalHistory(KCWA);
                }


                if (ret == 1)
                {
                    strret = "Customization work approval details update successfully";
                }
                else
                {
                    strret = "Customization work approval details not update.";
                }
            }
            else
            {
                strret = "Customization work approval details already exist";
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-customization-work-approval.aspx", "UpdateCustomer", ex.Message, "Not Fixed");
        }
        return strret;
    }
    public class CostDetail
    {
        public int CWID { get; set; }
        public string WorkTitle { get; set; }
        public string WorkStatus { get; set; }
        public string Amount { get; set; }
    }
    [WebMethod]
    public static List<CostDetail> GetCostDetails(string selectedValue)
    {

        string strClientID = string.Empty;
        ClientDashboardError CE = new ClientDashboardError();
        Key2hCustomisationWorkApproval KCW = new Key2hCustomisationWorkApproval();
        List<CostDetail> costDetails = new List<CostDetail>();
        try
        {
            if (!string.IsNullOrEmpty(selectedValue))
            {
                DataTable dt = KCW.ViewAllCustomisationWorkApprovalByFlatIDandAddedBy(selectedValue, Convert.ToString(strClientID));
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        CostDetail costDetail = new CostDetail
                        {
                            CWID = Convert.ToInt32(row["CWAID"]),
                            WorkTitle = Convert.ToString(row["CustomizationWork"]),
                            WorkStatus = Convert.ToString(row["ApprovalStatus"]),
                            Amount = Convert.ToString(row["Amount"])
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
            CE.StoreExceptionMessage("add-customization-work-approval.aspx", "GetCostDetails", ex.Message, "Not Fixed");
        }
        return costDetails;
    }
    [WebMethod]
    public static string DeleteCustomizationWorksTitle(string CWID, string selectedValue)
    {
        string strClientID = string.Empty;
        ClientDashboardError CE = new ClientDashboardError();
        Key2hCustomisationWorkApproval KCWA = new Key2hCustomisationWorkApproval();
        HttpCookie LoginIDCookie = HttpContext.Current.Request.Cookies["clientid"];
        if (LoginIDCookie != null)
        {
            if (!string.IsNullOrEmpty(LoginIDCookie.Value) && LoginIDCookie.Value.Contains("clientid="))
            {
                strClientID = LoginIDCookie.Value.Replace("clientid=", "");
            }
            else
            {
                HttpContext.Current.Response.Redirect("index.aspx");
            }
        }
        else
        {
            HttpContext.Current.Response.Redirect("index.aspx", false);
        }
        string strerror = string.Empty;
        int ret = 0;
        try
        {
            ret = KCWA.DeleteCustomisationWorkApprovalByCWAIDandaddedby(CWID, strClientID);
            if (ret == 1)
            {
                strerror = "1";
            }
            else
            {
                strerror = "0";
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-customization-work-approval.aspx", "DeleteCustomizationWorksTitle", ex.Message, "Not Fixed");
        }
        return strerror;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string labelerror = string.Empty;
        if (string.IsNullOrEmpty(ddlProName.SelectedValue) && string.IsNullOrEmpty(ddlBlockNumber.SelectedValue) &&
            string.IsNullOrEmpty(ddlFlatNumber.SelectedValue) && string.IsNullOrEmpty(txtCustomerName.Text)
            && string.IsNullOrEmpty(txtWorkTitle.Text)
            && string.IsNullOrEmpty(txtAmount.Text))
        {
            labelerror = "Fill the mandatory field.";
        }
        else if (string.IsNullOrEmpty(ddlProName.SelectedValue))
        {
            labelerror = "Select project name";
        }
        else if (string.IsNullOrEmpty(ddlBlockNumber.SelectedValue))
        {
            labelerror = "Select block no.";
        }
        else if (string.IsNullOrEmpty(ddlFlatNumber.SelectedValue))
        {
            labelerror = "Select flat no.";
        }
        else if (string.IsNullOrEmpty(txtCustomerName.Text))
        {
            labelerror = "Enter customer name";
        }
        else if (string.IsNullOrEmpty(txtWorkTitle.Text))
        {
            labelerror = "Enter work title";
        }
        //else if (string.IsNullOrEmpty(ddlApprovalstatus.SelectedValue))
        //{
        //    labelerror = "Select approval status";
        //}
        else if (string.IsNullOrEmpty(txtAmount.Text))
        {
            labelerror = "Enter amount";
        }
        if (string.IsNullOrEmpty(labelerror))
        {
            if (string.IsNullOrEmpty(lblcustomernameerror.Text))
            {

                if (KCWA.CustomisationWorkApprovalAlreadyExist("", ddlFlatNumber.SelectedValue, txtWorkTitle.Text, Convert.ToString(Userid)) == 0)
                {
                    int ret = 0;
                    ret = AddData();
                    if (ret == 1)
                    {
                        ddlApprovalstatus.SelectedIndex = 0;
                        txtWorkTitle.Text = "";
                        txtAmount.Text = "";
                        txtRemarks.Text = "";
                        ScriptManager.RegisterStartupScript(UpdatePanel9, UpdatePanel9.GetType(), "alert",
                         "Swal.fire({ " +
                         "  title: 'Customization work approval details added successfully', " +
                         "  icon: 'success', " +
                         "  customClass: { " +
                         "    icon: 'handle-icon-clr', " +
                         "    confirmButton: 'handle-btn-success' " +
                         "  } " +
                         "});", true);
                        divrptCustomers.Style.Add("Display", "block");
                        UpdatePanel9.Update();
                        BindCustomizationWorkList();
                    }
                    else
                    {
                        string script = string.Format(@" <script>
                         Swal.fire({{
                         title: 'Customization work approval details not added due to a server or network issue',
                         confirmButtonText: 'OK',
                         customClass: {{
                            confirmButton: 'handle-btn-success'
                         }}
                         }}).then((result) => {{
                            window.location.href = 'add-customization-work-approval.aspx';
                         }});
                         </script>");
                        ClientScript.RegisterStartupScript(this.GetType(), "alertAndRedirect", script, false);
                    }
                }
                else
                {

                    //maximum limit 10


                    ScriptManager.RegisterStartupScript(UpdatePanel9, UpdatePanel9.GetType(), "alert",
                    "Swal.fire({ " +
                    "  title: 'The customization work approval already exist', " +
                    "  confirmButtonText: 'OK'," +
                    "  customClass: { " +
                    "    icon: 'handle-icon-clr', " +
                    "    confirmButton: 'handle-btn-success' " +
                    "  } " +
                    "});", true);

                    divrptCustomers.Style.Add("Display", "block");
                    UpdatePanel9.Update();
                    BindCustomizationWorkList();
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "Swal.fire('Validation Alert', '" + lblcustomernameerror.Text + "!', customClass: { confirmButton: 'handle-btn-success' } });", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
           "Swal.fire('Validation Alert', '" + labelerror + "!', customClass: { confirmButton: 'handle-btn-success' } });", true);
        }

    }
    public void BindCustomizationWorkList()
    {
        try
        {
            if (!string.IsNullOrEmpty(ddlFlatNumber.SelectedValue))
            {
                DataTable dt = KCWA.ViewAllCustomisationWorkApprovalByFlatIDandAddedBy(ddlFlatNumber.SelectedValue, Userid);
                if (dt != null && dt.Rows.Count > 0)
                {
                    divrptCustomers.Style.Add("Display", "block");
                    rpCustomization.Visible = true;
                    rpCustomization.DataSource = dt;
                    rpCustomization.DataBind();
                }
                else
                {
                    divrptCustomers.Style.Add("Display", "none");
                    rpCustomization.Visible = false;
                }
            }
            else
            {
                divrptCustomers.Style.Add("Display", "none");
                rpCustomization.Visible = false;
            }
        }

        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-customization-work-approval.aspx", "BindCustomizationWorkList", ex.Message, "Not Fixed");
        }
    }
    public int AddData()
    {
        string strfilename = string.Empty;
        int ID = 0;
        int ret = 0;
        try
        {
            KCWA.strFlatID = ddlFlatNumber.SelectedValue;
            KCWA.strCustomizationWork = txtWorkTitle.Text;
            strfilename = SaveFile(flDemandUpload, "CustomizationWorkDetailsDoc", ddlFlatNumber.SelectedValue);
            KCWA.strCustomizationDetails = strfilename;
            if (!string.IsNullOrEmpty(ddlApprovalstatus.SelectedItem.Text))
            {
                KCWA.strApprovalStatus = ddlApprovalstatus.SelectedItem.Text;
                KCWA.strClientApprovalStatus = ddlApprovalstatus.SelectedItem.Text;
            }
            else
            {
                KCWA.strApprovalStatus = "Pending";
                KCWA.strClientApprovalStatus = "Pending";
            }

            
            KCWA.strRemarks = txtRemarks.Text;
            KCWA.strAmount = Convert.ToString(txtAmount.Text.Contains("₹") ? txtAmount.Text.Replace("₹", "") : txtAmount.Text);
            KCWA.strAddedBy = Userid;
            ID = KCWA.AddCustomisationWorkApproval(KCWA);


            if (ID != 0)
            {
                KCWA.intCWAID = ID;
                KCWA.strRemarks = txtRemarks.Text;
                KCWA.strCustomizationDetails = strfilename;
                KCWA.strCustomizationWork = txtWorkTitle.Text;
                KCWA.strClientApprovalStatus = "Pending";
                KCWA.strApprovalStatus = ddlApprovalstatus.SelectedItem.Text;
                KCWA.strFlatID = ddlFlatNumber.SelectedValue;
                KCWA.strAmount = txtAmount.Text;
                ret = KCWA.AddCustomisationWorkApprovalHistory(KCWA);
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-customization-work-approval.aspx", "AddCustomWorkdetails", ex.Message, "Not Fixed");
        }
        return ret;
    }
    public string SaveFile(FileUpload uploadedFile, string appkey, string Projectname)
    {
        int savefile = 0;
        string filename = string.Empty;
        try
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
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-customization-work-approval.aspx", "SaveFile", ex.Message, "Not Fixed");
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
        var randomBytes = new byte[length];
        using (var rng = RandomNumberGenerator.Create())
        {
            rng.GetBytes(randomBytes);
        }
        var result = new char[length];
        for (int i = 0; i < length; i++)
        {
            result[i] = chars[randomBytes[i] % chars.Length];
        }
        return new string(result);
    }












}