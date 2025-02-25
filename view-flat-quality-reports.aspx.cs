using System;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class viewFlatqualityreports : System.Web.UI.Page
{

    ClientDashboardError CE = new ClientDashboardError();
    Key2hProject K2 = new Key2hProject();
    ClientUsers CU = new ClientUsers();
    DataTable dt1 = new DataTable();
    DataRow dr1;

    Key2hFlat KFF = new Key2hFlat();
    Key2hProjectblock KB = new Key2hProjectblock();

    Key2hQualityReports KQRS = new Key2hQualityReports();
    protected void Page_Load(object sender, EventArgs e)
    {
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
            CE.StoreExceptionMessage("view-flat-quality-reports.aspx", "Bindprojectname", ex.Message, "Not Fixed");
        }
        return strname;
    }

    public string ViewFlatNameByFlatID(int ID)
    {
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
            CE.StoreExceptionMessage("view-flat-quality-reports.aspx", "ViewFlatNameByFlatID", ex.Message, "Not Fixed");
        }
        return Block;
    }

    public string BindBlockname(int ID)
    {
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
            CE.StoreExceptionMessage("view-flat-quality-reports.aspx", "BindBlockname", ex.Message, "Not Fixed");
        }
        return Block;
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
            CE.StoreExceptionMessage("view-flat-quality-reports.aspx", "Bindprojectname", ex.Message, "Not Fixed");
        }
    }
    public DataTable Get() 
    {
        DataTable dt = new DataTable();
        try
        {
            dt = KQRS.ViewAllFlatQualityReports("","","","");
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("view-flat-quality-reports.aspx", "Get", ex.Message, "Not Fixed");
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
                Response.Redirect("add-flat-quality-reports.aspx?ID=" + ID, false);
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
                ret = KQRS.DeleteAllFlatQualityReports(ID);
                if (ret > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                       "Swal.fire({ " +
                       "  title: 'Project flat report details has been deleted ', " +
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