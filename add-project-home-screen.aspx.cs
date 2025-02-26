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
            DataTable dt = K2.ViewAllProjectHomeScreenByFilter(Convert.ToString(ID),"", Userid);
            if (dt != null && dt.Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(dt.Rows[0]["ProjectID"].ToString()) && dt.Rows[0]["ProjectID"] != null)
                {
                    ddlProName.SelectedValue = dt.Rows[0]["ProjectID"].ToString();
                    
                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["HighlightImage1"].ToString()) && dt.Rows[0]["HighlightImage1"] != null)
                {
                    
                    
                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["HighlightImage2"].ToString()) && dt.Rows[0]["HighlightImage2"] != null)
                {
                   
                    
                } 
                if (!string.IsNullOrEmpty(dt.Rows[0]["HighlightImage3"].ToString()) && dt.Rows[0]["HighlightImage3"] != null)
                {
                   
                    
                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["HighlightImage4"].ToString()) && dt.Rows[0]["HighlightImage4"] != null)
                {
                   
                    
                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["HighlightImage5"].ToString()) && dt.Rows[0]["HighlightImage5"] != null)
                {
                   
                    
                } 
                if (!string.IsNullOrEmpty(dt.Rows[0]["Splacescreen"].ToString()) && dt.Rows[0]["Splacescreen"] != null)
                {
                   
                    
                } 
                if (!string.IsNullOrEmpty(dt.Rows[0]["Logo"].ToString()) && dt.Rows[0]["Logo"] != null)
                {
                   
                    
                }
            }
        }
        catch(Exception ex)
        {
            CI.StoreExceptionMessage("add-floor-plan.aspx", "Bind", ex.Message, "Not Fixed");
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
            CI.StoreExceptionMessage("add-floor-plan.aspx", "Bindprojects", ex.Message, "Not Fixed");
        }
    }
   
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string labelerror = string.Empty;
        if (string.IsNullOrEmpty(ddlProName.SelectedValue) )
        {
            labelerror = "Fill the mandatory fields.";
        }
        else if (string.IsNullOrEmpty(ddlProName.SelectedValue))
        {
            labelerror = "Select project name";
        }
        
        int pro = Convert.ToInt32(ddlProName.SelectedValue);

        if (string.IsNullOrEmpty(labelerror))
        {
            // if (Request.QueryString["ProjectID"] == null)
            // {
            // if (!Isalreadyexist(ddlProName.SelectedValue, "", ""))

            // {
            int ret = 0;
            ret = AddProjectFloorPlan();
            if (ret == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
             "Swal.fire({ " +
                "  title: 'Project floor plan added successfully', " +
                "  icon: 'success', " +
                "  customClass: { " +
                "    icon: 'handle-icon-clr', " +
                "    confirmButton: 'handle-btn-success' " +
                "  } " +
                "});", true);
                
                
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
                                window.location.href = 'add-floor-plan.aspx';  
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
        catch(Exception ex)
        {
            CI.StoreExceptionMessage("add-floor-plan.aspx", "Bindprojectname", ex.Message, "Not Fixed");
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
    public int AddProjectFloorPlan()
    {
        int ret = 0;
        try
        {
            
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-floor-plan.aspx", "AddProjectFloorPlan", ex.Message, "Not Fixed");
        }
        return ret;
    }
    public int UpdateProjectFloorPlan()
    {
        int ret = 0;
        try
        {
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("add-floor-plan.aspx", "UpdateProjectFloorPlan", ex.Message, "Not Fixed");
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
            CI.StoreExceptionMessage("add-floor-plan.aspx", "SaveFile", ex.Message, "Not Fixed");
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
   
    protected void ddlProName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlProName.SelectedValue))
        {
            
        }     
    }
}