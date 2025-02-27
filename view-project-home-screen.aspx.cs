using System;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class viewprojecthomescreen : System.Web.UI.Page
{

    ClientDashboardError CE = new ClientDashboardError();
    Key2hProject K2 = new Key2hProject();
    ClientUsers CU = new ClientUsers();
    DataTable dt1 = new DataTable();
    DataRow dr1;



    public static string Userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        Userid = CU.GetClientLoginID();

        Bind();
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
            CE.StoreExceptionMessage("view-project-home-screen.aspx", "Bindprojectname", ex.Message, "Not Fixed");
        }
        return strname;
    }
    public void Bind()
    {
        try
        {
            DataTable dt = Get();
            if (dt != null && dt.Rows.Count > 0)
            {
                rpruser.Visible = true;
                rpruser.DataSource = dt;
                lblcount.Text = Convert.ToString(dt.Rows.Count);
                rpruser.DataBind();
                DivNoDataFound.Style.Add("display", "none");
                h5TotalNoCount.Style.Add("display", "block");
            }
            else
            {
                rpruser.Visible = false;
                lblcount.Text = "0";
                DivNoDataFound.Style.Add("display", "block !important");
                h5TotalNoCount.Style.Add("display", "none");

            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("view-project-home-screen.aspx", "Bindprojectname", ex.Message, "Not Fixed");
        }
    }
    public DataTable Get()
    {
        DataTable dt = new DataTable();
        try
        {
            dt = K2.ViewAllProjectHomeScreenByFilter("", "", Userid);
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("view-project-home-screen.aspx", "Get", ex.Message, "Not Fixed");
        }
        return dt;
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            try
            {
                int ID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("add-project-home-screen.aspx?ProjectID=" + ID, false);
                HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
            }
        }

        else if (e.CommandName == "Delete")
        {
            try
            {
                int ID = Convert.ToInt32(e.CommandArgument);
                int ret = 0;
             
                if (ret > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                       "Swal.fire({ " +
                       "  title: 'Project home screen details has been deleted ', " +
                       "  confirmButtonText: 'OK', " +
                       "  customClass: { " +
                       "    confirmButton: 'handle-btn-success' " + "  } " +
                       "}).then((result) => { " +
                       "   window.location.href = '" + Request.Url.AbsolutePath + "'; " +
                       "});", true);
                }
            }
            catch (Exception ex)
            {
            }
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

}