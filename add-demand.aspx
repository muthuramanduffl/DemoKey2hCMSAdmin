﻿<%@ Page Title="" Language="C#" MasterPageFile="AdminKey2h.master" AutoEventWireup="true" CodeFile="add-demand.aspx.cs" Inherits="adminkey2hcom_AddDemand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content">
        <div class="panel-header bg-primary-gradient">
            <div class="page-inner py-5">
                <div class="d-flex pb-2 align-items-left align-items-sm-center flex-column flex-sm-row justify-content-between">
                    <div class="d-flex">
                        <h2 class="text-white mb-0 fw-bold text-uppercase">
                            <asp:Label ID="lblDisplayText" runat="server" Text=""></asp:Label>
                            <!-- <asp:Label ID="lblError" runat="server" Text=""></asp:Label> -->
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
                                        <h3>Demand Details</h3>
                                    </div>
                                    <div class="row mx-0 margin-top20 mb-4">
                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Project Name <span class="text-danger">*</span></label>
                                                        <i class="bi bi-journal-bookmark-fill b5-icon"></i>
                                                        <asp:DropDownList ID="ddlProName" AutoPostBack="true" OnSelectedIndexChanged="ddlProName_SelectedIndexChanged" class="bs-select form-control input-sm" runat="server">
                                                            <asp:ListItem Value="U49">U49</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <span class="error">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" Display="Dynamic" runat="server" ValidationGroup="val"
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
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" Display="Dynamic" runat="server" ValidationGroup="val"
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
                                                        <asp:DropDownList ID="ddlFlatNumber" ClientIDMode="Static" AutoPostBack="true" OnSelectedIndexChanged="ddlFlatNumber_SelectedIndexChanged" class="bs-select form-control input-sm" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                    <span class="error">
                                                        <asp:RequiredFieldValidator ClientIDMode="Static" EnableClientScript="true" SetFocusOnError="true" ControlToValidate="ddlFlatNumber" Display="Dynamic" ValidationGroup="val" ID="RequiredFieldValidator23" runat="server" ErrorMessage="Select flat no. "></asp:RequiredFieldValidator>
                                                    </span>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Customer Name </label>
                                                        <i class="bi bi-person-square b5-icon"></i>
                                                        <asp:TextBox runat="server" ID="txtCustomerName" class="form-control input-sm" disabled="true" autocomplete="off" placeholder=""></asp:TextBox>
                                                    </div>
                                                    <span class="error">
                                                        <asp:Label ID="lbldoesnotexist" runat="server" Text="" Display="Dynamic"></asp:Label>
                                                        <asp:LinkButton ID="linkbtnGoPS" runat="server" Style="display: none" OnClick="linkbtnGoPS_Click">                                                         
                                                            Click here
                                                        </asp:LinkButton>
                                                    </span>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="form-group">
                                        <div class="form-border margin-top20" id="divDemandStages" clientidmode="Static" runat="server">
                                            <div class="form-title">
                                                <h3>Demand Stages</h3>
                                            </div>
                                            <div class="row mx-0 margin-top20 mb-4">
                                                <div class="col-sm-4 col-xl-4 pt-3">
                                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                        <ContentTemplate>
                                                            <div class="input-icon input-icon-sm right">
                                                                <label>Payment Stages <span class="text-danger">*</span></label>
                                                                <i class="bi bi-journal-text b5-icon"></i>
                                                                <asp:DropDownList ID="ddlPaymentStages" ClientIDMode="Static" AutoPostBack="true" OnSelectedIndexChanged="ddlPaymentStages_SelectedIndexChanged" class="bs-select form-control input-sm" runat="server">
                                                                    <asp:ListItem> </asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <span class="error">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" Display="Dynamic" runat="server" ValidationGroup="val"
                                                                    ControlToValidate="ddlPaymentStages" InitialValue="" ErrorMessage="Select payment stages">
                                                                </asp:RequiredFieldValidator>
                                                                <asp:Label ID="lblprojectValidationMessage" ClientIDMode="Static" Display="Dynamic" class="align-items-center text-center" runat="server" Text=""></asp:Label>
                                                            </span>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                            <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                            <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                                            <asp:AsyncPostBackTrigger ControlID="ddlPaymentStages" EventName="SelectedIndexChanged" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>

                                                <div class="col-sm-4 col-xl-4 pt-3">
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Upload <span class="text-danger">*</span></label>
                                                        <i class="bi bi-file-earmark-zip b5-icon"></i>
                                                        <asp:FileUpload ID="flDemandUpload" ClientIDMode="Static" accept=".pdf"
                                                            class="form-control input-sm FluploadPDF" runat="server" />
                                                        <span class="handle-file-request">(PDF file only, max size of 1500 KB)</span>
                                                    </div>

                                                    <asp:HiddenField ID="hdndemandUpload" runat="server" />

                                                    <span class="error">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="val"
                                                            ControlToValidate="flDemandUpload" InitialValue="" ErrorMessage="Upload PDF"> 
                                                        </asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblflDemandUpload" ClientIDMode="Static" CssClass="lblflDemandUpload" runat="server" ForeColor="#d41111" Text="" Display="Dynamic"></asp:Label>
                                                    </span>

                                                    <div class="view-demand-upload-img view-demand-upload btn-view-pop mt-3 ViewFluploadPDF btn-view"
                                                        id="viewproscreenbtn" style="display: none">
                                                        <i class="bi bi-eye">View PDF</i>
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="card-footer mx-2 pb-4">
                                                <div class="d-flex justify-content-center">
                                                    <asp:LinkButton ID="btnAdd" OnClientClick="if (validatePage1()) { this.value='Please wait..'; this.style.display='none'; document.getElementById('bWait1').style.display = ''; } else { return false; }" OnClick="btnAdd_Click" runat="server" class="btn btn-sm me-1 handle-btn-success add-btn">
                                                        Submit
                                                    </asp:LinkButton>
                                                    <button type="button" style="display: none" id="bWait1" class="btn btn-secondary btn-sm me-1">Please Wait</button>
                                                    <div class="btn btn-sm handle-btn-danger swtAltCancel-Refresh">Cancel</div>
                                                    <asp:Button ID="btnCancel" ClientIDMode="Static" runat="server" Text="Cancel Project" OnClick="btnCancel_Click" Style="display: none;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlPaymentStages" EventName="SelectedIndexChanged" />
                                    <asp:PostBackTrigger ControlID="btnAdd" />
                                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="form-group" id="divDemandList" clientidmode="Static" runat="server">
                                <div class="form-border margin-top20">
                                    <div class="form-title">
                                        <h3>View Demand List</h3>
                                    </div>
                                    <div class="table-responsive pt-4 mt-md-2 mt-0 px-4">
                                        <asp:UpdatePanel ID="UpdatePanel7" runat="server" OnItemCommand="Repeater1_ItemCommand" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Repeater ID="rptDemandList" runat="server">
                                                    <HeaderTemplate>
                                                        <table class="table table-bordered" id="tblDemandList">
                                                            <thead>
                                                                <tr>
                                                                    <th class="w-sno">#</th>
                                                                    <th>Payment Stages</th>
                                                                    <th>View PDF</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr id="row<%# Container.ItemIndex %>">
                                                            <asp:HiddenField ID="HiddenField1" ClientIDMode="Static" Value='<%# Eval("DemandID") %>' runat="server" />
                                                            <td><%# Container.ItemIndex + 1 %></td>
                                                            <td><%#BindDemandPaymentLabelName(Convert.ToInt32(Eval("PaymentLabelID"))) %></td>
                                                            <td>
                                                                <asp:HiddenField ID="hdnid" ClientIDMode="Static" Value='<%# Eval("DemandID") %>' runat="server" />
                                                                <asp:HiddenField ID="HiddenFieldPDF" Value='<%# Eval("PDFName") %>' runat="server" />
                                                                <input type="hidden" class="hdnid" value='<%# Eval("DemandID") %>' />
                                                                <div class="view-pdf btn-view" id="viewPdf<%# Container.ItemIndex %>">
                                                                    <a target="_blank" href='<%# "/DemandPDF/"+Eval("PDFName") %>' class="btn-view btnview-pdf" data-bs-toggle="tooltip" title="View">
                                                                        <i class="bi bi-eye b5-icon-et-dlt"></i>
                                                                    </a>
                                                                </div>
                                                                <div class="upload-pdf" id="upload<%# Container.ItemIndex %>" style="display: none;">
                                                                    <asp:FileUpload ID="uploadThumbnailImg" ClientIDMode="Static" accept=".pdf" class="form-control input-sm file-upload upload-file-input" autocomplete="off" placeholder="" runat="server" />
                                                                    <asp:Label ID="lblFluploadPan" ForeColor="#d41111" ClientIDMode="Static" CssClass="lblFluploadPan error-label" runat="server" Text="">
                                                                    </asp:Label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <a class="me-3 btnEdit" onclick="editRow(this)" style="display:none">
                                                                    <i class="bi bi-pencil-square b5-icon-et-dlt" data-bs-toggle="tooltip" aria-label="Edit" data-bs-original-title="Edit"></i>
                                                                </a>
                                                                <asp:LinkButton ID="LinkButton1" OnClientClick="updateRow(this)" CssClass="btnUpdate me-3 " CommandArgument='<%# Eval("DemandID") %>' OnCommand="LinkButton1_Click" runat="server" Style="display: none">
                                                                    <i class="bi bi-save b5-icon-et-dlt" data-bs-toggle="tooltip" title="Update"></i>
                                                                </asp:LinkButton>
                                                                <a href="javascript:void(0);" class="btnCancel me-3 " onclick="cancelEdit(this)" style="display: none;"><i class="bi bi-x-circle b5-icon-et-dlt" data-bs-toggle="tooltip" title="Cancel"></i></a>
                                                                <a href="javascript:void(0);" class="btnDelete " onclick="deleteRow(this)"><i class="bi bi-trash b5-icon-et-dlt" data-bs-toggle="tooltip" title="Delete"></i></a>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                 </table>
           
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="ddlBlockNumber" EventName="SelectedIndexChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="ddlFlatNumber" EventName="SelectedIndexChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="ddlPaymentStages" EventName="SelectedIndexChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="click" />
                                                <asp:PostBackTrigger ControlID="btnAdd" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer" style="display: none !important">
                            <div class="d-flex justify-content-center">
                                <asp:Button
                                    ID="btnSave" ClientIDMode="Static"
                                    runat="server"
                                    Text="Submit" ValidationGroup="projval"
                                    class="btn btn-sm handle-btn-success me-1 swtAltSubmit btnSave"
                                    OnClientClick="if (validatePage()) { this.value='Please wait..'; this.style.display='none'; document.getElementById('bWait').style.display = ''; } else { return false; }" Style="min-width: 67px;" />
                                <button type="button" style="display: none" id="bWait" class="btn btn-secondary btn-sm me-1"><i class='fa fa-spinner fa-spin'></i>Please wait</button>
                                <div class="btn btn-sm handle-btn-danger swtAltCancel">Cancel</div>
                                <asp:Button ID="btnCancel1" runat="server" Text="Cancel Project" OnClick="btnCancel_Click" Style="display: none;" />
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

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script type="text/javascript">
        function validatePage() {
            var flag = Page_ClientValidate('projval')
            return flag;
        }
    </script>

    <script type="text/javascript">
        function validatePage1() {
            var flag = Page_ClientValidate('val')
            return flag;
        }
    </script>


    <%--
    <script>
        function validatePDFUpload(fileInput) {
            var files = fileInput.files;
            var allowedFiles = [".pdf"]; // Only allow PDF files

            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                var ext = file.name.split('.').pop().toLowerCase();

                if (allowedFiles.includes("." + ext)) {
                    var size = parseFloat(file.size / 1024).toFixed(2); // Size in KB
                    if (size > 1024) { // Check if the file size exceeds 1 MB (1024 KB)
                        alert("File size is too high, please select a PDF smaller than 1 MB.");
                        fileInput.value = ''; // Clear the file input
                    } else {
                        
                    }
                } else {
                    alert("Please select a PDF file only.");
                    fileInput.value = ''; // Clear the file input to prevent further processing
                }
            }
        }

      
    </script>--%>




    <script>
        document.addEventListener('DOMContentLoaded', function () {
            function initFileUpload() {
                const fileUploader = document.getElementById('<%= flDemandUpload.ClientID %>');
                const viewPDFBtn = document.querySelector('.ViewFluploadPDF');
                const fileSizeErrorLabel = document.getElementById('<%= lblflDemandUpload.ClientID %>');

                const maxPDFFileSize = 1024 * 1024; // 1MB for PDF
                const allowedPDFExtensions = [".pdf"];
                let pdfFile = null;

                if (!fileUploader || !viewPDFBtn || !fileSizeErrorLabel) {
                    console.error("Required elements not found in the DOM.");
                    return;
                }

                // File Upload Event
                fileUploader.addEventListener('change', function (event) {
                    if (event.target.files.length === 0) {
                        fileSizeErrorLabel.textContent = 'No file selected!';
                        return;
                    }
                    handleFileUpload(event, allowedPDFExtensions, maxPDFFileSize, viewPDFBtn, "Please select a valid PDF file.");
                });

                // Function to handle File Upload
                function handleFileUpload(event, allowedExtensions, maxFileSize, viewBtn, errorMessage) {
                    const file = event.target.files[0];
                    fileSizeErrorLabel.textContent = '';
                    viewBtn.style.display = 'none';

                    if (!file) return;

                    const fileExtension = `.${file.name.split('.').pop().toLowerCase()}`;

                    if (!allowedExtensions.includes(fileExtension)) {
                        fileSizeErrorLabel.textContent = errorMessage;
                        event.target.value = ''; // Reset file input
                        return;
                    }

                    if (file.size > maxFileSize) {
                        fileSizeErrorLabel.textContent = `File size must be under ${maxFileSize / 1024} KB`;
                        event.target.value = ''; // Reset file input
                        return;
                    }

                    pdfFile = file;
                    viewBtn.style.display = 'inline-block';
                }

                // View Button Click Event for PDF
                viewPDFBtn.addEventListener('click', function () {
                    if (!pdfFile) return;

                    const pdfBlob = new Blob([pdfFile], { type: "application/pdf" });
                    const pdfURL = URL.createObjectURL(pdfBlob);
                    window.open(pdfURL, "_blank");
                });
            }

            // Initialize on page load
            initFileUpload();

            // Reinitialize after every partial postback inside UpdatePanel
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                initFileUpload();
            });
        });
    </script>




    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            var fileUploaders = document.querySelectorAll('.file-upload');
            var viewLogoBtns = document.querySelectorAll('.btnview-pdf');
            var errorLabels = document.querySelectorAll('.error-label');
            var screensrc = {};
            var fileType = {};

            if (!fileUploaders || !viewLogoBtns || !errorLabels) {
                console.error("Required elements not found in the DOM.");
                return;
            }
            fileUploaders.forEach(function (fileUploader, index) {

                fileUploader.addEventListener('change', function (event) {
                    var input = event.target;
                    var file = input.files[0];
                    var validFileType = 'application/pdf';
                    var viewLogoBtn = viewLogoBtns[index];
                    var errorLabel = errorLabels[index];
                    fileType[index] = file ? file.type : null;
                    errorLabel.textContent = '';
                    if (!file) {
                        resetUploader(viewLogoBtn, errorLabel, index);
                        errorLabel.textContent = "No file selected.";
                        return;
                    }
                    if (file.type !== validFileType) {
                        resetUploader(viewLogoBtn, errorLabel, index);
                        errorLabel.textContent = "Invalid file type. Only PDF files are allowed.";
                        return;
                    }
                    if (file.size > 1500 * 1024) {
                        resetUploader(viewLogoBtn, errorLabel, index);
                        errorLabel.textContent = "PDF size must be less than 1500 KB";
                        return;
                    }
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        screensrc[index] = e.target.result;
                        viewLogoBtn.style.display = 'inline-block';
                        viewLogoBtn.src = 'path/to/pdf-icon.png';
                    };
                    reader.onerror = function (err) {
                        console.error("Error reading file:", err);
                        screensrc[index] = null;
                    };
                    reader.readAsDataURL(file);
                });

                fileUploader.addEventListener('click', function () {
                    var errorLabel = errorLabels[index];
                    resetUploader(viewLogoBtns[index], errorLabel, index);
                });

                viewLogoBtns[index].addEventListener('click', function () {
                    if (!screensrc[index]) {
                        var errorLabel = errorLabels[index];
                        errorLabel.textContent = "No file uploaded yet!";
                        resetUploader(viewLogoBtns[index], errorLabel, index);
                        return;
                    }
                    if (fileType[index] === 'application/pdf') {
                        var newWindow = window.open('', '_blank');
                        if (newWindow) {
                            newWindow.document.write(`
                            <html>
                                <head><title>PDF Preview</title></head>
                                <body style="margin: 0;">
                                    <embed src="${screensrc[index]}" width="100%" height="100%">
                                </body>
                            </html>
                        `);
                            newWindow.document.close();
                        }
                        else {
                            alert('Popup blocked! Please allow popups for this website.');
                        }
                    }
                });
            });

            function resetUploader(viewLogoBtn, errorLabel, index) {
                screensrc[index] = null;
                document.querySelectorAll('.file-upload')[index].value = '';
                viewLogoBtn.src = '';
                viewLogoBtn.style.display = 'inline-block';
                errorLabel.textContent = '';
            }
        });
    </script>

    <script type="text/javascript">
        function editRow(btn) {
            const row = btn.closest('tr');
            row.querySelector('.btnEdit').style.display = 'none';
            row.querySelector('.view-pdf').style.display = 'none';
            row.querySelector('.btnUpdate').style.display = 'inline';
            row.querySelector('.btnCancel').style.display = 'inline';
            row.querySelector('.upload-pdf').style.display = 'inline';
        }

        function cancelEdit(btn) {
            const row = btn.closest('tr');
            row.querySelector('.view-pdf').style.display = 'inline';
            row.querySelector('.btnEdit').style.display = 'inline';
            row.querySelector('.btnUpdate').style.display = 'none';
            row.querySelector('.btnCancel').style.display = 'none';
            row.querySelector('.upload-pdf').style.display = 'none';
            const errorLabel = row.querySelector('.error-label');
            if (errorLabel) {
                errorLabel.textContent = '';
            }
        }

        function updateRow(btn) {
            //Swal.fire({
            //    title: 'Demand details updated successfully',
            //    showCancelButton: true,
            //    confirmButtonText: 'Yes',
            //    customClass: {
            //        confirmButton: 'handle-btn-success',
            //    }
            //});
            const row = btn.closest('tr');
            row.querySelector('.view-pdf').style.display = 'inline';
            row.querySelector('.btnEdit').style.display = 'inline';
            row.querySelector('.btnUpdate').style.display = 'none';
            row.querySelector('.btnCancel').style.display = 'none';
            row.querySelector('.upload-pdf').style.display = 'none';
        }

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
                    if (!row) {
                        alert('Button is not inside a <tr> element!');
                        return;
                    }
                    const hiddenFieldDemandID = row.querySelector('#hdnid');
                    const demandID = hiddenFieldDemandID ? hiddenFieldDemandID.value : '';
                    const ddlFlat = document.getElementById('<%= ddlFlatNumber.ClientID %>');
                    var Selected = ddlFlat.value;
                    if (!demandID) {
                        alert('Missing necessary data (DemandID)!');
                        return;
                    }
                    if (!Selected) {
                        alert('Missing flat number!');
                        return;
                    }
                    $.ajax({
                        type: 'POST',
                        url: 'add-demand.aspx/DeleteDemand',
                        data: JSON.stringify({ demandID: demandID }),
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (response) {
                            console.log('Success callback triggered');
                            row.remove();
                            loadRepeaterData(Selected);
                            const table = document.getElementById('tblCustomers');
                            if (table) {
                                const rows = table.querySelectorAll('tbody tr');
                                if (rows.length === 0) {
                                    const repeaterContainer = document.getElementById('<%= divDemandList.ClientID %>').closest('div');
                                    if (repeaterContainer) {
                                        repeaterContainer.style.display = 'none';
                                    }
                                }
                            } else {
                                console.error('Table with ID tblCustomers not found.');
                            }
                            //Swal.fire({
                            //    title: 'Demand details have been deleted as requested', confirmButtonText: 'Ok',
                            //    customClass: {
                            //        confirmButton: 'handle-btn-success'
                            //    },
                            //});
                            //console.log('Swal fired');
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.error('AJAX Error:', textStatus, errorThrown);
                            alert('Error deleting row!');
                        }
                    });
                } else {
                    return;
                }
            });
        }

        function checkRowCountAndToggleDisplay() {
            var dropflatname = document.getElementById('<%= ddlFlatNumber.ClientID %>');
            if (!dropflatname) {
                alert('Dropdown not found!');
                return;
            }
            const ddlblock = document.getElementById('<%= ddlBlockNumber.ClientID %>');
            const ddlproject = document.getElementById('<%= ddlProName.ClientID %>');
            const repeaterContainer = document.getElementById('<%= divDemandList.ClientID %>').closest('div');
            var selectedValue = dropflatname.value;
            if (!selectedValue) {
                repeaterContainer.style.display = 'none';
                return;
            }
            $.ajax({
                type: 'POST',
                url: 'add-demand.aspx/GetRowCount',
                data: JSON.stringify({ selectedValue: selectedValue, ddlproject: ddlproject.value, ddlblock: ddlblock.value }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (response) {
                    const rowCount = response.d;
                    const repeaterContainer = document.getElementById('<%= divDemandList.ClientID %>').closest('div');
                    if (rowCount === 0) {

                        if (repeaterContainer) {
                            repeaterContainer.style.display = 'none';
                        }
                    } else {
                        if (repeaterContainer) {
                            repeaterContainer.style.display = 'block';
                        }
                    }
                },
                error: function () {
                    alert('Error retrieving row count!');
                }
            });
        }

        document.addEventListener('DOMContentLoaded', function () {
            checkRowCountAndToggleDisplay();
        });

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            checkRowCountAndToggleDisplay();
        });

    </script>

    <script type="text/javascript">
        function loadRepeaterData(selectedValue) {
            $.ajax({
                type: 'POST',
                url: 'add-demand.aspx/GetCostDetails',
                data: JSON.stringify({ selectedValue: selectedValue }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (response) {
                    if (response && response.d) {
                        const data = response.d;
                        const repeaterBody = document.querySelector('#tblDemandList tbody');
                        repeaterBody.innerHTML = '';
                        data.forEach(function (item, index) {
                            const row = document.createElement('tr');
                            row.innerHTML = `
                            <td>${index + 1}</td>
                            <td>${item.PaymentLabelID}</td>  
                            <asp:HiddenField ID="hdnid" ClientIDMode="Static" Value="${item.DemandID}" runat="server" />
                            <td>                                                         
                                <asp:HiddenField ID="HiddenFieldPDF" Value="${item.PDFName}" runat="server" />
                                <input type="hidden" class="hdnID" value="${item.DemandID}" />
                                <div class="view-pdf btn-view" id="viewPdf${index}">
                                    <a target="_blank" href="/DemandPDF/${item.PDFName}" class="btn btn-view btnview-pdf" data-bs-toggle="tooltip" title="View">
                                        <i class="bi bi-eye b5-icon-et-dlt"></i>
                                    </a>
                                </div>
                                <div class="upload-pdf" id="upload${index}" style="display: none;">
                                    <input type="file" class="form-control input-sm file-upload upload-file-input" accept=".pdf" />
                                    <label class="lblFluploadPan error-label"></label>
                                </div>
                            </td>
                            <td>
                                <a class="me-3 btnEdit" onclick="editRow(this)">
                                    <i class="bi bi-pencil-square b5-icon-et-dlt" data-bs-toggle="tooltip" aria-label="Edit" data-bs-original-title="Edit"></i>
                                </a>
                                <a href="javascript:void(0);" class="btnCancel" onclick="cancelEdit(this)" style="display: none;">
                                    <i class="bi bi-x-circle b5-icon-et-dlt" data-bs-toggle="tooltip" title="Cancel"></i>
                                </a>
                                <a class="swtAltCancel" onclick="deleteRow(this)">
                                    <i class="bi bi-trash b5-icon-et-dlt" data-bs-toggle="tooltip" aria-label="Delete" data-bs-original-title="Delete"></i>
                                </a>
                            </td>
                        `;
                            repeaterBody.appendChild(row);
                        });

                        const repeaterContainer = document.getElementById('<%= divDemandList.ClientID %>').closest('div');
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
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            attachSweetAlert();
        });

        document.addEventListener('DOMContentLoaded', function () {
            attachSweetAlert();
        });

        function attachSweetAlert() {
            const cancelButton = document.querySelector('.swtAltCancel-Refresh');
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

</asp:Content>

