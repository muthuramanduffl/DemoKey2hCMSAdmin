﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminkey2hcom_ViewDemand : System.Web.UI.Page
{
    Key2hLeadSource LS = new Key2hLeadSource();
    DataTable dt1 = new DataTable();
    DataRow dr1;

    ClientDashboardError CI = new ClientDashboardError();
    ClientUsers CU = new ClientUsers();
    Key2hProjectblock KB = new Key2hProjectblock();

    Key2hFlat KF = new Key2hFlat();
    Key2hProject K2 = new Key2hProject();
    Key2hCustomer KC = new Key2hCustomer();
    Key2hdemontDetails KDD = new Key2hdemontDetails();
   private static string  clientId;
    protected void Page_Load(object sender, EventArgs e)
    {
        clientId = CU.GetClientLoginID();

        if (!IsPostBack)
        {
            ddlBindProject();
            Bindblock();
            BindFlat();
            Bind(); 
        }
    }
    public void ddlBindProject()
    {
        try
        {
            DataTable dt = K2.ViewActiveprojects();
            if (dt != null && dt.Rows.Count > 0)
            {
                ddlprojectname.DataSource = dt;
                ddlprojectname.DataTextField = "ProjectName";
                ddlprojectname.DataValueField = "ProjectID";
                ddlprojectname.DataBind();
                ddlprojectname.Items.Insert(0, new ListItem("All", "")); 
            }
            else
            {
                ddlprojectname.Items.Insert(0, new ListItem("All", ""));
                ddlprojectname.Items.Insert(2, new ListItem("No projects", ""));
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("view-demand.aspx", "ddlBindProject", ex.Message, "Not Fixed");
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
    public string Bindproject(int ID)
    {
        string Project = string.Empty;
        try
        {
            DataTable dt = K2.ViewAllProjectsByid(ID);
            if (dt != null && dt.Rows.Count > 0)
            {
                Project = dt.Rows[0]["ProjectName"].ToString();
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("view-demand.aspx", "Bindproject", ex.Message, "Not Fixed");
        }

        return Project;
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
            CI.StoreExceptionMessage("view-demand.aspx", "BindBlockname", ex.Message, "Not Fixed");
        } 
        return Block;
    }
    public string ViewFlatNameByFlatID(int ID)
    {
        string Block = string.Empty;
        try
        {
            DataTable dt = KF.ViewAllFlatByFlatID(Convert.ToInt32(ID));
            if (dt != null && dt.Rows.Count > 0)
            {
                Block = dt.Rows[0]["FlatName"].ToString();
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("view-demand.aspx", "ViewFlatNameByFlatID", ex.Message, "Not Fixed");
        } 
        return Block;
    }
    public string BindCustomerName(int ProjectID, int BlockID, int FlatID)
    {
        string strcustomername = string.Empty;
        try
        {
            DataTable dt = KC.AlreadyExistProjectdetails(Convert.ToInt32(ProjectID), Convert.ToInt32(BlockID), Convert.ToInt32(FlatID));
            if (dt != null && dt.Rows.Count > 0)
            {
                strcustomername = dt.Rows[0]["ApplicantFirstName"].ToString();
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("View-demand.aspx", "BindCustomerName", ex.Message, "Not Fixed");
        }
        return strcustomername;
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
                Session["customer"] = dt.DefaultView;
                lblcount.Text = Convert.ToString(dt.Rows.Count);
                rpruser.DataBind();
                DivNoDataFound.Style.Add("display", "none");
                h5TotalNoCount.Style.Add("display", "block"); 
            }
            else
            {
                Session["customer"] = null;
                rpruser.Visible = false;
                lblcount.Text = "0";
                DivNoDataFound.Style.Add("display", "block !important");
                h5TotalNoCount.Style.Add("display", "none"); 
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("view-demand.aspx", "Bind", ex.Message, "Not Fixed");
        } 
    }
    public DataTable Get()
    {
        DataTable dt = new DataTable();
        try
        { 
            string projectid = string.Empty;
            string blockID = string.Empty;
            string FlatID = string.Empty;
            string status = string.Empty;
            if (!string.Equals(ddlprojectname.SelectedValue, ""))
            {
                projectid = ddlprojectname.SelectedValue;
            }
            if (!string.Equals(ddflatNumber.SelectedValue, ""))
            {
                FlatID = ddflatNumber.SelectedValue;
            }
            if (!string.Equals(ddlblocknumber.SelectedValue, ""))
            {
                blockID = ddlblocknumber.SelectedValue;
            } 
            dt = KDD.ViewAllFlatDemandDetails("", projectid, blockID, FlatID);
            DataView dv = new DataView();
            dv = dt.DefaultView;
            string filterExpression = string.Empty;
            List<string> filterList = new List<string>();
            string strclientID = clientId;
            if (!string.IsNullOrEmpty(strclientID))
            {
                if (!string.IsNullOrEmpty(filterExpression)) filterExpression += " AND ";
                filterExpression += "AddedBy = '" + strclientID.Replace("'", "''") + "'";
            }
            if (!string.IsNullOrEmpty(filterExpression))
            {
                dv.RowFilter = filterExpression;
            }
            else
            {
                dv.RowFilter = string.Empty;
            }
            if (dv.Count > 0)
            {
                dt = dv.ToTable();
            }
            else
            {
                dt = null;
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("view-demand.aspx", "Get", ex.Message, "Not Fixed");
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
                Response.Redirect("add-demand.aspx?DemandID=" + ID, false);
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
                ret = KDD.DeleteFlatCustomerDemandsByDemandID(ID);
                if (ret == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                      "Swal.fire({ " +
                       "  title: 'Demand details has been deleted ', " +
                       "  confirmButtonText: 'OK', " +
                       "  customClass: { " +
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
                      "  title: 'Your demand details not deleted. please try again', " + 
                      "  confirmButtonText: 'OK', " +
                       "  customClass: { " +
                        "    confirmButton: 'handle-btn-success' " +
                        "  } " +
                      "}).then((result) => { " +
                      "  window.location.href = '" + Request.Url.AbsolutePath + "'; " +
                      "});", true);
                }
            }
            catch (Exception ex)
            { 
            } 
        } 
    }
    protected void ddlprojectname_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bindblock();
        Bind();
    }
    public void Bindblock()
    {
        try
        {
            if (!string.IsNullOrEmpty(ddlprojectname.SelectedValue))
            {
                DataTable DT = KB.ViewBlockbyProjectID(Convert.ToInt32(ddlprojectname.SelectedValue));
                if (DT != null && DT.Rows.Count > 0)
                {
                    ddlblocknumber.DataSource = DT;
                    ddlblocknumber.DataTextField = "BlockName";
                    ddlblocknumber.DataValueField = "BlockID";
                    ddlblocknumber.DataBind();
                    ddlblocknumber.Items.Insert(0, new ListItem("All", ""));
                }
                else
                {
                    ddlblocknumber.Items.Clear();
                    ddlblocknumber.Items.Insert(0, new ListItem("No block name", ""));
                }
            }
            else
            {
                ddlblocknumber.Items.Clear();
                ddlblocknumber.Items.Insert(0, new ListItem("All", ""));
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("view-demand.aspx", "Bindblock", ex.Message, "Not Fixed");
        }
    }
    protected void ddlblocknumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindFlat();
        Bind();
    }
    public void BindFlat()
    {
        try
        {
            if (!string.IsNullOrEmpty(ddlblocknumber.SelectedValue))
            {
                DataTable DT = KF.ViewAllflatByBlockID(Convert.ToInt32(ddlblocknumber.SelectedValue)); 
                if (DT != null && DT.Rows.Count > 0)
                {
                    ddflatNumber.DataSource = DT;
                    ddflatNumber.DataTextField = "FlatName";
                    ddflatNumber.DataValueField = "FlatID";
                    ddflatNumber.DataBind();
                    ddflatNumber.Items.Insert(0, new ListItem("All", "")); 
                }
                else
                {
                    ddflatNumber.Items.Clear();
                    ddflatNumber.Items.Insert(0, new ListItem("All", ""));
                    ddflatNumber.Items.Insert(1, new ListItem("No flat number", ""));
                }
            }
            else
            {
                ddflatNumber.Items.Clear();
                ddflatNumber.Items.Insert(0, new ListItem("All", ""));
            }
        }
        catch (Exception ex)
        {
            CI.StoreExceptionMessage("view-demand.aspx", "BindFlat", ex.Message, "Not Fixed");
        }
    }
    protected void ddflatNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind();
    }
    protected void lnkcancel_Click(object sender, EventArgs e)
    {
        Clear();
        Bind();
    }
    public void Clear()
    {
        ddlprojectname.SelectedIndex = 0 ;
        Bindblock();
        BindFlat(); 
    }

}