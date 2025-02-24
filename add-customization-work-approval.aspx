<%@ Page Title="" Language="C#" MasterPageFile="~/AdminKey2h.master" AutoEventWireup="true" CodeFile="add-customization-work-approval.aspx.cs" Inherits="add_customization_work_approval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .custom-number-input::-webkit-inner-spin-button,
        .custom-number-input::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        /* For Firefox */
        .custom-number-input[type="number"] {
            -moz-appearance: textfield;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="content">
        <div class="panel-header bg-primary-gradient">
            <div class="page-inner py-5">
                <div class="d-flex pb-2 align-items-left align-items-sm-center flex-column flex-sm-row justify-content-between">
                    <div class="d-flex">
                        <h2 class="text-white mb-0 fw-bold text-uppercase">
                            <asp:Label ID="lblDisplaytext" runat="server" Text=""></asp:Label>
                        </h2>
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
                            <div class="form-group">
                                <div class="form-border margin-top20">
                                    <div class="form-title">
                                        <h3>Customization Work Details</h3>
                                    </div>
                                    <div class="row mx-0 margin-top20 mb-4 pt-2">
                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:HiddenField ID="hdnCostID" runat="server" />
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Project Name <span class="text-danger">*</span></label>
                                                        <i class="bi bi-journal-bookmark-fill b5-icon"></i>
                                                        <asp:DropDownList ID="ddlProName" AutoPostBack="true" OnSelectedIndexChanged="ddlProName_SelectedIndexChanged" class="bs-select form-control input-sm" runat="server">
                                                            <asp:ListItem Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <span class="error">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" Display="Dynamic" runat="server" ValidationGroup="val"
                                                            ControlToValidate="ddlProName" InitialValue="" ErrorMessage="Select project name">
                                                        </asp:RequiredFieldValidator>
                                                    </span>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnAdd" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Block Name <span class="text-danger">*</span></label>
                                                        <i class="bi bi-building b5-icon"></i>
                                                        <asp:DropDownList ID="ddlBlockNumber" AutoPostBack="true" OnSelectedIndexChanged="ddlBlockNumber_SelectedIndexChanged" class="bs-select form-control input-sm" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                    <span class="error">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" Display="Dynamic" runat="server" ValidationGroup="val"
                                                            ControlToValidate="ddlBlockNumber" InitialValue="" ErrorMessage="Select block name">
                                                        </asp:RequiredFieldValidator>
                                                    </span>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnAdd" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Flat Number <span class="text-danger">*</span></label>
                                                        <i class="bi bi-file-binary b5-icon"></i>
                                                        <asp:DropDownList ID="ddlFlatNumber" AutoPostBack="true" ClientIDMode="Static" OnSelectedIndexChanged="ddlFlatNumber_SelectedIndexChanged" class="bs-select form-control input-sm" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                    <span class="error">
                                                        <asp:RequiredFieldValidator ClientIDMode="Static" Display="Dynamic" EnableClientScript="true" SetFocusOnError="true" ControlToValidate="ddlFlatNumber" ValidationGroup="val" ID="RequiredFieldValidator13" runat="server" ErrorMessage="Select flat no. "></asp:RequiredFieldValidator>
                                                    </span>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnAdd" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>

                                        </div>
                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Customer Name </label>
                                                        <i class="bi bi-person-square b5-icon"></i>
                                                        <asp:TextBox runat="server" ID="txtCustomerName" class="form-control input-sm" ReadOnly="true" EnableViewState="true" autocomplete="off" placeholder=""></asp:TextBox>
                                                    </div>
                                                    <asp:Label ID="lblcustomernameerror" ClientIDMode="Static" class="align-items-center text-center error" runat="server" Text=""></asp:Label>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnAdd" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Work Title <span class="text-danger">*</span></label>
                                                        <i class="bi bi-body-text b5-icon"></i>
                                                        <asp:TextBox runat="server" ID="txtWorkTitle" class="form-control input-sm capitalize-input" autocomplete="off" placeholder=""></asp:TextBox>
                                                    </div>
                                                    <span class="error">
                                                        <asp:RequiredFieldValidator ClientIDMode="Static" Display="Dynamic" EnableClientScript="true" SetFocusOnError="true" ControlToValidate="txtWorkTitle" ValidationGroup="val" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter work title"></asp:RequiredFieldValidator>
                                                    </span>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnAdd" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="col-sm-4 col-xl-3 pt-3">

                                            <div class="input-icon input-icon-sm right">
                                                <label>Remarks <span class="text-danger"></span></label>
                                                <i class="bi bi-body-text b5-icon"></i>
                                                <asp:TextBox runat="server" ID="txtRemarks" TextMode="MultiLine" col="6" Rows="3" class="form-control input-sm capitalize-input" autocomplete="off" placeholder=""></asp:TextBox>
                                            </div>

                                        </div>
                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Approval status  <span class="text-danger"></span></label>
                                                        <i class="bi bi-journal-text b5-icon"></i>
                                                        <asp:DropDownList ID="ddlApprovalstatus" class="bs-select form-control input-sm" runat="server">
                                                            <asp:ListItem Value=""></asp:ListItem>
                                                            <asp:ListItem Text="Approved" Value="Approved"></asp:ListItem>
                                                            <asp:ListItem Text="Disapproved" Value="Disapproved"></asp:ListItem>
                                                            <asp:ListItem Text="Want to discuss" Value="Want to discuss"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlApprovalstatus" EventName="SelectedIndexChanged" />
                                                    <asp:PostBackTrigger ControlID="btnAdd" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="col-sm-4 col-xl-4 pt-3">
                                            <div class="input-icon input-icon-sm right">
                                                <label>Customisation Details <span class="text-danger">*</span></label>
                                                <i class="bi bi-file-earmark-zip b5-icon"></i>
                                                <asp:FileUpload ID="flDemandUpload" ClientIDMode="Static" accept=".pdf, .jpg, .jpeg, .png, .doc" class="form-control input-sm FluploadPDF" autocomplete="off" placeholder="" runat="server" />
                                                <span class="handle-file-request">(pdf,jpg,jpeg,png,doc only upload, max size of 800 KB)</span>
                                            </div>
                                            <asp:HiddenField ID="hdndemandUpload" runat="server" />
                                            <span class="error">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="val" Display="Dynamic"
                                                    ControlToValidate="flDemandUpload" InitialValue="" ErrorMessage="Upload PDF">
                                                </asp:RequiredFieldValidator>
                                                <asp:Label ID="lblflDemandUpload" CssClass="lblflDemandUpload " runat="server" ForeColor="#d41111" Text="" Display="Dynamic"></asp:Label>
                                            </span>
                                            <span class="error"></span>
                                            <div class="view-demand-upload-img view-demand-upload btn-view-pop mt-3  ViewFluploadPDF btn-view" runat="server" id="viewproscreenbtn" style="display: none">
                                                <i class="bi bi-eye"></i>View PDF
                                            </div>
                                        </div>

                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Amount <span class="text-danger">*</span></label>
                                                        <i class="bi bi-cash-stack b5-icon"></i>
                                                        <asp:TextBox runat="server" ID="txtAmount" MaxLength="10" class="form-control input-sm input-value" autocomplete="off"></asp:TextBox>
                                                    </div>
                                                    <span class="error">
                                                        <asp:RequiredFieldValidator ClientIDMode="Static" Display="Dynamic" EnableClientScript="true" SetFocusOnError="true" ControlToValidate="txtAmount" ValidationGroup="val" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter amount"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ClientIDMode="Static" ID="RegularExpressionValidator3" Display="Dynamic" runat="server" ValidationGroup="val" ControlToValidate="txtAmount" ValidationExpression="^\d{0,9}$" ErrorMessage="Enter valid amount (only numbers)"></asp:RegularExpressionValidator>
                                                    </span>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlApprovalstatus" EventName="SelectedIndexChanged" />
                                                    <asp:PostBackTrigger ControlID="btnAdd" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>

                                        <!-- Display Added Values -->
                                        <div class="added-values"></div>
                                    </div>
                                    <div class="card-footer mx-2 pb-4">
                                        <div class="d-flex justify-content-center">
                                            <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:LinkButton ID="btnAdd" OnClientClick="if (validatePage1()) { this.value='Please wait..'; this.style.display='none'; document.getElementById('bWait1').style.display = ''; } else { return false; }" OnClick="btnAdd_Click" runat="server" class="btn btn-sm handle-btn-success add-btn">
                                                        Submit
                                                    </asp:LinkButton>
                                                    <button type="button" style="display: none" id="bWait1" class="btn btn-secondary btn-sm me-1"><i class='fa fa-spinner fa-spin'></i>Please wait</button>
                                                    <div class="btn btn-sm handle-btn-danger swtAltCancel ms-1">Cancel</div>
                                                    <asp:Button ID="btnCancel" ClientIDMode="Static" runat="server" Text="Cancel Project" OnClick="btnCancel_Click" Style="display: none;" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnAdd" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlApprovalstatus" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                <ContentTemplate>
                                    <div class="form-group" id="divrptCustomers" clientidmode="Static" runat="server">
                                        <div class="form-border margin-top20">
                                            <div class="form-title">
                                                <h3>View Customization Details</h3>
                                            </div>
                                            <div class="table-responsive pt-4 mt-md-2 mt-0 px-4">
                                                <asp:Repeater ID="rpCustomization" runat="server">
                                                    <HeaderTemplate>
                                                        <table class="table table-bordered" id="tblcustomization">
                                                            <thead>
                                                                <th># </th>
                                                                <th>Work Title </th>
                                                                <th>Approval Status</th>
                                                                <th>Amount</th>
                                                                <th>Remarks</th>
                                                                <th>Action</th>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%# GetRowNo(Convert.ToString(Container.ItemIndex + 1))%> </td>
                                                            <td>

                                                                <asp:HiddenField ID="hdnCWID" Value='<%# Eval("CWAID") %>' runat="server" />
                                                                <asp:HiddenField ID="hdnupload" Value='<%# Eval("CustomizationDetails") %>' runat="server" />

                                                                <label class="lbltitle"><%# Eval("CustomizationWork") %></label>
                                                                <input type="text" class="form-control txttitle" style="display: none" />

                                                            <td>
                                                                <label class="lblWorkStatus"><%#  Eval("ApprovalStatus") %></label>
                                                                <asp:DropDownList ID="rprddlApprovalStatus" runat="server" CssClass="form-control rprddlApprovalStatus" Style="display: none;">
                                                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                                                    <asp:ListItem Text="Approved" Value="Approved"></asp:ListItem>
                                                                    <asp:ListItem Text="Disapproved" Value="Disapproved"></asp:ListItem>
                                                                    <asp:ListItem Text="Want to discuss" Value="Want to discuss"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <div class="lblAmount">
                                                                    <label class="labelAmount">
                                                                        <%#"₹" + Eval("Amount") %>
                                                                    </label>
                                                                    <input type="text" class="form-control txtAmount" style="display: none" />
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div>
                                                                    <label class="lblremarks">
                                                                        <%#Eval("Remarks") %>
                                                                    </label>
                                                                    <input type="text" class="form-control txtremrks" style="display: none" />
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <a href="javascript:void(0);" class="btnEdit" onclick="editRow(this)"><i class="bi bi-pencil-square b5-icon-et-dlt me-3" data-bs-toggle="tooltip" title="Edit"></i></a>
                                                                <a href="javascript:void(0);" class="btnUpdate" onclick="updateRow(this)" style="display: none;"><i class="bi bi-check2-square b5-icon-et-dlt me-3" data-bs-toggle="tooltip" title="Update"></i></a>
                                                                <a href="javascript:void(0);" class="btnCancel" onclick="cancelEdit(this)" style="display: none;"><i class="bi bi-x-circle b5-icon-et-dlt me-3" data-bs-toggle="tooltip" title="Cancel"></i></a>
                                                                <%# Convert.ToBoolean(Getreceiptstatus(Convert.ToInt32(Eval("CWAID")))) 
    ? String.Format("<a href=\"javascript:void(0);\" class=\"btnDelete\" onclick=\"deleteRow(this)\"><i class=\"bi bi-trash b5-icon-et-dlt me-3\" data-bs-toggle=\"tooltip\" title=\"Delete\"></i></a>", Eval("CWAID"))
    : "" %>

                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>

                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnAdd" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlApprovalstatus" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
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
        function deleteRow(element) {
            // Get the parent row (assuming the <a> tag is inside a <tr>)
            var row = $(element).closest('tr');
            // Now you can remove the row
            row.remove();
        }

    </script>

    <script type="text/javascript">
        function validatePage1() {
            var flag = Page_ClientValidate('val');
            return flag;
        }
    </script>





    <script>
        function editRow(btn) {
            const row = btn.closest('tr');



            row.querySelector('.txttitle').value = row.querySelector('.lbltitle').innerText;
            row.querySelector('.txtAmount').value = row.querySelector('.labelAmount').innerText.replace('₹', '').trim();
            row.querySelector('.txtremrks').value = row.querySelector('.lblremarks').innerText;
            row.querySelector('.rprddlApprovalStatus').value = row.querySelector('.lblWorkStatus').innerText;

            row.querySelector('.lbltitle').style.display = 'none';
            row.querySelector('.txttitle').style.display = 'inline';

            row.querySelector('.lblWorkStatus').style.display = 'none';
            row.querySelector('.rprddlApprovalStatus').style.display = 'inline';

            row.querySelector('.labelAmount').style.display = 'none';
            row.querySelector('.txtAmount').style.display = 'inline';

            row.querySelector('.lblremarks').style.display = 'none';
            row.querySelector('.txtremrks').style.display = 'inline';

            row.querySelector('.btnEdit').style.display = 'none';
            row.querySelector('.btnUpdate').style.display = 'inline';
            row.querySelector('.btnCancel').style.display = 'inline';




        }

        function cancelEdit(btn) {
            const row = btn.closest('tr');
            row.querySelector('.lbltitle').style.display = 'inline';
            row.querySelector('.txttitle').style.display = 'none';

            row.querySelector('.lblWorkStatus').style.display = 'inline';
            row.querySelector('.rprddlApprovalStatus').style.display = 'none';

            row.querySelector('.labelAmount').style.display = 'inline';
            row.querySelector('.txtAmount').style.display = 'none';

            row.querySelector('.lblremarks').style.display = 'inline';
            row.querySelector('.txtremrks').style.display = 'none';

            row.querySelector('.btnEdit').style.display = 'inline';
            row.querySelector('.btnUpdate').style.display = 'none';
            row.querySelector('.btnCancel').style.display = 'none';




        }

        function updateRow(btn) {

            const row = btn.closest('tr');
            const hiddenFields = row.querySelectorAll('input[type="hidden"]');
            const costLabelID = hiddenFields[0]?.value || '';
            const fileupload = hiddenFields[1]?.value || '';

            const updatebtn = row.querySelector('.btnUpdate');

            updatebtn.style.display = 'none';

            const title = row.querySelector('.txttitle').value.trim();
            const Amount = row.querySelector('.txtAmount').value.trim();
            const remarks = row.querySelector('.txtremrks').value.trim();
            const selectedStatus = row.querySelector('.rprddlApprovalStatus').value;
            const selectedValue = document.getElementById('<%= ddlFlatNumber.ClientID %>')?.value || '';

            if (!title || !Amount || Amount === '0' || !selectedValue || !selectedStatus) {
                row.querySelector('.btnUpdate').style.display = 'inline';
                Swal.fire({
                    text: 'Please fill in mandatory details before submitting.',
                    confirmButtonText: 'OK',
                    customClass: { confirmButton: 'handle-btn-success' }
                });
                return;
            }

            // Amount must be a valid number
            if (!/^\d*\.?\d+$/.test(Amount)) {
                row.querySelector('.btnUpdate').style.display = 'inline';
                Swal.fire({
                    text: 'Amount must be a valid number.',
                    confirmButtonText: 'OK',
                    customClass: { confirmButton: 'handle-btn-success' } // You can change the class if needed
                });
                return;
            }

            $.ajax({
                type: 'POST',
                url: 'add-customization-work-approval.aspx/Updateapproval',
                data: JSON.stringify({ costLabelID, title, Amount, selectedValue, selectedStatus, fileupload, remarks }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (response) {
                    if (response.d != "Customization work approval details already exist") {


                        // Extract values from response
                        let data = response.d;
                        row.querySelector('.lbltitle').innerText = data.Title || title;
                        if (row.querySelector('.rprddlApprovalStatus').value) {
                            row.querySelector('.lblWorkStatus').innerText = row.querySelector('.rprddlApprovalStatus').value;
                        }
                        else {
                            row.querySelector('.lblWorkStatus').innerText = "Pending";
                        }
                        row.querySelector('.labelAmount').innerText = "₹" + (data.Amount || Amount);
                        row.querySelector('.lblremarks').innerText = data.Remarks || remarks;

                        cancelEdit(btn);

                        if (response.d) {
                            Swal.fire({

                                title: response.d,
                                confirmButtonText: 'OK',
                                customClass: { confirmButton: 'handle-btn-success' }
                            });
                        }
                    }
                    else {
                        if (response.d) {
                            Swal.fire({

                                title: response.d,
                                confirmButtonText: 'OK',
                                customClass: { confirmButton: 'handle-btn-success' }
                            });
                        }
                        //row.querySelector('.lbltitle').innerText = title;
                        //row.querySelector('.lblWorkStatus').innerText = selectedStatus;
                        //row.querySelector('.labelAmount').innerText = "₹" + (Amount);
                        //row.querySelector('.lblremarks').innerText = remarks;
                        cancelEdit(btn);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("AJAX Error:", status, error);
                    Swal.fire({
                        icon: 'error',
                        title: 'Error!',
                        text: 'Error updating row!',
                        confirmButtonText: 'OK'
                    });
                }
            });
        }

    </script>

    <script type="text/javascript">

        function deleteRow(btn) {
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
                if (result.isConfirmed) {
                    const row = btn.closest('tr');
                    const hiddenField = row.querySelector('input[type="hidden"]');
                    const CWID = hiddenField ? hiddenField.value : '';

                    if (!CWID) {
                        alert('CustomWorkID is missing!');
                        return;
                    }

                    var dropflatname = document.getElementById('<%= ddlFlatNumber.ClientID %>');
                    var selectedValue = dropflatname ? dropflatname.value : '';

                    $.ajax({
                        type: 'POST',
                        url: 'add-customization-work-approval.aspx/DeleteCustomizationWorksTitle',
                        data: JSON.stringify({ CWID: CWID, selectedValue: selectedValue }),
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (response) {
                            //  loadRepeaterData(Selected);
                            row.remove();


                            const table = document.getElementById('tblcustomization');
                            const rows = table.querySelectorAll('tbody tr');
                            if (rows.length === 0) {
                                const repeaterContainer = document.getElementById('<%= divrptCustomers.ClientID %>').closest('div');
                                if (repeaterContainer) {
                                    repeaterContainer.style.display = 'none';
                                }
                            }

                            if (response.d == "1") {
                                Swal.fire({
                                    title: 'Customization details has been deleted', confirmButtonText: 'Ok',
                                    customClass: {
                                        confirmButton: 'handle-btn-success'
                                    },
                                });
                            }
                            else {
                                Swal.fire({
                                    title: 'Customization details has been not deleted', confirmButtonText: 'Ok',
                                    customClass: {
                                        confirmButton: 'handle-btn-success'
                                    },
                                });
                            }
                            //loadRepeaterData(selectedValue);

                        },
                        error: function () {
                            alert('Error deleting row!');
                        }
                    });
                } else {
                    return;
                }
            });
        }

    </script>


    <script type="text/javascript">
        function loadRepeaterData(selectedValue) {
            $.ajax({
                type: 'POST',
                url: 'add-customization-work.aspx/GetCostDetails',
                data: JSON.stringify({ selectedValue: selectedValue }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (response) {
                    if (response && response.d) {
                        // console.log(response.d);
                        const data = response.d;
                        const repeaterBody = document.querySelector('#tblcustomization tbody');
                        if (repeaterBody) {
                            repeaterBody.innerHTML = '';
                        }
                        data.forEach(function (item, index) {
                            const row = document.createElement('tr');
                            row.innerHTML = `
                  <td>${index + 1}</td>
                 
                

                  <td> <input type="hidden" id="hdnCWID" ClientIDMode="Static" value="${item.CWID}" />
                  <label class="lbltitle">${item.WorkTitle}</label>
                  </td>
                    
                   <td><label class="lblWorkStatus">${item.WorkStatus}</label></td>
                   <td><div class="lblAmount"> <p>₹${item.Amount}</p></div></td>
                
                  <td>
                      <a href="javascript:void(0);" class="btnDelete" onclick="deleteRow(this)">
                          <i class="bi bi-trash b5-icon-et-dlt" data-bs-toggle="tooltip" title="Delete"></i>
                      </a>
                  </td> `;
                            repeaterBody.appendChild(row);
                        });

                        // Initialize tooltips
                        const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
                        tooltipTriggerList.forEach(function (tooltipTriggerEl) {
                            new bootstrap.Tooltip(tooltipTriggerEl);
                        });

                        // Toggle visibility of the repeater container
                        const repeaterContainer = document.getElementById('<%= divrptCustomers.ClientID %>');
                        if (repeaterContainer) {
                            repeaterContainer.style.display = data.length ? 'block' : 'none';
                        }
                    }
                },
                error: function () {
                    alert('Error loading repeater data!');
                }
            });
        }
    </script>




    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            function initializeFileUpload() {
                var fileUploader = document.querySelector('.FluploadPDF');
                var errorLabel = document.querySelector('.lblflDemandUpload');
                var screensrc = null;
                var fileType = null;

                if (!fileUploader || !errorLabel) {
                    console.error("Required elements not found in the DOM.");
                    return;
                }

                function resetUploader() {
                    screensrc = null;
                    fileType = null;
                    setTimeout(() => {
                        fileUploader.value = "";
                    }, 500); // 500ms delay to ensure error message is shown
                }

                fileUploader.addEventListener('change', function (event) {
                    var input = event.target;
                    var file = input.files[0];
                    var validFileTypes = ['application/pdf', 'image/jpeg', 'image/png', 'application/msword'];
                    var validFileTypesExtensions = ['pdf', 'jpg', 'jpeg', 'png', 'doc'];

                    errorLabel.textContent = '';

                    if (!file) {
                        resetUploader();
                        return;
                    }

                    // Get file extension
                    var fileExtension = file.name.split('.').pop().toLowerCase();

                    // Validate file extension
                    if (!validFileTypesExtensions.includes(fileExtension)) {
                        errorLabel.textContent = "Invalid file type! Only PDF, JPG, JPEG, PNG, or DOC files are allowed.";
                        resetUploader();
                        return;
                    }

                    // Validate MIME type
                    if (!validFileTypes.includes(file.type)) {
                        errorLabel.textContent = "Invalid file type! Only PDF, JPG, JPEG, PNG, or DOC files are allowed.";
                        resetUploader();
                        return;
                    }

                    // Validate file size (must be less than 800 KB)
                    if (file.size > 800 * 1024) {
                        errorLabel.textContent = "File size must be less than 800 KB.";
                        resetUploader();
                        return;
                    }

                    /* errorLabel.textContent = "File is valid!";*/
                });

                fileUploader.addEventListener('click', function () {
                    errorLabel.textContent = ""; // Clear error when clicking input
                    resetUploader();
                });
            }

            initializeFileUpload();
        });
    </script>
















    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            attachSweetAlert();
        });

        document.addEventListener('DOMContentLoaded', function () {
            attachSweetAlert();
        });
        function attachSweetAlert() {
            const cancelButton = document.querySelector('.swtAltCancel');
            if (cancelButton) {
                cancelButton.addEventListener('click', function () {
                    Swal.fire({
                        title: 'Are you sure you want to cancel?',
                        showCancelButton: true,
                        confirmButtonText: 'Yes',
                        cancelButtonText: 'No',
                        customClass: {
                            confirmButton: 'handle-btn-danger',
                            cancelButton: 'handle-btn-success',
                        }
                    }).then((result) => {
                        if (result.isConfirmed) {
                            const cancelBtn = document.getElementById('<%= btnCancel.ClientID %>');
                            if (cancelBtn) {
                                cancelBtn.click();
                            }
                        }
                    });
                });
            }
        }
    </script>

    <script>
        document.getElementById('<%= txtAmount.ClientID %>').addEventListener('keypress', function (e) {
            if (!/^\d+$/.test(e.key)) {
                e.preventDefault();
            }
        });
    </script>
</asp:Content>



