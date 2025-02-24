using System;
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
        Bind();
        if (!IsPostBack)
        {
            Bindprojects();
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
                //ddlProName.SelectedValue = "18";
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("add-refer-content.aspx", "Bindprojects", ex.Message, "Not Fixed");
        }
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
                rpruser.DataBind();

            }
            else
            {
                rpruser.Visible = false;
            }
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("whats-happening.aspx", "Bind", ex.Message, "Not Fixed");
        }

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
            CE.StoreExceptionMessage("whats-happening.aspx", "Get", ex.Message, "Not Fixed");
        }

        return dt;
    }
    
    protected void btnSave_Click(object sender, EventArgs e)
    {

        string labelerror = string.Empty;
        if (string.IsNullOrEmpty(ddlProName.SelectedValue) && string.IsNullOrEmpty(txtContent.Text))
        {
            labelerror = "Fill all the filed";
        }
        else if (string.IsNullOrEmpty(ddlProName.SelectedValue))
        {
            labelerror = "Select project name";
        } 
        else if (string.IsNullOrEmpty(txtContent.Text))
        {
            labelerror = "Enter content";
        }



        if (string.IsNullOrEmpty(labelerror))
        {
            if (Request.QueryString["WHID"] == null)
            {

                int ret = 1;
                ret = AddWhatshappening();
                if (ret == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                 "Swal.fire({ " +
                        "  title: 'Whats happening added successfully', " +
                        "  icon: 'success', " +
                        "  customClass: { " +
                        "    icon: 'handle-icon-clr', " +
                        "    confirmButton: 'handle-btn-success' " +
                        "  } " +
                        "});", true);
                    Clear();
                }

            }
            else
            {
                int ret = 0;
                //ret = UpdateData();
                if (ret == 1)
                {
                    //Clear();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    //"Swal.fire({title: 'Updated Successfully', text: 'Your whats happening details have been successfully updated!', icon: 'success'}).then((result) => { if (result.isConfirmed) { window.location.href = 'view-whats-happening.aspx'; } });",
                    // true);
                }
            }
        }
        else
        {
            //alert labelerror
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                   "Swal.fire('Validation Alert', '" + labelerror + "!.', 'success');", true);
        }


    }

    public int AddWhatshappening()
    {

        int ret = 0;
        try
        {
            KF.Content = txtContent.Text;
            KF.ProjectID = Convert.ToInt32(ddlProName.SelectedValue);
            KF.DisplayStatus = true;
            KF.AddedBy = Convert.ToString(CU.GetClientLoginID().Replace("clientid=", ""));
            ret = KF.AddWhatshappening(KF);
        }
        catch (Exception ex)
        {
            CE.StoreExceptionMessage("whats-happening.aspx", "AddWhatshappening", ex.Message, "Not Fixed");
        }
        return ret;
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
         
        if (e.CommandName == "Edit")
        {

            // try
            // {
                RepeaterItem item = e.Item;
            TextBox txtContentText = item.FindControl("txtContentText") as TextBox;
            LinkButton btnSave = item.FindControl("btnSave") as LinkButton;
            LinkButton editButton = item.FindControl("Editbtn") as LinkButton;

            if (txtContentText != null)
            {
                txtContentText.ReadOnly = false; // Make the textbox editable
                txtContentText.Focus();
            }
            if (btnSave != null)
            {
                btnSave.Enabled = true;
                btnSave.Visible = true;
            }
            if (editButton != null)
            {
                editButton.Enabled = false;
                editButton.Visible = false;
            }
        }
        if (e.CommandName == "Save")
        {
            //  try
            //  {
                RepeaterItem item = e.Item;
            TextBox txtContentText = item.FindControl("txtContentText") as TextBox;
            LinkButton btnSave = item.FindControl("btnSave") as LinkButton;
            LinkButton editButton = item.FindControl("Editbtn") as LinkButton;
            HiddenField IdHiddenField = item.FindControl("HiddenField2") as HiddenField;

            if (IdHiddenField != null && txtContentText!=null)
            {
                string Id = IdHiddenField.Value;
                string updatedContent = txtContentText.Text;
                // if (txtContentText != null)
                // {
                    KF.WHID = Convert.ToInt32(Id);
                    KF.Content = updatedContent;
                // }

                int RET = KF.UpdateWhatshappening(KF);

                if (RET == 1)
                {
                    // if (txtContentText != null)
                    // {
                        txtContentText.ReadOnly = true; // Set the textbox back to read-only
                    // }
                    if (btnSave != null)
                    {
                        btnSave.Enabled = false;
                        btnSave.Visible = false;
                    }
                    if (editButton != null)
                    {
                        editButton.Enabled = true;
                        editButton.Visible = true;
                    }

                    // Show success message
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "Swal.fire({ " +
                        "  title: 'What\'s happening updated successfully', " +
                        "  icon: 'success', " +
                        "  customClass: { " +
                        "    icon: 'handle-icon-clr', " +
                        "    confirmButton: 'handle-btn-success' " +
                        "  } " +
                        "});", true);

                    Bind(); // Re-bind the repeater after a successful save
                }
                else
            {
                // Handle failure
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "Swal.fire({ " +
                    "  title: 'Failed to update content.', " +
                    "  icon: 'error', " +
                    "  customClass: { " +
                    "    icon: 'handle-icon-clr', " +
                    "    confirmButton: 'handle-btn-danger' " +
                    "  } " +
                    "});", true);
            }
            
            }
            Bind();
        }
    }

    protected void SetControlsInRepeater(string targetId)
    {
        foreach (RepeaterItem item in rpruser.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the controls inside the repeater item
                LinkButton btnSave = item.FindControl("btnSave") as LinkButton;
                LinkButton editButton = item.FindControl("Editbtn") as LinkButton;
                TextBox txtContentText = item.FindControl("txtContentText") as TextBox;

                // Assuming you have a HiddenField containing the product ID
                HiddenField IdHiddenField = item.FindControl("HiddenField1") as HiddenField;
                if (IdHiddenField != null)
                {
                    string Id = IdHiddenField.Value;
                    if (Id == targetId)
                    {


                        if (txtContentText != null)
                        {
                            if (txtContentText.Text != "-")
                            {

                                txtContentText.ReadOnly = false;
                            }
                            else
                            {
                                if (txtContentText != null)
                                {
                                    txtContentText.ReadOnly = true;
                                }
                            }
                        }
                        if (btnSave != null)
                        {
                            btnSave.Enabled = true;
                            btnSave.Visible = true;
                            btnSave.Focus();

                        }
                        if (editButton != null)
                        {
                            editButton.Enabled = false;
                            editButton.Visible = false;

                      
                        }

                    }
                    txtContentText.Focus();


                }
            }
        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
        if (Request.QueryString["WHID"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                  "Swal.fire('Cancelled!', 'Your action has been canceled.', 'success');",
                  true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
            "Swal.fire({title: 'Cancelled', text: 'Your action has been canceled.', icon: 'success'}).then((result) => { if (result.isConfirmed) { window.location.href = 'add-whats-happening.aspx'; } });",
             true);
        }
    }



    public void Clear()
    {
        ddlProName.SelectedIndex = 0; 
        txtContent.Text = "";

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