<%@ Page Title="" Language="C#" MasterPageFile="AdminKey2h.master" AutoEventWireup="true"
    CodeFile="whats-happening.aspx.cs" Inherits="adminkey2hcom_WhatsHappening" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="content">
            <div class="panel-header bg-primary-gradient">
                <div class="page-inner py-5">
                    <div
                        class="d-flex pb-2 align-items-left align-items-sm-center flex-column flex-sm-row justify-content-between">
                        <div class="d-flex">
                            <h2 class="text-white mb-0 fw-bold text-uppercase">what's happening</h2>
                            <ul class="breadcrumbs">
                                <li class="nav-home pt-1">
                                    <a href="dashboard.html">
                                        <i class="fa fa-home"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="text-end d-none">
                            <a href="view-whats-happening.html" data-bs-toggle="tooltip" title="View whats happening">
                                <img class="add-view-img"
                                    src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHdpZHRoPSI1MTIiIGhlaWdodD0iNTEyIiB4PSIwIiB5PSIwIiB2aWV3Qm94PSIwIDAgMzIgMzIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTIiIHhtbDpzcGFjZT0icHJlc2VydmUiIGNsYXNzPSIiPjxnPjxnIGZpbGw9IiM2NjIxYmEiPjxwYXRoIGQ9Ik0yNS41MyAyMS41MzVhLjkuOSAwIDAgMC0uOS45di41NGMwIC42MDYtLjQ5NCAxLjEtMS4xIDEuMUg4LjE1Yy0uNjA2IDAtMS4xLS40OTQtMS4xLTEuMXYtMTguMWMwLS42MDYuNDk0LTEuMSAxLjEtMS4xaDE1LjM4Yy42MDYgMCAxLjEuNDk0IDEuMSAxLjF2Mi44YS45LjkgMCAwIDAgMS44IDB2LTIuOGMwLTEuNTk5LTEuMzAxLTIuOS0yLjktMi45SDguMTVhMi45MDMgMi45MDMgMCAwIDAtMi45IDIuOXYxLjI0NEg0YTIuOTAzIDIuOTAzIDAgMCAwLTIuOSAyLjl2MTguMTA2YzAgMS41OTkgMS4zMDEgMi45IDIuOSAyLjloMTUuMzc4YzEuNTk5IDAgMi45LTEuMzAxIDIuOS0yLjl2LTEuMjVoMS4yNTJjMS41OTkgMCAyLjktMS4zMDEgMi45LTIuOXYtLjU0YS45LjkgMCAwIDAtLjktLjl6bS01LjA1MiA1LjU5YzAgLjYwNi0uNDk0IDEuMS0xLjEgMS4xSDRjLS42MDYgMC0xLjEtLjQ5NC0xLjEtMS4xVjkuMDE5YzAtLjYwNi40OTQtMS4xIDEuMS0xLjFoMS4yNXYxNS4wNTdjMCAxLjU5OSAxLjMwMSAyLjkgMi45IDIuOWgxMi4zMjh6IiBmaWxsPSIjNjYyMWJhIiBvcGFjaXR5PSIxIiBkYXRhLW9yaWdpbmFsPSIjNjYyMWJhIiBjbGFzcz0iIj48L3BhdGg+PHBhdGggZD0iTTEzLjUgNy41ODFoLTIuMzQzYS45LjkgMCAwIDAgMCAxLjhIMTMuNWEuOS45IDAgMCAwIDAtMS44ek0xOC42NCAxMi4xMTVhLjkuOSAwIDAgMC0uOS0uOWgtNi41OGEuOS45IDAgMCAwIDAgMS44aDYuNThhLjkuOSAwIDAgMCAuOS0uOXpNMTEuMTYgMTQuODQ1YS45LjkgMCAwIDAgMCAxLjhoNmEuOS45IDAgMCAwIDAtMS44ek0xMS4xNiAyMC4yNzVoNy4zNmEuOS45IDAgMCAwIDAtMS44aC03LjM2YS45LjkgMCAwIDAgMCAxLjh6IiBmaWxsPSIjNjYyMWJhIiBvcGFjaXR5PSIxIiBkYXRhLW9yaWdpbmFsPSIjNjYyMWJhIiBjbGFzcz0iIj48L3BhdGg+PC9nPjxwYXRoIGZpbGw9IiNmOThhMTciIGQ9Im0zMC42MzYgMTkuODM5LTIuMDU1LTIuMDU1YzEuMjg5LTEuODg4IDEuMTAzLTQuNDg5LS41NzItNi4xNjNhNC44NiA0Ljg2IDAgMCAwLTYuODY0IDAgNC44NTkgNC44NTkgMCAwIDAgMCA2Ljg2MyA0Ljg0OCA0Ljg0OCAwIDAgMCA2LjE2My41NzJsMi4wNTQgMi4wNTRhLjg5Ny44OTcgMCAwIDAgMS4yNzIgMCAuODk1Ljg5NSAwIDAgMCAuMDAyLTEuMjcxem0tOC4yMTctMi42MjdhMy4wNTggMy4wNTggMCAwIDEgMC00LjMxOGMuNTk1LS41OTUgMS4zNzctLjg5MyAyLjE1OS0uODkzczEuNTY0LjI5OCAyLjE1OS44OTNhMy4wNTggMy4wNTggMCAwIDEgMCA0LjMxOGMtMS4xNTMgMS4xNTQtMy4xNjUgMS4xNTQtNC4zMTggMHoiIG9wYWNpdHk9IjEiIGRhdGEtb3JpZ2luYWw9IiNmOThhMTciIGNsYXNzPSIiPjwvcGF0aD48L2c+PC9zdmc+" />
                            </a>
                        </div>


                    </div>
                </div>
            </div>
            <div class="page-inner mt--5">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">

                                <div class="form-group">
                                    <div class="form-border margin-top20">
                                        <div class="form-title">
                                            <h3>Add Details</h3>
                                        </div>
                                        <div class="row mx-0 margin-top20 mb-4">
                                            <div class="col-sm-4 col-lg-3 pt-3">
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Block"
                                                    UpdateMode="Conditional" ChildrenAsTriggers="true">
                                                    <ContentTemplate>
                                                        <div class="input-icon input-icon-sm right">
                                                            <label>Project Name <span
                                                                    class="text-danger">*</span></label>
                                                            <i class="bi bi-journal-bookmark-fill b5-icon"></i>
                                                            <asp:DropDownList ID="ddlProName" AutoPostBack="true"
                                                                class="bs-select form-control input-sm" runat="server">

                                                            </asp:DropDownList>
                                                        </div>
                                                        <span class="error">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                                runat="server" ValidationGroup="projval"
                                                                ControlToValidate="ddlProName" InitialValue=""
                                                                ErrorMessage="Select project name">
                                                            </asp:RequiredFieldValidator>
                                                        </span>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="ddlProName"
                                                            EventName="SelectedIndexChanged" />

                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>


                                            <div class="col-sm-5 col-lg-4 pt-3">
                                                <div class="input-icon input-icon-sm right">
                                                    <label>Content <span class="text-danger">*</span></label>
                                                    <i class="bi bi-list-check b5-icon"></i>
                                                    <asp:TextBox ID="txtContent" TextMode="MultiLine" MaxLength="100"
                                                        class="form-control input-sm editor" rows="2" runat="server">
                                                    </asp:TextBox>
                                                    <span class="handle-file-request">(maximum 100 characters)</span>
                                                </div>
                                                <span class="error">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                                        ClientIDMode="Static" SetFocusOnError="true"
                                                        EnableClientScript="true" InitialValue=""
                                                        ValidationGroup="projval" ControlToValidate="txtContent"
                                                        runat="server" ErrorMessage=" Enter content">
                                                    </asp:RequiredFieldValidator>
                                                </span>
                                            </div>



                                        </div>

                                        <div class="card-footer mx-3 mb-2">
                                            <div class="d-flex justify-content-center">
                                                <asp:Button ID="btnSave" ClientIDMode="Static" runat="server"
                                                    OnClick="btnSave_Click" Text="Submit" ValidationGroup="projval"
                                                    class="btn btn-sm btn-success me-1 btnSave"
                                                    OnClientClick="if (validatePage()) { this.value='Please wait..'; this.style.display='none'; document.getElementById('bWait').style.display = ''; } else { return false; }"
                                                    Style="min-width: 67px;" />
                                                <button type="button" style="display: none" id="bWait"
                                                    class="btn btn-secondary btn-sm me-1"><i
                                                        class='fa fa-spinner fa-spin'></i>Please wait</button>
                                                <div class="btn btn-sm btn-danger swtAltCancel">Cancel</div>
                                                <asp:Button ID="btnCancel" runat="server" Text="Cancel Project"
                                                    OnClick="btnCancel_Click" Style="display: none;" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                
                            <!------------------ View List ------------------>
                                <div class="form-group">
                                    <div class="form-border margin-top20">
                                        <div class="form-title">
                                            <h3>View Details</h3>
                                        </div>
                                        <div class="row mx-0 margin-top20 pt-3 mb-2">


                                            <div class="table-responsive">
                                                <asp:Repeater ID="rpruser" OnItemCommand="Repeater1_ItemCommand" runat="server">
                                                    <HeaderTemplate>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th class="w-sno">#</th>
                                                            <th>What's happening Content</th>
                                                            <th class="min-w-120">Action </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <asp:HiddenField ID="HiddenField1" Value='<%# Eval("WHID") %>' runat="server" />

                                                            <td><%# GetRowNo(Convert.ToString(Container.ItemIndex + 1))%></td>
                                                            <td> <asp:TextBox ID="txtContentText" TextMod="MultiLine" CssClass="w-100 form-control input-sm input-cus dynamic-textbox" Wrap="true" runat="server" Text='<%# string.IsNullOrEmpty(Eval("Content").ToString()) ? "-" : Eval("Content")%>' ReadOnly="true" Style="background: #fcfcfc; border-color: #cccdce;text-align: center;" /></td>

                                                            </td>
                                                            <td>
                                                                <asp:HiddenField ID="HiddenField2" Value='<%# Eval("WHID") %>' runat="server" />
                                                                <asp:LinkButton CssClass=" " ID="Editbtn" runat="server" CommandName="Edit" Visible="true" data-bs-toggle="tooltip" title="Edit"
                                                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem, "WHID") %>'><i class="bi bi-pencil-square b5-icon-et-dlt"></i></asp:LinkButton>
                                                                <a href="javascript:void(0);" class="btnDelete" onclick="deleteRow(this)">
                                                                    <i class="bi bi-trash b5-icon-et-dlt me-3" data-bs-toggle="tooltip" aria-label="Delete" data-bs-original-title="Delete"></i>
                                                                </a> 
                                                            <asp:LinkButton CssClass="md-btn md-btn-small md-btn-flat md-btn-danger" ID="Delete" runat="server" OnClientClick='javascript:return confirm("Are you sure you want to delete?")' CommandName="Delete" Visible="true"
                                                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem, "WHID") %>'>Delete</asp:LinkButton> 
                                                                <asp:LinkButton class=" " ID="btnSave" runat="server" CommandName="Save" Visible="false" data-bs-toggle="tooltip" title="Save"
                                                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem, "WHID") %>'><i class="bi bi-check-square b5-icon-et-dlt"></i></asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                        
                                                       
                                                    </tbody>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>

        </div>
        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    &copy;
                    <script type="text/javascript">
                        var today = new Date()
                        var year = today.getFullYear()
                        document.write(year)
                    </script>
                </nav>
                <div class="copyright ml-auto">
                    Powered by <a class="text-uppercase" href="https://duffldigital.com/" target="_blank">Duffl
                        Digital</a>
                </div>
            </div>
        </footer>

        <script>
            function validatePage() {
                var flag = window.Page_ClientValidate('projval');
                return flag;

            }
            document.getElementById('<%= txtContent.ClientID %>').addEventListener('input', function (e) {
                if (this.value.length > 100) {
                    this.value = this.value.substring(0, 100);
                }
            });


            //-- Select the Cancel button with the class 'swtAltCancel'
            document.addEventListener('DOMContentLoaded', function () {
                const cancelButton = document.querySelector('.swtAltCancel');

                cancelButton.addEventListener('click', function () {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Are you sure?',
                        text: 'You are about to cancel the whats happening details submission.',
                        showCancelButton: true,
                        confirmButtonText: 'Yes, Cancel it!',
                        cancelButtonText: 'No, Keep it',
                        confirmButtonColor: '#d33',
                        cancelButtonColor: '#3085d6',
                    }).then((result) => {
                        if (result.isConfirmed) {
                            document.getElementById('<%= btnCancel.ClientID %>').click();
                        } else if (result.dismiss === Swal.DismissReason.cancel) {
                            Swal.fire(
                                'Cancelled',
                                'You can continue with your whats happening details submission.',
                                'info'
                            );
                        }
                    });
                });
            });
            //--// Select the Cancel button with the class 'swtAltCancel'




        </script>
    </asp:Content>