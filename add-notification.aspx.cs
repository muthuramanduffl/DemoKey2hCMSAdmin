using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Configuration;
using System.Text;
using System.Data.SqlClient;
using System.Activities.Statements;
using System.Security.Cryptography;

public partial class adminkey2hcom_AddBroadcast : System.Web.UI.Page
{
    Key2hProject k2 = new Key2hProject();
    Key2hFlat KF = new Key2hFlat();
    Key2hProjectbroadcast K2b = new Key2hProjectbroadcast();
    ClientUsers CU = new ClientUsers();
    Key2hProjectblock KB = new Key2hProjectblock();
    ClientDashboardError CI = new ClientDashboardError();
    Key2hCustomer KC = new Key2hCustomer();


    public static string Userid;

    protected void Page_Load(object sender, EventArgs e)
    {
        Userid = CU.GetClientLoginID();

        if (!IsPostBack)
        {
            Bindprojects();
            btnSave.Text = "Send Now";
            lbldisplaytext.Text = "Send Customer Notification";
            ddlprojects.Enabled = true;
            ddlBlockNumber.Enabled = true;
            ddlFlatNumber.Enabled = true;
        }

    }
    public void Bindprojects()
    {
        try
        {
            DataTable dt = k2.ViewActiveprojects();
            if (dt.Rows.Count > 0)
            {
                ddlprojects.DataSource = dt;
                ddlprojects.DataTextField = "ProjectName";
                ddlprojects.DataValueField = "ProjectID";
                ddlprojects.DataBind();
                ddlprojects.Items.Insert(0, new ListItem("", ""));
                //ddlprojects.SelectedValue = "18";
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-notification.aspx", "Bindprojects", ex.Message, "Not Fixed");
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
            if (!string.IsNullOrEmpty(ddlprojects.SelectedValue))
            {
                DataTable DT = KB.ViewBlockbyProjectID(Convert.ToInt32(ddlprojects.SelectedValue));

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
                    ddlFlatNumber.Items.Clear();
                    ddlFlatNumber.Items.Insert(0, new ListItem("", ""));
                    txtCustomerName.Text = "";
                    lblcustomernameerror.Text = "";

                }
            }
            else
            {
                ddlBlockNumber.Items.Clear();
                ddlBlockNumber.Items.Insert(0, new ListItem("", ""));
                ddlFlatNumber.Items.Clear();
                ddlFlatNumber.Items.Insert(0, new ListItem("", ""));
                txtCustomerName.Text = "";
                lblcustomernameerror.Text = "";
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-notification.aspx", "Bindblock", ex.Message, "Not Fixed");
        }
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
                }
            }


