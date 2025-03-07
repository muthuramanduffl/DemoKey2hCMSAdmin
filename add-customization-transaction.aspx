﻿<%@ Page Title="" Language="C#" MasterPageFile="AdminKey2h.master" AutoEventWireup="true" CodeFile="add-customization-transaction.aspx.cs" Inherits="adminkey2hcom_AddCustomizationTransaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="assets/css/dtsel.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content">
        <div class="panel-header bg-primary-gradient">
            <div class="page-inner py-5">
                <div class="d-flex pb-2 align-items-left align-items-sm-center flex-column flex-sm-row justify-content-between">
                    <div class="d-flex">
                        <h2 class="text-white mb-0 fw-bold text-uppercase">
                            <asp:Label ID="lbldisplayText" runat="server" Text=""></asp:Label>
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
                                        <h3>Customization Transaction Details</h3>
                                    </div>
                                    <div class="row mx-0 margin-top20 mb-4">
                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Project Name <span class="text-danger">*</span></label>
                                                        <i class="bi bi-journal-bookmark-fill b5-icon"></i>
                                                        <asp:DropDownList ID="ddlProName" AutoPostBack="true" OnSelectedIndexChanged="ddlProName_SelectedIndexChanged" class="bs-select form-control input-sm" runat="server">
                                                            <asp:ListItem Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <span class="error">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="projval"
                                                            ControlToValidate="ddlProName" InitialValue="" ErrorMessage="Select project name">
                                                        </asp:RequiredFieldValidator>
                                                    </span>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <div class="input-icon input-icon-sm right">
                                                <label>Block Name <span class="text-danger">*</span></label>
                                                <i class="bi bi-building b5-icon"></i>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <asp:DropDownList ID="ddlBlockNumber" AutoPostBack="true" OnSelectedIndexChanged="ddlBlockNumber_SelectedIndexChanged" class="bs-select form-control input-sm" runat="server">
                                                        </asp:DropDownList>
                                                        <span class="error">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="projval"
                                                                ControlToValidate="ddlBlockNumber" InitialValue="" ErrorMessage="Select block name">
                                                            </asp:RequiredFieldValidator>
                                                        </span>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Flat Number <span class="text-danger">*</span></label>
                                                        <i class="bi bi-file-binary b5-icon"></i>
                                                        <asp:DropDownList ID="ddlFlatNumber" AutoPostBack="true" OnSelectedIndexChanged="ddlFlatNumber_SelectedIndexChanged" class="bs-select form-control input-sm" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                    <span class="error">
                                                        <asp:RequiredFieldValidator ClientIDMode="Static" EnableClientScript="true" SetFocusOnError="true" ControlToValidate="ddlFlatNumber" Display="Dynamic" ValidationGroup="projval" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Select flat no. "></asp:RequiredFieldValidator>
                                                    </span>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Customer Name <span class="text-danger">*</span></label>
                                                        <i class="bi bi-person-fill b5-icon"></i>
                                                        <asp:TextBox runat="server" ID="txtCustomerName" MaxLength="8" class="form-control input-sm" autocomplete="off" ReadOnly="true" placeholder=""></asp:TextBox>
                                                    </div>
                                                    <span class="error">
                                                        <asp:Label ID="lbldoesnotexist" runat="server" Text="" Display="Dynamic"></asp:Label>
                                                    </span>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                                    <asp:PostBackTrigger ControlID="btnSave" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Demand Type <span class="text-danger">*</span></label>
                                                        <i class="bi bi-bar-chart-line b5-icon"></i>
                                                        <asp:DropDownList ID="ddlDemandType" AutoPostBack="true" OnSelectedIndexChanged="ddlDemandType_SelectedIndexChanged" class="bs-select form-control input-sm" runat="server">
                                                            
                                                        </asp:DropDownList>
                                                    </div>
                                                    <span class="error">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="projval"
                                                            ControlToValidate="ddlDemandType" InitialValue="" ErrorMessage="Select demand type">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblDemandTypeMessage" ClientIDMode="Static" Display="Dynamic" class="align-items-center text-center" runat="server" Text=""></asp:Label>

                                                    </span>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlDemandType" EventName="SelectedIndexChanged" />
                                                    <asp:PostBackTrigger ControlID="btnSave" />

                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <div class="input-icon input-icon-sm right">
                                                <label>Upload <span class="text-danger">*</span></label>
                                                <i class="bi bi-file-earmark-zip b5-icon"></i>
                                                <asp:FileUpload ID="flPaymentTransactionUpload" ClientIDMode="Static" accept=".pdf" class="form-control input-sm flPaymentTransactionUpload FluploadPDF" autocomplete="off" placeholder="" runat="server" />
                                                <span class="handle-file-request">(PDF file only, max size of 1.5 MB)</span>
                                            </div>
                                            <asp:HiddenField ID="hdnPaymentTransactionUpload" runat="server" />
                                            <span class="error">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="projval" Display="Dynamic"
                                                    ControlToValidate="flPaymentTransactionUpload" InitialValue="" ErrorMessage="Upload PDF"> </asp:RequiredFieldValidator>
                                                <asp:Label ID="lblflPaymentTransactionUpload" CssClass="lblflTransactionUpload" Display="Dynamic" runat="server" ForeColor="#d41111" Text=""></asp:Label>
                                            </span>
                                            <span class="error"></span>
                                            <div class="view-demand-upload-img view-demand-upload mt-3 btn-view-pop ViewFluploadPDF btn-view" runat="server" id="viewproscreenbtn" style="display: none">
                                                <i class="bi bi-eye"></i>View PDF
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Amount <span class="text-danger">*</span></label>
                                                        <i class="bi bi-cash-stack b5-icon"></i>
                                                        <asp:TextBox ID="txtAmount" MaxLength="10" ClientIDMode="Static" onkeyup="keyup(this.id,'lblamount')" class="form-control input-sm" runat="server"></asp:TextBox>

                                                    </div>
                                                    <span class="error">
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator5"
                                                            runat="server"
                                                            ControlToValidate="txtamount"
                                                            ValidationGroup="projval"
                                                            InitialValue=""
                                                            ErrorMessage="Enter Amount"
                                                            Display="Dynamic" />
                                                        <asp:RegularExpressionValidator ID="RegularFieldValidator1" runat="server" ControlToValidate="txtamount" ValidationGroup="projval" ValidationExpression="^\d{0,9}$" ErrorMessage="Enter a valid amount" Display="Dynamic"></asp:RegularExpressionValidator>
                                                    </span>

                                                    <span class="handle-file-request">
                                                        <asp:Label ID="lblcustomernameerror" Display="Dynamic" ClientIDMode="Static" class="align-items-center text-center error" runat="server" Text=""></asp:Label>


                                                        <asp:Label ID="lblamount" ClientIDMode="static" runat="server"></asp:Label>
                                                    </span>
                                                    <asp:Label ID="lblerrormsg" ClientIDMode="Static" ForeColor="#D41111" runat="server" Text=""></asp:Label>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlDemandType" EventName="SelectedIndexChanged" />
                                                    <asp:PostBackTrigger ControlID="btnSave" />
                                                </Triggers>
                                            </asp:UpdatePanel>

                                        </div>
                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Payment Mode <span class="text-danger">*</span></label>
                                                        <i class="bi bi-journal-text b5-icon"></i>
                                                        <asp:DropDownList ID="ddlPaymentMode" class="bs-select form-control input-sm" runat="server">
                                                            <asp:ListItem> </asp:ListItem>
                                                            <asp:ListItem Text="Credit Card" Value="1" />
                                                            <asp:ListItem Text="Debit Card" Value="2" />
                                                            <asp:ListItem Text="Net Banking" Value="3" />
                                                            <asp:ListItem Text="UPI" Value="4" />
                                                            <asp:ListItem Text="Wallets" Value="5" />
                                                            <asp:ListItem Text="Cash" Value="6" />
                                                            <asp:ListItem Text="Cheque" Value="7" />
                                                            <asp:ListItem Text="Demand Draft" Value="8" />
                                                            <asp:ListItem Text="NEFT" Value="9" />
                                                            <asp:ListItem Text="RTGS" Value="10" />
                                                            <asp:ListItem Text="IMPS" Value="11" />
                                                        </asp:DropDownList>
                                                    </div>
                                                    <span class="error">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="projval"
                                                            ControlToValidate="ddlPaymentMode" InitialValue="" ErrorMessage="Select payment mode">
                                                        </asp:RequiredFieldValidator>
                                                    </span>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <div class="input-icon input-icon-sm right">
                                                <label>Date <span class="text-danger">*</span></label>
                                                <i class="bi bi-calendar2-plus b5-icon"></i>
                                                <asp:TextBox ID="txtDate" ClientIDMode="Static" class="form-control input-sm" runat="server"></asp:TextBox>
                                            </div>
                                            <span class="error">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="projval"
                                                    ControlToValidate="txtDate" InitialValue="" ErrorMessage="Select date">
                                                </asp:RequiredFieldValidator>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="card-footer mx-2 pb-4">
                                        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                            <ContentTemplate>
                                                <div class="d-flex justify-content-center">
                                                    <asp:Button
                                                        ID="btnSave" ClientIDMode="Static"
                                                        runat="server" OnClick="btnSave_Click"
                                                        Text="Submit" ValidationGroup="projval"
                                                        class="btn btn-sm handle-btn-success me-1 swtAltSubmit btnSave"
                                                        OnClientClick="if (validatePage()) { this.value='Please wait..'; this.style.display='none'; document.getElementById('bWait').style.display = ''; } else { return false; }" Style="min-width: 67px;" />
                                                    <button type="button" style="display: none" id="bWait" class="btn btn-secondary btn-sm me-1"><i class='fa fa-spinner fa-spin'></i>Please wait</button>
                                                    <div class="btn btn-sm handle-btn-danger swtAltCancel">Cancel</div>
                                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel Project" OnClick="btnCancel_Click" Style="display: none;" />
                                                </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                             

                                                <asp:PostBackTrigger ControlID="btnSave" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>

                                </div>
                                <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="form-group" id="divtransactionList" style="display: none" clientidmode="Static" runat="server">
                                            <div class="form-border margin-top20">
                                                <div class="form-title">
                                                    <h3>View Transaction List</h3>
                                                </div>
                                                <div class="table-responsive pt-4 mt-md-2 mt-0 px-4">

                                                    <asp:Repeater ID="rptransactionList" runat="server">
                                                        <HeaderTemplate>
                                                            <table class="table table-bordered" id="tbltransactionList">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="w-sno">#</th>
                                                                        <th>Demand Type</th>
                                                                        <th>View PDF</th>
                                                                        <th>Amount</th>
                                                                        <th>Payment Mode</th>
                                                                        <th>Payment Date</th>
                                                                        <th>Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr id="row<%# Container.ItemIndex %>">
                                                                <asp:HiddenField ID="HiddenField1" Value='<%# Eval("CTID") %>' ClientIDMode="Static" runat="server" />
                                                                <td><%# Container.ItemIndex + 1 %></td>
                                                                <td><%#Eval("CustomizationWork") %></td>
                                                                <td>
                                                                    <div class="view-pdf btn-view" id="viewPdf<%# Container.ItemIndex %>">
                                                                        <a target="_blank" href='<%# "/CustomizationTransactionReceipt/"+Eval("ReceiptPDF") %>' class="btn-view btnview-pdf" data-bs-toggle="tooltip" title="View">
                                                                            <i class="bi bi-eye b5-icon-et-dlt"></i>
                                                                        </a>
                                                                    </div>
                                                                </td>
                                                                <td><%#Eval("PaidAmount") %></td>
                                                                <td><%#Eval("PaymentMode") %></td>
                                                                <td><%#Eval("PaymentUpdatedDate", "{0:dd - MM - yyyy}") %></td>
                                                                <td>
                                                                    <a href="javascript:void(0);" class="btnDelete " onclick="deleteRow(this)"><i class="bi bi-trash b5-icon-et-dlt" data-bs-toggle="tooltip" title="Delete"></i></a>
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
                                        <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                        <asp:PostBackTrigger ControlID="btnSave" />
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
                    Powered by <a class="text-uppercase" href="https://duffldigital.com/" target="_blank">Duffl Digital</a>
                </div>
            </div>
        </footer>

        <!-- Date Picker -->
        <script src="assets/js/dtsel.js"></script>




        <script>
            //Date picker
            var inputField1 = document.getElementById("txtDate");
            inputField1.addEventListener("keydown", function (event) {
                event.preventDefault();
            });
            document.addEventListener('DOMContentLoaded', function () {
                const datePickerOptions = {
                    showTime: false,
                    showDate: true,
                    dateFormat: "dd-mm-yyyy"
                };
                new dtsel.DTS('input[id="txtDate"]', datePickerOptions);
            });
        </script>

        <script type="text/javascript">
            document.addEventListener('DOMContentLoaded', function () {
                function initializeFileUpload() {
                    var fileUploader = document.querySelector('.FluploadPDF');
                    var viewLogoBtn = document.querySelector('.ViewFluploadPDF');
                    var errorLabel = document.querySelector('.lblflTransactionUpload');
                    var screensrc = null; // Store the PDF data URL

                    if (!fileUploader || !viewLogoBtn || !errorLabel) {
                        console.error("Required elements not found.");
                        return;
                    }
                    fileUploader.addEventListener('change', function (event) {
                        var file = event.target.files[0];
                        if (!file) {
                            console.error("No file selected.");
                            return;
                        }
                        if (file.type !== 'application/pdf') {
                            errorLabel.textContent = "Only PDF files are allowed.";
                            errorLabel.style.display = 'block';
                            fileUploader.value = '';
                            screensrc = null;
                            viewLogoBtn.style.display = 'none';
                            return;
                        }
                        if (file.size > 1548576) { // 1 MB
                            errorLabel.textContent = "File size must be less than 1.5 MB";
                            errorLabel.style.display = 'block';
                            fileUploader.value = '';
                            screensrc = null;
                            viewLogoBtn.style.display = 'none';
                            return;
                        }
                        errorLabel.style.display = 'none';
                        const reader = new FileReader();
                        reader.onload = function (e) {
                            screensrc = e.target.result; // Store the PDF data URL
                            viewLogoBtn.style.display = 'inline-block';
                        };
                        reader.onerror = function () {
                            screensrc = null;
                            console.error("Error reading file.");
                        };
                        reader.readAsDataURL(file);
                    });

                    viewLogoBtn.addEventListener('click', function () {
                        if (!screensrc) {
                            console.error("No PDF loaded.");
                            return;
                        }
                        // Open the PDF in a new tab
                        const newWindow = window.open();
                        if (newWindow) {
                            newWindow.document.write(
                                `<iframe src="${screensrc}" style="width:100%; height:100%; border:none;"></iframe>`
                            );
                        } else {
                            console.error("Failed to open a new window/tab.");
                        }
                    });
                }
                initializeFileUpload();
            });
        </script>

        <script type="text/javascript">
            function validatePage() {
                var flag = Page_ClientValidate('projval')
                return flag;
            }



            document.getElementById('<%= txtAmount.ClientID %>').addEventListener('keypress', function (e) {
                if (!/^\d+$/.test(e.key)) {
                    e.preventDefault();
                }
            });




            //Date picker
            var inputField1 = document.getElementById("txtDate");
            inputField1.addEventListener("keydown", function (event) {
                event.preventDefault();
            });
            document.addEventListener('DOMContentLoaded', function () {
                const datePickerOptions = {
                    showTime: false,
                    showDate: true,
                    dateFormat: "dd-mm-yyyy"
                };
                new dtsel.DTS('input[id="txtDate"]', datePickerOptions);
            });
        </script>



        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const cancelButton = document.querySelector('.swtAltCancel');
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
                            // Trigger the ASP.NET Button click to handle postback
                            document.getElementById('<%= btnCancel.ClientID %>').click();
                        } else if (result.dismiss === Swal.DismissReason.cancel) {
                            // You can continue with your customer details submission 
                        }
                    });
                });
            });
            const lblerrmsg = document.getElementById('<%= lblerrormsg.ClientID %>');
            // Existing keyup function
            function keyup(txtID, lblID) {
                lblerrmsg.innerText = "";
                if (lblID === "lblamount") {
                    $("#lblamount").text("");
                }

                const dropFlatName = document.getElementById('<%= ddlFlatNumber.ClientID %>');
                const lblcustomernameerror = document.getElementById('<%= lblcustomernameerror.ClientID %>');
                const demandID = document.getElementById('<%= ddlDemandType.ClientID %>');

                const selectedValue = dropFlatName ? dropFlatName.value : '';
                const demandValue = demandID ? demandID.value : '';

                //alert(demandValue);
                lblcustomernameerror.textContent = "";
                if (!selectedValue || !demandValue) {
                    lblerrmsg.innerText = "Flat ID and demand type are missing!";

                }
                else {
                    lblerrmsg.innerText = "";
                }


                var txtamt = $("#" + txtID).val().replace(/₹/, ""); // Remove ₹ for processing
                if (txtamt !== '') {

                    // Validate that the input contains only numeric values
                    if (!/^\d+(\.\d+)?$/.test(txtamt)) {
                        lblcustomernameerror.textContent = "Please enter a valid numeric amount.";
                        return;
                    }

                    $.ajax({
                        type: "POST",
                        url: "add-customization-transaction.aspx/AmttowordConversion",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ txtamt: txtamt, selectedValue: selectedValue, demandID: demandValue }),
                        success: function (data) {
                            if (data.d == "1") {
                                lblcustomernameerror.textContent = "The amount should not exceed";
                                $("#" + lblID).text("");
                            }
                            else {
                                lblcustomernameerror.textContent = "";
                                $("#" + lblID).text(data.d);
                            }

                        },
                        error: function (xhr) {
                            var responseText = jQuery.parseJSON(xhr.responseText);
                            alert(responseText.Message);
                        }
                    });
                } else {
                    $("#" + lblID).text("");
                    lblcustomernameerror.textContent = "";
                }
            }

        </script>

        <script>

            function deleteRow(btn) {
                Swal.fire({
                    title: 'Are you sure you want to delete?',
                    showCancelButton: true,
                    confirmButtonText: 'Yes',
                    cancelButtonText: 'No',
                    customClass: {
                        confirmButton: 'handle-btn-danger',
                        cancelButton: 'handle-btn-success'
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        const row = btn.closest('tr');
                        const hiddenField = row.querySelector('input[type="hidden"]');
                        const CTID = hiddenField ? hiddenField.value : '';

                        if (!CTID) {
                            lblerrmsg.innerText = "CustomizationTransactionID is missing!";
                            return;
                        }
                        const dropFlatName = document.getElementById('<%= ddlFlatNumber.ClientID %>');
                        const selectedValue = dropFlatName ? dropFlatName.value : '';

                        $.ajax({
                            type: 'POST',
                            url: 'add-customization-transaction.aspx/DeleteTransaction',
                            data: JSON.stringify({ CTID: CTID }),
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            success: function (response) {
                                if (response.d == 1 || response.d === "1") {
                                    loadRepeaterData(selectedValue);
                                    row.remove();
                                    const table = document.getElementById('tbltransactionList');
                                    const rows = Array.from(table.querySelectorAll('tbody tr'));
                                    if (rows.length === 0) {
                                        const repeaterContainer = document.getElementById('<%= divtransactionList.ClientID %>').closest('div');
                                        if (repeaterContainer) {
                                            repeaterContainer.style.display = 'none';
                                        }
                                    }
                                    Swal.fire({
                                        title: 'Customization transaction details have been deleted as requested',
                                        confirmButtonText: 'Ok',
                                        customClass: {
                                            confirmButton: 'handle-btn-success'
                                        }
                                    });
                                }
                            },
                            error: function () {
                                lblerrmsg.innerText = "Error deleting row!";
                            }
                        });
                    }
                });
            }

            function loadRepeaterData(selectedValue) {
                $.ajax({
                    type: 'POST',
                    url: 'add-customization-transaction.aspx/GetCostDetails',
                    data: JSON.stringify({ selectedValue: selectedValue }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (response) {
                        if (response && response.d) {
                            const data = response.d;
                            const repeaterBody = document.querySelector('#tbltransactionList tbody');

                            if (!repeaterBody) {
                                return;
                            }
                            repeaterBody.innerHTML = '';
                            const fragment = document.createDocumentFragment();
                            data.forEach((item, index) => {
                                const row = document.createElement('tr');

                                row.id = `row${index}`;
                                row.innerHTML = `
                        <td>${index + 1}</td>
                        <td>
                            <input type="hidden" class="hdnid" value="${item.CTID}" />
                            <label>${item.WorkTitle}</label>   
                        </td> 
                        <td><div class="lblAmount"> <p>₹ ${item.PaidAmount} </p> </div> </td>
                       
                        <td>
                            <div class="view-pdf btn-view">
                                <a target="_blank" href="/CustomizationTransactionReceipt/${item.ReceiptPDF}" class="btn-view btnview-pdf" data-bs-toggle="tooltip" title="View">
                                    <i class="bi bi-eye b5-icon-et-dlt"></i>
                                </a>
                            </div>                           
                        </td>
                         <td><label>${item.PaymentMode}</label>   </td> 
                         <td><label>${item.PaymentUpdatedDate}</label>   </td> 
                        <td>
                            <a class="btnEdit" style="display:none" onclick="editRow(this)">
                                <i class="bi bi-pencil-square b5-icon-et-dlt" data-bs-toggle="tooltip" title="Edit"></i>
                            </a>
                            <a class="btnDelete" onclick="deleteRow(this)">
                                <i class="bi bi-trash b5-icon-et-dlt" data-bs-toggle="tooltip" title="Delete"></i>
                            </a>
                        </td>`;
                                fragment.appendChild(row);
                            });
                            repeaterBody.appendChild(fragment);
                            const tableContainer = document.querySelector('#tbltransactionList').closest('div');
                            if (tableContainer) {
                                tableContainer.style.display = data.length > 0 ? 'inline-block' : 'none';
                            }
                        } else {
                            lblerrmsg.innerText = "No data found.";
                        }
                    },
                    error: function () {
                        lblerrmsg.innerText = "Error loading data!";
                    }
                });
            }


            function formatDate(dateString) {
                if (!dateString) return "";
                const date = new Date(dateString);
                const day = String(date.getDate()).padStart(2, '0');
                const month = String(date.getMonth() + 1).padStart(2, '0');
                const year = date.getFullYear();
                return `${day} - ${month} - ${year}`;
            }

            if (typeof Sys !== "undefined" && Sys.WebForms && Sys.WebForms.PageRequestManager) {
                const prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_endRequest(function () {
                    attachSweetAlert();
                });
            }

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
                                cancelButton: 'handle-btn-success'
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
</asp:Content>



