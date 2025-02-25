﻿<%@ Page Title="" Language="C#" MasterPageFile="AdminKey2h.master" AutoEventWireup="true" CodeFile="view-flat-quality-reports.aspx.cs"
    Inherits="viewFlatqualityreports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content">
        <div class="panel-header bg-primary-gradient">
            <div class="page-inner py-5">
                <div class="d-flex pb-2 align-items-left align-items-md-center flex-column flex-md-row justify-content-between">
                    <div class="d-flex">
                        <h2 class="text-white mb-0 fw-bold text-uppercase">View Flat Quality Reports</h2>
                        <ul class="breadcrumbs">
                            <li class="nav-home pt-1">
                                <a href="dashboard.html">
                                    <i class="fa fa-home"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-inner mt--5">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group p-0">
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate>
                                        <h5 id="h5TotalNoCount" class="pt-2" runat="server"><span class="box-b-only p-1">Total no. of Count :
                                          <asp:Label ID="lblcount" runat="server" Text="Label"></asp:Label>
                                        </span></h5>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                    <ContentTemplate>
                                        <div class="text-center no-data-found" clientidmode="Static"
                                            id="DivNoDataFound" runat="server" style="display: none;">
                                            <h4 class="mb-0 text-secondary pt-5 pb-4">
                                                <img src="assets/img/no-data.png" alt="img" class="img-fluid" />
                                                No Data Found</h4>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                            <div class="table-responsive">
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        <asp:Repeater ID="rpruser" OnItemCommand="Repeater1_ItemCommand" runat="server">
                                            <HeaderTemplate>
                                                <table class="table table-bordered" id="basic-datatables" role="grid"
                                                    aria-describedby="basic-datatables_info">
                                                    <thead>
                                                        <tr>
                                                            <th class="w-sno">#</th>
                                                            <th class="min-w-120">Project Name</th>
                                                            <th class="min-w-120">Block number</th>
                                                            <th class="min-w-120">Flat number</th>
                                                            <th class="min-w-120">Title</th>
                                                            <th class="min-w-120">PDF</th>
                                                            <th class="min-w-120">Action </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:HiddenField ID="HiddenField1" Value='<%# Eval("ProjectID") %>' runat="server" />
                                                    <td><%# GetRowNo(Convert.ToString(Container.ItemIndex + 1))%> </td>
                                                    <td><%# Bindprojectname(Convert.ToInt32(Eval("ProjectID"))) %> </td>
                                                    <td><%# BindBlockname(Convert.ToInt32(Eval("BlockID"))) %> </td>
                                                    <td><%# ViewFlatNameByFlatID(Convert.ToInt32(Eval("FlatID"))) %> </td>
                                                    <td><%# (Eval("Title")) %> </td>
                                                    <td>
                                                        <a href="#" class="me-3" data-bs-toggle="tooltip" title="View" onclick="window.open('<%#"/FlatQualityReportDoc/"+ Eval("PDFName") %>', '_blank')" "); return false;">
                                                            <i class="bi bi-eye b5-icon-et-dlt "></i>
                                                        </a>


                                                       </td>
                                                    <td>
                                                        <asp:LinkButton class="edit-img me-3 " ID="lkedit" runat="server" CommandName="Edit"
                                                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "FlatID") %>'>
                                                    <i class="bi bi-pencil-square b5-icon-et-dlt" data-bs-toggle="tooltip" title="Edit"></i>
                                                        </asp:LinkButton>
                                                        <a class="swtAltCancel ">
                                                            <i class="bi bi-trash b5-icon-et-dlt" data-bs-toggle="tooltip" title="Delete"></i>
                                                        </a>
                                                        <asp:LinkButton ID="LinkButton2" ClientIDMode="Static" CausesValidation="false" runat="server" class="dlt-img hidden d-none" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("FlatID") %>' Style="display: none">
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
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
                Powered by <a class="text-uppercase" href="https://duffldigital.com/" target="_blank">Duffl Digital</a>
            </div>
        </div>
    </footer>



    <script>
        function showFile(fileUrl) {
            Swal.fire({
                html: `
                <div style="position: relative;">
                    <div class="btn-close-icon" onclick="Swal.close()" style="cursor: pointer; position: absolute; top: -15px; right: -25px;">&times;</div>
                    <h2 class="fw-bold">Preview</h2>
                    <iframe src="${fileUrl}" width="100%" height="400px"></iframe>
                    <br>
                    <button onclick="window.open('${fileUrl}', '_blank')" class="btn btn-primary mt-2">View in New Tab</button>
                </div> 
            `,
                showConfirmButton: false, // Removes the OK button
            });
        }
    </script>


    <script> 
        function validatePage() {
            var flag = Page_ClientValidate('val')
            return flag;
        }

        function initializeDeleteEvents() {
            const cancelButtons = document.querySelectorAll('.swtAltCancel');
            cancelButtons.forEach((cancelButton) => {
                cancelButton.addEventListener('click', function () {
                    const linkButton = this.closest('tr')?.querySelector('.dlt-img.hidden');
                    Swal.fire({
                        title: 'Are you sure you want to delete?',
                        showCancelButton: true,
                        confirmButtonText: 'Yes',
                        cancelButtonText: 'No',
                        customClass: {
                            confirmButton: 'handle-btn-danger',
                            cancelButton: 'handle-btn-success',
                        }
                    }).then((result) => {
                        if (result.isConfirmed && linkButton) {
                            linkButton.click(); // Triggers the server-side delete function
                        }
                    });
                });
            });
        }

        // Attach events on page load
        document.addEventListener('DOMContentLoaded', function () {
            initializeDeleteEvents();
        });

        // Attach events after UpdatePanel updates
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            initializeDeleteEvents();
        });
    </script>


</asp:Content>
