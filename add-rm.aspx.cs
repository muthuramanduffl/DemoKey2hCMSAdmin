﻿using System; 
using System.Data; 
using System.Web.UI; 
using System.Text;

public partial class adminkey2hcom_AddRM : System.Web.UI.Page
{
    Key2hProject K2 = new Key2hProject();
    ClientDashboardError CI = new ClientDashboardError();
    ClientUsers CU = new ClientUsers();
    Key2hProjectRM KF = new Key2hProjectRM();
    string clientId = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        clientId = CU.GetClientLoginID();
        if (!IsPostBack)
        {
            if (Request.QueryString["RMID"] != null)
            {
                int value = 0;
                if (int.TryParse(Request.QueryString["RMID"], out value))
                {
                    lbldisplaymsg.Text = " Edit Relationship Manager";
                    btnSave.Text = "Update";
                    Bind(Convert.ToInt32(Request.QueryString["RMID"]));
                }
                else
                {
                    string script = string.Format(@"<script> Swal.fire({{ title: ' URL is incorrect. please try again', 
                    confirmButtonText: 'OK', customClass: {{ confirmButton: 'handle-btn-success'  }}}}).then((result) => {{
                    window.location.href = 'view-rm.aspx';}}); </script>");

                    ClientScript.RegisterStartupScript(this.GetType(), "alertAndRedirect", script, false); 
                }
            }
            else
            {
                lbldisplaymsg.Text = " Add Relationship Manager";
                btnSave.Text = "Submit"; 
            } 
        } 
    }

    public void Bind(int id)
    { 
        try
        {
            DataTable dt = KF.ViewRMDetailbyRMID(id); 
            if (dt.Rows.Count > 0)
            { 
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Name"])))
                {
                    txtName.Text = Convert.ToString(dt.Rows[0]["Name"]);
                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["PhoneNumber"])))
                {
                    txtContactNumber.Text = Convert.ToString(dt.Rows[0]["PhoneNumber"]);
                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["WhatsappNumber"])))
                {
                    txtwhatsappnumber.Text = Convert.ToString(dt.Rows[0]["WhatsappNumber"]);
                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Password"])))
                {
                    txtPassword.Text = decrypt(Convert.ToString(dt.Rows[0]["Password"]));
                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["UserEmailID"])))
                {
                    txtEmailid.Text = Convert.ToString(dt.Rows[0]["UserEmailID"]);
                }

                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Gender"])))
                {
                    ddlGender.SelectedValue = Convert.ToString(dt.Rows[0]["Gender"]);
                } 
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-rm.aspx", "SaveDetails", ex.Message, "Not Fixed");
        }
    }
     
    protected void btnSave_Click1(object sender, EventArgs e)
    {
        string labelerror = string.Empty;
        if (string.IsNullOrEmpty(txtName.Text)
           && string.IsNullOrEmpty(txtwhatsappnumber.Text) && string.IsNullOrEmpty(txtEmailid.Text)
           && string.IsNullOrEmpty(txtPassword.Text) && string.IsNullOrEmpty(txtContactNumber.Text))
        {
            labelerror = "Fill all the mandatory fields";
        }
        else if (string.IsNullOrEmpty(txtName.Text))
        {
            labelerror = "Enter name";
        }
        else if (string.IsNullOrEmpty(txtContactNumber.Text))
        {
            labelerror = "Enter mobile no.";
        }
        else if (string.IsNullOrEmpty(txtwhatsappnumber.Text))
        {
            labelerror = "Enter whatsapp no.";
        }
        else if (string.IsNullOrEmpty(txtEmailid.Text))
        {
            labelerror = "Enter email id";
        }
        else if (string.IsNullOrEmpty(txtPassword.Text))
        {
            labelerror = "Enter password";
        } 
        if (string.IsNullOrEmpty(labelerror))
        { 
            if (Request.QueryString["RMID"] == null)
            {
                int ret = 0;
                ret = AddRMDetails();
                if (ret == 1)
                { 
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "Swal.fire({ " + "  title: 'Relationship manager details added successfully', " +
                            "  icon: 'success', " +
                            "  allowOutsideClick: 'true', " +
                            "  customClass: { " +
                            "    icon: 'handle-icon-clr', " +
                            "    confirmButton: 'handle-btn-success' " +
                            "  } " +
                            "}).then((result) => { " +
                            "  window.location.href = '" + Request.Url.AbsolutePath + "'; " +
                            "});", true);
                }
                else
                { 
                    //need popup content.
                    string script = string.Format(@" <script> Swal.fire({{ 
                            title: 'Relationship manager details couldn't be added due to a server or network issue. Please try again in some time!', 
                            confirmButtonText: 'OK',  
                            customClass: {{ confirmButton: 'handle-btn-success' }} 
                        }}).then((result) => {{ 
                             window.location.href = 'add-rm.aspx';  
                        }}); </script>");

                    ClientScript.RegisterStartupScript(this.GetType(), "alertAndRedirect", script, false); 
                }
            }
            else
            {
                int ret = 0;
                ret = UpdateRMDetails();
                if (ret == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                        "Swal.fire({ " +
                        "  title: 'RM details updated successfully', " +
                        "    icon: 'success', " +
                        "    allowOutsideClick: 'true', " +
                        "    customClass: { " +
                        "        confirmButton: 'handle-btn-success', " +
                        "        icon: 'handle-icon-clr' " +
                        "    } " +
                        "}).then((result) => { " +
                        "    window.location.href = 'view-rm.aspx'; " + 
                        "});", true); 
                }
                else
                {
                    string script = string.Format(@"<script>
                        Swal.fire({{
                            title: 'RM details couldn't be updated due to a server or network issue. Please try again in some time!', 
                            confirmButtonText: 'OK', 
                            customClass: {{ confirmButton: 'handle-btn-success' }} 
                        }}).then((result) => {{ 
                                window.location.href = 'add-rm.aspx?RMID={0}';  
                        }});
                    </script>",
                     System.Web.HttpUtility.JavaScriptStringEncode(Convert.ToString(Request.QueryString["RMID"]))); 
                    ClientScript.RegisterStartupScript(this.GetType(), "SwalNotification", script, false);
                } 
            }
        }

        else
        {
            //alert labelerror 
        }

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
       
        if (Request.QueryString["RMID"] == null)
        {
            Clear();
        }
        else
        {
            Response.Redirect("view-rm.aspx");
        }
    }

    public int AddRMDetails()
    { 
        int ret = 0;
        try
        {
            KF.UserEmailId = txtEmailid.Text;
            KF.Username = txtEmailid.Text;
            KF.Name = txtName.Text;
            KF.Phonenumber = txtContactNumber.Text;
            KF.WhatsappNumber = txtwhatsappnumber.Text;
            KF.Password = Encrypt(txtPassword.Text.Trim());
            KF.Role = "RM";
            KF.Photo = "";
            KF.Gender = ddlGender.SelectedValue; 
            if (ddlGender.SelectedValue == "Male")
            {
                KF.Salutation = "Mr.";
            }
            else if (ddlGender.SelectedValue == "Female")
            {
                KF.Salutation = "Ms.";
            }
            else
            {
                KF.Salutation = "Ms.";
            }
            KF.UserStatus = true;
            KF.AddedBy = clientId;
            KF.ClientID = Convert.ToInt32(clientId);
            ret = KF.AddRMDetails(KF);
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-rm.aspx", "AddRMDetails", ex.Message, "Not Fixed");
        }
        return ret;
    }

    public int UpdateRMDetails()
    {
        int ret = 0;
        try
        {
            KF.UserID = Convert.ToInt32(Request.QueryString["RMID"]);
        KF.UserEmailId = txtEmailid.Text;
        KF.Username = txtEmailid.Text;
        KF.Name = txtName.Text;
        KF.Phonenumber = txtContactNumber.Text;
        KF.WhatsappNumber = txtwhatsappnumber.Text;
        KF.Password = Encrypt(txtPassword.Text);
        KF.Role = "RM";
        KF.Photo = "";
        KF.Gender = ddlGender.SelectedValue; 
        if (ddlGender.SelectedValue == "Male")
        {
            KF.Salutation = "Mr.";
        }
        else if (ddlGender.SelectedValue == "Female")
        {
            KF.Salutation = "Ms.";
        }
        else
        {
            KF.Salutation = "Ms.";
        }
        KF.UserStatus = true;
        KF.UpdatedBy = Convert.ToString(clientId);
        ret = KF.UpdateRMDetails(KF);
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-rm.aspx", "UpdateRMDetails", ex.Message, "Not Fixed");
        }
        return ret;
    }
     
    public void Clear()
    { 

        Response.Redirect(Request.Url.AbsolutePath);
    }

    public string Encrypt(string encrypt)
    {
        string finalencrypt = string.Empty;
        byte[] encode = new byte[encrypt.Length];
        encode = Encoding.UTF8.GetBytes(encrypt);
        finalencrypt = Convert.ToBase64String(encode);
        return finalencrypt;
    }

    public string decrypt(string encryptpswd)
    {
        string strDecrypt = string.Empty;
        UTF8Encoding Encode = new UTF8Encoding();
        Decoder Decod = Encode.GetDecoder();
        byte[] todecode = Convert.FromBase64String(encryptpswd);
        int charcount = Decod.GetCharCount(todecode, 0, todecode.Length);
        char[] chardecode = new char[charcount];
        Decod.GetChars(todecode, 0, todecode.Length, chardecode, 0); 
        strDecrypt = new string(chardecode);
        return strDecrypt;
    }

}