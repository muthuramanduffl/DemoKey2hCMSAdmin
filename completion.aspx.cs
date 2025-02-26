using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminkey2hcom_Completion : System.Web.UI.Page
{
    Key2hProject k2 = new Key2hProject();

    ClientUsers CU = new ClientUsers();
    ClientDashboardError CE = new ClientDashboardError();
    public static string Userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        Userid = CU.GetClientLoginID();

        if (!IsPostBack)
        {
            Bindprojects();

        }
    }

    public void Bind(string id)
    {
        try
        {
            DataTable DT =k2.ViewAllProjectsByid(Convert.ToInt32(id)) ;
            if (DT.Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(Convert.ToString(DT.Rows[0]["ProjectID"])))
                {
                    ddlprojects.SelectedValue = Convert.ToString(DT.Rows[0]["ProjectID"]);
                }
                if (!string.IsNullOrEmpty(Convert.ToString(DT.Rows[0]["ProjectStatusPercentage"])))
                {
                   txtCompletionPercentage.Text = Convert.ToString(DT.Rows[0]["ProjectStatusPercentage"]);
                }
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("completion.aspx", "Bind", ex.Message, "Not Fixed");
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
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("completion.aspx", "Bindprojects", ex.Message, "Not Fixed");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string Labelerror = string.Empty;
        if (string.IsNullOrEmpty(ddlprojects.SelectedValue) && string.IsNullOrEmpty(txtCompletionPercentage.Text))
        {
            Labelerror = "Fill all the field";
        }
        else if (string.IsNullOrEmpty(ddlprojects.SelectedValue))
        {
            Labelerror = "Select project";
        }
        else if (string.IsNullOrEmpty(txtCompletionPercentage.Text))
        {
            Labelerror = "Enter completion percentage";
        }
        if (string.IsNullOrEmpty(Labelerror))
        {
            if (Request.QueryString["BlockID"] == null)
            {

                if (Updatestatus() == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                      "Swal.fire({ " +
                        "  title: 'Completion details updated successfully', " +
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

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                        "Swal.fire({ " +
                        "  title: 'Completion details couldn't be added due to a server or network issue. Please try again in some time!', " +
                        "  confirmButtonText: 'OK', " +
                       "  customClass: { " +
                        "      confirmButton: 'handle-btn-success', " +
                        "  }" +
                        "});", true);
                }

            }
            else
            {

            }
        }
        else
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
            //    "Swal.fire({ " +
            //                "  title: '" + Labelerror + "', " +
            //               "  confirmButtonText: 'OK', " +
            //               "  customClass: { " +
            //                "      confirmButton: 'handle-btn-success', " +
            //                "  }" +
            //                "});", true);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }


    public int Updatestatus()
    {
        int ret = 0;
        try
        {
            k2.ProjectID = Convert.ToInt32(ddlprojects.SelectedValue);
            k2.ProjectStatusPercentage = Convert.ToInt32(txtCompletionPercentage.Text);
            k2.AddedBy = Userid;
            ret = k2.UpdateProjectCompletionStatus(k2);
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("completion.aspx", "Updatestatus", ex.Message, "Not Fixed");
        }
        return ret;
    }

    public void Clear()
    {
        ddlprojects.SelectedIndex = 0;
        txtCompletionPercentage.Text = "";
    }

    protected void ddlprojects_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlprojects.SelectedValue))
        {
            Bind(ddlprojects.SelectedValue);
        }
        
    }
}