            else
            {
                ddlFlatNumber.Items.Clear();
                ddlFlatNumber.Items.Insert(0, new ListItem("", ""));
                txtCustomerName.Text = "";
                lblcustomernameerror.Text = "";
            }

        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-notification.aspx", "BindFlat", ex.Message, "Not Fixed");
        }
    }
    protected void ddlFlatNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlFlatNumber.SelectedValue))
        {
            Flatfunction();
        }
        else
        {
            txtCustomerName.Text = "";
            lblcustomernameerror.Text = "";
        }
    }
    public void Flatfunction()
    {
        try
        {
            if (!string.IsNullOrEmpty(ddlFlatNumber.SelectedValue) && !string.IsNullOrEmpty(ddlBlockNumber.SelectedValue) && !string.IsNullOrEmpty(ddlprojects.SelectedValue))
            {
                DataTable dt = KC.AlreadyExistProjectdetails(Convert.ToInt32(ddlprojects.SelectedValue), Convert.ToInt32(ddlBlockNumber.SelectedValue), Convert.ToInt32(ddlFlatNumber.SelectedValue));
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtCustomerName.Text = string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["ApplicantFirstName"])) ? "N/A" : Convert.ToString(dt.Rows[0]["ApplicantFirstName"]);
                }
                else
                {
                    txtCustomerName.Text = "N/A";
                }
            }
            else
            {
                txtCustomerName.Text = "";
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-notification.aspx", "Flatfunction", ex.Message, "Not Fixed");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string Labelerror = string.Empty;

        if (string.IsNullOrEmpty(ddlprojects.SelectedValue) && string.IsNullOrEmpty(txtMessage.Text))
        {
            Labelerror = "Fill all the field";
        }
        else if (string.IsNullOrEmpty(ddlprojects.SelectedValue))
        {
            Labelerror = "Select project";
        }
        else if (string.IsNullOrEmpty(ddltitle.SelectedValue))
        {
            Labelerror = "Select title";
        }
        else if (string.IsNullOrEmpty(txtMessage.Text))
        {
            Labelerror = "Enter message";
        }
        if (string.IsNullOrEmpty(Labelerror))
        {
            // if (AddBroadcast() == 1)
            // {
            try
            {
                string fcm_token = GetFCMTokenByFlatID(Convert.ToInt32(ddlFlatNumber.SelectedValue));
                AddNotificationToFlat(Convert.ToInt32(ddlFlatNumber.SelectedValue), ddltitle.SelectedValue, txtMessage.Text, ddlprojects.SelectedValue);

                string apiResponse = CallSendNotificationToUserAPI(fcm_token, ddltitle.SelectedValue, txtMessage.Text);
                lblerrormsg.Text = apiResponse;
                if (!string.IsNullOrEmpty(apiResponse) && apiResponse.Contains("\"success\":true"))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "Swal.fire({ " + "  title: 'Notification sent successfully!', " +
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
                    // Extract the error message from the API response
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "Swal.fire({ " + "  title: 'Notification has been failed to send.', " +
                    "  customClass: { " +
                    "    confirmButton: 'handle-btn-error' " + "  } " + "});", true);
                }
            }
            catch (Exception ex)
            {
                CI.StoreExceptionMessage("add-notification.aspx", "btnsubmit", ex.Message, "Not Fixed");
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "Swal.fire({ " +
                            "  title: '" + Labelerror + "', " +
                           "  confirmButtonText: 'OK', " +
                           "  customClass: { " +
                            "      confirmButton: 'handle-btn-success', " +
                            "  }" +
                            "});", true);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
        if (Request.QueryString["BlockID"] == null)
        {
            //Your action has been canceled. 
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
            "Swal.fire({ " +
            "   title: 'Broadcast details has been cancelled as requested', " +
            "   confirmButtonText: 'OK', " +
            "   customClass: { " +
            "       confirmButton: 'handle-btn-success' " +
            "   } " +
            "}).then((result) => { " +
            "    window.location.href = '" + Request.Url.AbsolutePath + "'; " +
            "});", true);
        }
    }
    public int AddBroadcast()
    {
        int ret = 0;
        try
        {
            K2b.ProjectID = Convert.ToInt32(ddlprojects.SelectedValue);
            K2b.Title = ddltitle.SelectedValue;
            K2b.MessageContent = txtMessage.Text;
            K2b.Addedby = Userid;
            ret = K2b.AddBroadcast(K2b);
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-notification.aspx", "AddBroadcast", ex.Message, "Not Fixed");
        }
        //K2b.AddBroadcastToFlats(K2b);
        return ret;
    }
    public void Clear()
    {
        ddlprojects.SelectedIndex = 0;
        txtMessage.Text = "";
        Response.Redirect(Request.Url.AbsolutePath);
    }
    private string NotifyBroadcastAPI()
    {
        string apiUrl = "https://dbadmin.key2h.com/api/broadcasts/notify"; // Replace with your API URL
        try
        {
            using (HttpClient client = new HttpClient())
            {
                string username = ConfigurationManager.AppSettings["ApiUsername"];
                string password = ConfigurationManager.AppSettings["ApiPassword"];
                string authHeader = Convert.ToBase64String(Encoding.ASCII.GetBytes(username + ":" + password));
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", authHeader);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage response = client.PostAsync(apiUrl, null).Result;
                if (response.IsSuccessStatusCode)
                {
                    // Log the API response for debugging
                    string apiResponse = response.Content.ReadAsStringAsync().Result;
                    // Pass the API response message to the client-side popup
                    string message = "Notification sent successfully: {apiResponse}";
                    return apiResponse;
                }
                else
                {
                    string errorMessage = "Error: {response.StatusCode} - {response.ReasonPhrase}";
                    // Show error message in the label
                    lblError.Text = errorMessage;
                    return errorMessage;
                }
            }
        }
        catch (Exception ex)
        {
            string exceptionMessage = "Exception: {ex.Message}";
            // Show exception message in the label
            lblError.Text = exceptionMessage;
            return exceptionMessage;
        }
    }
    public string GetSqlConnection()
    {
        string connectionString = null;
        try
        {
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Key2h"].ConnectionString;
        }
        catch (Exception ex)
        {
            // Log the exception or handle it
            Console.WriteLine(ex.Message); // or log it to a file or monitoring system
        }
        return connectionString;
    }
    private string GetFCMTokenByFlatID(int flatId)
    {
        string connectionString = GetSqlConnection(); // Fixed variable name
        using (SqlConnection cnn = new SqlConnection(connectionString))
        {
            cnn.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT TokenID FROM tblFlatCustomerBookingDetails WHERE FlatID = @FlatID", cnn))
            {
                cmd.Parameters.AddWithValue("@FlatID", flatId);
                object result = cmd.ExecuteScalar();
                return result != null ? result.ToString() : string.Empty;
            }
        }
    }
    private string CallSendNotificationToUserAPI(string fcmToken, string title, string message)
    {
        string apiUrl = "https://dbadmin.key2h.com/api/broadcasts/sendtouser"; // Replace with your API URL
        try
        {
            using (HttpClient client = new HttpClient())
            {
                string username = ConfigurationManager.AppSettings["ApiUsername"];
                string password = ConfigurationManager.AppSettings["ApiPassword"];
                string authHeader = Convert.ToBase64String(Encoding.ASCII.GetBytes(username + ":" + password));
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", authHeader);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                // Create the request data object
                var requestData = new
                {
                    fcm_token = fcmToken,
                    title = title,
                    message = message
                };

                // Serialize the request data using JavaScriptSerializer
                var serializer = new JavaScriptSerializer();
                string jsonData = serializer.Serialize(requestData);

                // Send POST request with the serialized JSON data
                StringContent content = new StringContent(jsonData, Encoding.UTF8, "application/json");
                HttpResponseMessage response = client.PostAsync(apiUrl, content).Result;

                if (response.IsSuccessStatusCode)
                {
                    // Log the API response for debugging
                    string apiResponse = response.Content.ReadAsStringAsync().Result;
                    // Return the response for further handling
                    return apiResponse;
                }
                else
                {
                    string errorMessage = "Error: {response.StatusCode} - {response.ReasonPhrase}";
                    // Show error message in the label
                    //lblError.Text = errorMessage;
                    return errorMessage;
                }
            }
        }
        catch (Exception ex)
        {
            string exceptionMessage = "Exception: {ex.Message}";
            // Show exception message in the label
            //lblError.Text = exceptionMessage;
            return exceptionMessage;
        }
    }
    private void AddNotificationToFlat(int flatId, string title, string message, string ProjectID)
    {
        try
        {
            string connectionString = GetSqlConnection(); // Fixed variable name
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                cnn.Open();
                using (SqlCommand cmd = new SqlCommand("INSERT INTO tblFlatNotifications (FlatID, Title, Message, CreatedDate, ReadStatus, ListStatus, AddedBy, ProjectID) VALUES (@FlatID, @Title, @Message, @CreatedDate,  @ReadStatus, @ListStatus, @AddedBy, @ProjectID)", cnn))
                {
                    cmd.Parameters.AddWithValue("@FlatID", flatId);
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Message", message);
                    cmd.Parameters.AddWithValue("@CreatedDate", Utility.IndianTime);
                    cmd.Parameters.AddWithValue("@ReadStatus", false);
                    cmd.Parameters.AddWithValue("@ListStatus", true);
                    cmd.Parameters.AddWithValue("@AddedBy", "1");
                    cmd.Parameters.AddWithValue("@ProjectID", ProjectID);
                    cmd.ExecuteNonQuery();
                }
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-notification.aspx", "AddNotificationToFlat", ex.Message, "Not Fixed");
        }
    }

}