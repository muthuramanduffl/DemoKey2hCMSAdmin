using System;
using System.Data;
using System.Security.Cryptography;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections.Generic;

public partial class addprojecthomescreen : System.Web.UI.Page
{
    ClientDashboardError CI = new ClientDashboardError();

    Key2hProject K2 = new Key2hProject();
    ClientUsers CU = new ClientUsers();
    public static string Userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        Userid = CU.GetClientLoginID();

        if (!IsPostBack)
        {
            Bindprojects();
            if (Request.QueryString["ProjectID"] != null)
            {
                int value = 0;
                if (int.TryParse(Request.QueryString["ProjectID"], out value))
                {
                    lbldisplaymsg.Text = " Edit Project home Screen";
                    btnSave.Text = "Update";
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
                                window.location.href = 'add-project-home-screen.aspx'; 
                        }});
                    </script>");
                    ClientScript.RegisterStartupScript(this.GetType(), "alertAndRedirect", script, false);
                }
            }
            else
            {
                lbldisplaymsg.Text = " Add Project home Screen";
                btnSave.Text = "Submit";
            }
        }
    }
    public void Bind(int ID)
    {
        try
        {
            DataTable dt = K2.ViewAllProjectHomeScreenByFilter(Convert.ToString(ID), "", Userid);
            if (dt != null && dt.Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(dt.Rows[0]["ProjectID"].ToString()) && dt.Rows[0]["ProjectID"] != null)
                {
                    ddlProName.SelectedValue = dt.Rows[0]["ProjectID"].ToString();

                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["HighlightImage1"].ToString()) && dt.Rows[0]["HighlightImage1"] != null)
                {

                    hdnfluploadhighlight1.Value = dt.Rows[0]["HighlightImage1"].ToString();
                    string filepath = System.Configuration.ConfigurationManager.AppSettings["HiglightsImages"];
                    string fullFilePath = Path.Combine(filepath.Trim(), hdnfluploadhighlight1.Value); // Corrected to hdnApplicantPAN
                    string fileUrl = fullFilePath;
                    string formattedImagePath = HttpUtility.JavaScriptStringEncode(fileUrl);
                    string script = string.Format("bindImageToPreview('{0}', 0);", fileUrl); // Use unique script name
                    ClientScript.RegisterStartupScript(this.GetType(), "bindImage1", script, true);

                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["HighlightImage2"].ToString()) && dt.Rows[0]["HighlightImage2"] != null)
                {
                    hdnfluploadhighlight2.Value = dt.Rows[0]["HighlightImage2"].ToString();
                    string filepath = System.Configuration.ConfigurationManager.AppSettings["HiglightsImages"];
                    string fullFilePath = Path.Combine(filepath.Trim(), hdnfluploadhighlight2.Value); // Corrected to hdnApplicantPAN
                    string fileUrl = fullFilePath;
                    string formattedImagePath = HttpUtility.JavaScriptStringEncode(fileUrl);
                    string script = string.Format("bindImageToPreview('{0}', 1);", fileUrl); // Use unique script name
                    ClientScript.RegisterStartupScript(this.GetType(), "bindImage2", script, true);

                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["HighlightImage3"].ToString()) && dt.Rows[0]["HighlightImage3"] != null)
                {
                    hdnfluploadhighlight3.Value = dt.Rows[0]["HighlightImage3"].ToString();
                    string filepath = System.Configuration.ConfigurationManager.AppSettings["HiglightsImages"];
                    string fullFilePath = Path.Combine(filepath.Trim(), hdnfluploadhighlight3.Value); // Corrected to hdnApplicantPAN
                    string fileUrl = fullFilePath;
                    string formattedImagePath = HttpUtility.JavaScriptStringEncode(fileUrl);
                    string script = string.Format("bindImageToPreview('{0}', 2);", fileUrl); // Use unique script name
                    ClientScript.RegisterStartupScript(this.GetType(), "bindImage3", script, true);


                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["HighlightImage4"].ToString()) && dt.Rows[0]["HighlightImage4"] != null)
                {
                    hdnfluploadhighlight4.Value = dt.Rows[0]["HighlightImage4"].ToString();
                    string filepath = System.Configuration.ConfigurationManager.AppSettings["HiglightsImages"];
                    string fullFilePath = Path.Combine(filepath.Trim(), hdnfluploadhighlight4.Value); // Corrected to hdnApplicantPAN
                    string fileUrl = fullFilePath;
                    string formattedImagePath = HttpUtility.JavaScriptStringEncode(fileUrl);
                    string script = string.Format("bindImageToPreview('{0}', 3);", fileUrl); // Use unique script name
                    ClientScript.RegisterStartupScript(this.GetType(), "bindImage4", script, true);


                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["HighlightImage5"].ToString()) && dt.Rows[0]["HighlightImage5"] != null)
                {
                    hdnfluploadhighlight5.Value = dt.Rows[0]["HighlightImage5"].ToString();
                    string filepath = System.Configuration.ConfigurationManager.AppSettings["HiglightsImages"];
                    string fullFilePath = Path.Combine(filepath.Trim(), hdnfluploadhighlight5.Value); // Corrected to hdnApplicantPAN
                    string fileUrl = fullFilePath;
                    string formattedImagePath = HttpUtility.JavaScriptStringEncode(fileUrl);
                    string script = string.Format("bindImageToPreview('{0}', 4);", fileUrl); // Use unique script name
                    ClientScript.RegisterStartupScript(this.GetType(), "bindImage5", script, true);



                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["Splacescreen"].ToString()) && dt.Rows[0]["Splacescreen"] != null)
                {

                    hdnsplacescreen.Value = dt.Rows[0]["Splacescreen"].ToString();
                    string filepath = System.Configuration.ConfigurationManager.AppSettings["SplacescreenImage"];
                    string fullFilePath = Path.Combine(filepath.Trim(), hdnsplacescreen.Value); // Corrected to hdnApplicantPAN
                    string fileUrl = fullFilePath;
                    string formattedImagePath = HttpUtility.JavaScriptStringEncode(fileUrl);
                    string script = string.Format("bindImageToPreview('{0}', 5);", fileUrl); // Use unique script name
                    ClientScript.RegisterStartupScript(this.GetType(), "bindImage6", script, true);


                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["Logo"].ToString()) && dt.Rows[0]["Logo"] != null)
                {

                    hdnUploadLOGO.Value = dt.Rows[0]["Logo"].ToString();
                    string filepath = System.Configuration.ConfigurationManager.AppSettings["ProjectLogo"];
                    string fullFilePath = Path.Combine(filepath.Trim(), hdnUploadLOGO.Value); // Corrected to hdnApplicantPAN
                    string fileUrl = fullFilePath;
                    string formattedImagePath = HttpUtility.JavaScriptStringEncode(fileUrl);
                    string script = string.Format("bindImageToPreview('{0}', 6);", fileUrl); // Use unique script name
                    ClientScript.RegisterStartupScript(this.GetType(), "bindImage7", script, true);


                }
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-project-home-screen.aspx", "Bind", ex.Message, "Not Fixed");
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
            CI.StoreExceptionMessage("add-project-home-screen.aspx", "Bindprojects", ex.Message, "Not Fixed");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string labelerror = string.Empty;
        if (string.IsNullOrEmpty(ddlProName.SelectedValue))
        {
            labelerror = "Fill the mandatory fields.";
        }
        else if (string.IsNullOrEmpty(ddlProName.SelectedValue))
        {
            labelerror = "Select project name";
        }
        else if (Request.QueryString["ProjectID"] == null)
        {
            if (!fluploadhighlight1.HasFile && !fluploadhighlight2.HasFile && !fluploadhighlight3.HasFile && !fluploadhighlight4.HasFile && !fluploadhighlight5.HasFile)
            {
                labelerror = "Please upload at least one highlight";
            }
            else if (!uploadflashscreen.HasFile)
            {
                labelerror = "Upload flash Screen";
            }
            else if (!UploadLOGO.HasFile)
            {
                labelerror = "Upload logo";
            }
        }

        int pro = Convert.ToInt32(ddlProName.SelectedValue);

        if (string.IsNullOrEmpty(labelerror))
        {
            int ret = 0;
            ret = Updateprojecthomescreen();
            if (ret == 1)
            {            
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "Swal.fire({ " +
                  "  title: 'Project home screen details updated successfully', " +
                  "  icon: 'success', " +
                  "  allowOutsideClick: 'true', " +
                  "  customClass: { " +
                  "    icon: 'handle-icon-clr', " +
                  "    confirmButton: 'handle-btn-success' " +
                  "  } " +
                  "}).then((result) => { " +
                  "  window.location.href = '" + "view-project-home-screen.aspx" + "'; " +
                  "});", true);
            }
            else
            {
                string script = string.Format(@"<script>
    Swal.fire({{ 
        title: 'Project home screen details couldn\'t be added due to a server or network issue. Please try again in some time!', 
        confirmButtonText: 'OK', 
        customClass: {{ 
            confirmButton: 'handle-btn-success' 
        }} 
    }}).then((result) => {{  
        window.location.href = 'add-project-home-screen.aspx';  
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
            CI.StoreExceptionMessage("add-project-home-screen.aspx", "Bindprojectname", ex.Message, "Not Fixed");
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
            ddlProName.SelectedIndex = 0;
           // Response.Redirect("view-project-home-screen.aspx");
        }
    }
    public int Updateprojecthomescreen()
    {
        int ret = 0;
        try
        {
            K2.ProjectID = Convert.ToInt32(ddlProName.SelectedValue);

            if (fluploadhighlight1.HasFile)
            {
                K2.HighlightImage1 = SaveFile(fluploadhighlight1, "HiglightsImages", ddlProName.SelectedValue);
            }
            else if (!string.IsNullOrEmpty(hdnfluploadhighlight1.Value))
            {
                K2.HighlightImage1 = hdnfluploadhighlight1.Value;
            }
            else
            {
                K2.HighlightImage1 = "";
            }

            if (fluploadhighlight2.HasFile)
            {
                K2.HighlightImage2 = SaveFile(fluploadhighlight2, "HiglightsImages", ddlProName.SelectedValue);
            }
            else if (!string.IsNullOrEmpty(hdnfluploadhighlight2.Value))
            {
                K2.HighlightImage2 = hdnfluploadhighlight2.Value;
            }
            else
            {
                K2.HighlightImage2 = "";
            }

            if (fluploadhighlight3.HasFile)
            {
                K2.HighlightImage3 = SaveFile(fluploadhighlight3, "HiglightsImages", ddlProName.SelectedValue);
            }
            else if (!string.IsNullOrEmpty(hdnfluploadhighlight3.Value))
            {
                K2.HighlightImage3 = hdnfluploadhighlight3.Value;
            }
            else
            {
                K2.HighlightImage3 = "";
            }

            if (fluploadhighlight4.HasFile)
            {
                K2.HighlightImage4 = SaveFile(fluploadhighlight4, "HiglightsImages", ddlProName.SelectedValue);
            }
            else if (!string.IsNullOrEmpty(hdnfluploadhighlight4.Value))
            {
                K2.HighlightImage4 = hdnfluploadhighlight4.Value;
            }
            else
            {
                K2.HighlightImage4 = "";
            }

            if (fluploadhighlight5.HasFile)
            {
                K2.HighlightImage5 = SaveFile(fluploadhighlight5, "HiglightsImages", ddlProName.SelectedValue);
            }
            else if (!string.IsNullOrEmpty(hdnfluploadhighlight5.Value))
            {
                K2.HighlightImage5 = hdnfluploadhighlight5.Value;
            }
            else
            {
                K2.HighlightImage5 = "";
            }

            if (uploadflashscreen.HasFile)
            {
                K2.Splacescreen = SaveFile(uploadflashscreen, "SplacescreenImage", ddlProName.SelectedValue);
            }
            else if (!string.IsNullOrEmpty(hdnsplacescreen.Value))
            {
                K2.Splacescreen = hdnsplacescreen.Value;
            }
            else
            {
                return 0;
            }

            if (UploadLOGO.HasFile)
            {
                K2.homescreenProjectLogo = SaveFile(UploadLOGO, "ProjectLogo", ddlProName.SelectedValue);
            }
            else if (!string.IsNullOrEmpty(hdnUploadLOGO.Value))
            {
                K2.homescreenProjectLogo = hdnUploadLOGO.Value;
            }
            else
            {
                return 0;
            }

            K2.UpdatedBy = Userid;
            ret = K2.UpdateProjectHomeScreenByProjectID(K2);
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-project-home-screen.aspx", "AddProjectFloorPlan", ex.Message, "Not Fixed");
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
            CI.StoreExceptionMessage("add-project-home-screen.aspx", "SaveFile", ex.Message, "Not Fixed");
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
        if (Request.QueryString["ProjectID"] == null)
        {
            Response.Redirect(Request.Url.GetLeftPart(UriPartial.Path), true);

        }
        else
        {
            Response.Redirect("view-project-home-screen.aspx");
        }
    }

    protected void ddlProName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlProName.SelectedValue))
        {
            Response.Redirect("add-project-home-screen.aspx?ProjectID=" + ddlProName.SelectedValue);
        }
    }
}