﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class adminkey2hcom_WhatsHappening : System.Web.UI.Page
{
    Key2hProject K2 = new Key2hProject();
    Key2hWhatshappening KF = new Key2hWhatshappening();
    ClientDashboardError CE = new ClientDashboardError();
    ClientUsers CU = new ClientUsers();
    DataTable dt1 = new DataTable();
    DataRow dr1;

    protected void Page_Load(object sender, EventArgs e)
    { 
        if (!IsPostBack)
        {
            try
            {
                DataTable dt = K2.ViewActiveprojects();
                if (dt.Rows.Count > 0)
                {
                    ddlprojects.DataSource = dt;
                    ddlprojects.DataTextField = "ProjectName";
                    ddlprojects.DataValueField = "ProjectID";
                    ddlprojects.DataBind();
                    ddlprojects.Items.Insert(0, new ListItem("All", "")); 
                }
                else
                {
                    ddlprojects.Items.Insert(0, new ListItem("", ""));
                    ddlprojects.Items.Insert(2, new ListItem("No Projects", ""));
                }
            }
            catch (Exception ex)
            {
                CE.StoreExceptionMessage("view-whats-happening.aspx", "pageload", ex.Message, "Not Fixed");
            }
            Bind(0); 
        }  
    }
    protected void ddlprojects_SelectedIndexChanged(object sender, EventArgs e)
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
          
            if (dt != null && dt.Rows.Count > 0)
            {
                int totalRecords = dt.Rows.Count;
                int pageSize = 10;
                int startRow = pageIndex * pageSize;
                rpruser.Visible = true;
                rpruser.DataSource = dt.AsEnumerable().Skip(startRow).Take(pageSize).CopyToDataTable();
                lblcount.Text = Convert.ToString(dt.Rows.Count);
                rpruser.DataBind();
                PopulatePager(totalRecords, pageIndex + 1, pageSize);
                DivNoDataFound.Style.Add("display", "none");
                h5TotalNoCount.Style.Add("display", "block");
            }
            else
            {
                rpruser.Visible = false;
                lblcount.Text = "0";
                DivNoDataFound.Style.Add("display", "block");
                h5TotalNoCount.Style.Add("display", "none");
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("view-whats-happening.aspx", "Bind", ex.Message, "Not Fixed");
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
            CE.StoreExceptionMessage("view-whats-happening.aspx", "Bindprojectname", ex.Message, "Not Fixed");
        }
        return strname;
    }
    public DataTable Get()
    {
        DataTable dt = new DataTable();
        try
        {
            dt = KF.ViewAllWhatshappening();
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("view-whats-happening.aspx", "Get", ex.Message, "Not Fixed");
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
                Response.Redirect("add-whats-happening.aspx?WHID=" + ID, false);
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
                
                int WHID = Convert.ToInt32(e.CommandArgument); 
                int ret = 0; 
                ret =  KF.DeleteWhatshappeningbyWHID(WHID); 
                // Properly format the JavaScript string with ret
                //ScriptManager.RegisterStartupScript(UpdatePanel5, UpdatePanel5.GetType(), "alert", string.Format("alert('{0}');", ret), true);
                if (ret == 1)
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel5, UpdatePanel5.GetType(), "alert",
                      "Swal.fire({ " +
                      "  title: 'Whats happening details has been deleted ', " +
                      "  confirmButtonText: 'OK', " +
                       "  customClass: { " +
                        "    confirmButton: 'handle-btn-success' " +
                        "  } " +
                      "}).then((result) => { " +
                      "   window.location.href = '" + Request.Url.AbsolutePath + "'; " +
                      "});", true);

                    //UpdatePanel5.Update();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel5, UpdatePanel5.GetType(), "alert",
                      "Swal.fire({ " +
                      "  title: 'Your whats happening details not deleted. please try again', " + 
                      "  confirmButtonText: 'OK', " +
                       "  customClass: { " +
                        "    confirmButton: 'handle-btn-success' " +
                        "  } " +
                      "}).then((result) => { " +
                      "   window.location.href = '" + Request.Url.AbsolutePath + "'; " +
                      "});", true);
                }
            }
            catch (Exception ex)
            {
                CE.StoreExceptionMessage("view-whats-happening.aspx", "Repeater1_ItemCommand", ex.Message, "Not Fixed");
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
    protected void lnkcancel_Click(object sender, EventArgs e)
    {
        ddlprojects.SelectedIndex = 0;
        Bind(0);
    }
}