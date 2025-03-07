using System;
using System.Web;
using System.Web.UI;
using System.Linq;
using System.Data;
using System.Web.UI.WebControls;
using System.Collections.Generic;

public partial class adminkey2hcom_ViewRM : System.Web.UI.Page
{
    Key2hProjectRM KF = new Key2hProjectRM();
    ClientDashboardError CE = new ClientDashboardError();
    ClientUsers CU = new ClientUsers();
    DataTable dt1 = new DataTable();
    DataRow dr1;
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind(0);
    }
    public void Bind(int pageIndex)
    {
        try
        {
            if (pageIndex == 0)
                PageIndex = 1;
            DataTable dt = Get();
            int totalRecords = dt.Rows.Count;
            int pageSize = 10;
            int startRow = pageIndex * pageSize;
            if (dt != null && dt.Rows.Count > 0)
            {
                rpruser.Visible = true;
                rpruser.DataSource = dt.AsEnumerable().Skip(startRow).Take(pageSize).CopyToDataTable();
                rptPager.Visible = true;

                PopulatePager(totalRecords, pageIndex + 1, pageSize);
                lblcount.Text = Convert.ToString(dt.Rows.Count);
                rpruser.DataBind();
                DivNoDataFound.Style.Add("display", "none");
                h5TotalNoCount.Style.Add("display", "block");
            }
            else
            {
                rpruser.Visible = false;
                lblcount.Text = "0";
                rptPager.Visible = false;
                DivNoDataFound.Style.Add("display", "block !important");
                h5TotalNoCount.Style.Add("display", "none");
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("view-rm.aspx", "Repeater1_ItemCommand", ex.Message, "Not Fixed");
        }
    }

    public DataTable Get()
    {
        DataTable dt = new DataTable();
        try
        {
            dt = KF.ViewAllRMDetails();
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("view-rm.aspx", "Repeater1_ItemCommand", ex.Message, "Not Fixed");
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
                Response.Redirect("add-rm.aspx?RMID=" + ID, false);
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
                ret = KF.DisableRMbyRMID(ID);
                if (ret == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                       "Swal.fire({ " +
                       "  title: 'RM has been deleted ', " +
                       "  confirmButtonText: 'OK', " +
                       "  customClass: { " + "    confirmButton: 'handle-btn-success' " + "  } " +
                       "}).then((result) => { " +
                       "  if (result.isConfirmed) { " +
                       "   window.location.href = '" + Request.Url.AbsolutePath + "'; " +
                       "  } " +
                       "});", true);
                }
            }
            catch (Exception ex)
            {
            }
        }
    }


    protected void Page_Changed(object sender, EventArgs e)
    {
        int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
        PageIndex = pageIndex;
        this.Bind(pageIndex - 1);
        Session["SessionPageIndex"] = pageIndex;
    }
    private void PopulatePager(int recordCount, int currentPage, int PageSize)
    {
        double dblPageCount = (double)((decimal)recordCount / (decimal)PageSize);
        int pageCount = (int)Math.Ceiling(dblPageCount);
        List<ListItem> pages = new List<ListItem>();
        if (pageCount > 0 && pageCount > 1)
        {
            // pages.Add(new ListItem("<<", "1", currentPage > 1));
            if (currentPage != 1 && currentPage > 1)
            {
                pages.Add(new ListItem("Previous", (currentPage - 1).ToString()));
            }
            if (pageCount < 4)
            {
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
            }
            else if (currentPage < 4)
            {
                for (int i = 1; i <= 4; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem("...", (currentPage).ToString(), true));
            }
            else if (currentPage > pageCount - 4)
            {
                pages.Add(new ListItem("...", (currentPage).ToString(), true));
                for (int i = currentPage - 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
            }
            else
            {
                pages.Add(new ListItem("...", (currentPage).ToString(), true));
                for (int i = currentPage - 2; i <= currentPage + 2; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem("...", (currentPage).ToString(), true));
            }
            if (currentPage != pageCount)
            {
                pages.Add(new ListItem("next", (currentPage + 1).ToString()));
            }
            //pages.Add(new ListItem(">>", pageCount.ToString(), currentPage < pageCount));
        }
        rptPager.DataSource = pages;
        rptPager.DataBind();
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