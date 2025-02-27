<%@ Page Title="" Language="C#" MasterPageFile="AdminKey2h.master" AutoEventWireup="true" CodeFile="add-project-home-screen.aspx.cs" Inherits="addprojecthomescreen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Popup styling */
        .sweet-popup-style {
            max-width: 90%;
            max-height: 80vh;
            height: auto;
            overflow: auto;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            position: relative;
        }

        /* Image container */
        .image-container {
            text-align: center;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            position: relative;
            overflow: hidden;
            height: 90vh;
            display: flex;
            justify-content: center; /* Center the image horizontally */
            align-items: center; /* Center the image vertically */
        }

        /* Image styling */
        .image-preview {
            max-width: 100%;
            max-height: 90vh; /* Restrict height to 70% of viewport */
            object-fit: contain;
            transition: transform 0.3s ease;
            position: absolute; /* Absolute position to allow dragging */
            cursor: grab; /* Cursor style when hovering over the image */
            top: 50%; /* Position image vertically at 50% */
            left: 50%; /* Position image horizontally at 50% */
            transform: translate(-50%, -50%); /* Center the image */
            transform-origin: center center; /* Ensure zoom happens from the center */
        }

        /* Zoom controls */
        .zoom-controls {
            margin-top: 10px;
            display: flex;
            justify-content: center;
            gap: 10px; /* Space between buttons */
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 10; /* Ensure buttons are always on top */
        }

        /* Zoom buttons */
        .zoom-btn {
            padding: 10px 15px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            background-color: #d3d3d3; /* Light gray */
            color: #000; /* White text */
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            .zoom-btn:hover {
                background-color: #b1b1b1; /* Darker gray */
            }

        /* Reset image drag position after zoom */
        .image-preview {
            transition: transform 0.3s ease, left 0.3s ease, top 0.3s ease;
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
                            <asp:Label ID="lbldisplaymsg" runat="server" Text=""></asp:Label>
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
                                        <h3>Floor Plan Details</h3>
                                    </div>
                                    <div class="row mx-0 margin-top20 mb-4">

                                        <div class="col-sm-4 col-xl-3 pt-3">
                                            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>--%>
                                                    <div class="input-icon input-icon-sm right">
                                                        <label>Project Name <span class="text-danger">*</span></label>
                                                        <i class="bi bi-journal-bookmark-fill b5-icon"></i>
                                                        <asp:DropDownList ID="ddlProName" AutoPostBack="true" OnSelectedIndexChanged="ddlProName_SelectedIndexChanged" class="bs-select form-control input-sm" runat="server">
                                                            <asp:ListItem Value=""> </asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                <%--</ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>--%>
                                            <span class="error">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="projval"
                                                    ControlToValidate="ddlProName" InitialValue="" ErrorMessage="Select project name">
                                                </asp:RequiredFieldValidator>
                                            </span>
                                        </div>


                                        <div class="col-sm-4 col-xl-3 pt-4">
                                            <div class="input-icon input-icon-sm right">
                                                <label>Highlight Image 1</label>
                                                <i class="bi bi-images b5-icon"></i>
                                                <asp:FileUpload ID="fluploadhighlight1" ClientIDMode="Static" runat="server" CssClass="form-control input-sm file-upload valhiglights" accept=".jpeg, .jpg, .png" />
                                                <span class="handle-file-request">(upload max file size,only Image-1500 KB)</span>
                                                <%-- <asp:HiddenField ID="hdnfluploadhighlight1" runat="server" />--%>
                                                <input type="hidden" id="hdnfluploadhighlight1" clientidmode="Static" runat="server" class="hdnvalhiglights ermovehdnvalhiglights" value="">
                                            </div>
                                            <span class="error">
                                                <asp:Label ID="lblfluploadhighlight1" CssClass="lblFileUpload" runat="server" ForeColor="#d41111" Text=""></asp:Label>
                                            </span>
                                            <div class="btn-view btn-view-pop" clientidmode="Static" id="Divhighlight1" style="display: none">
                                                <i class="bi bi-eye"></i>View 
                                            </div>
                                            <div class="btn-view-pop btn-remove" style="display: none;">
                                                <i class="bi bi-x"></i>Remove 
                                            </div>
                                        </div>

                                        <div class="col-sm-4 col-xl-3 pt-4">
                                            <div class="input-icon input-icon-sm right">
                                                <label>Highlight Image 2</label>
                                                <i class="bi bi-images b5-icon"></i>
                                                <asp:FileUpload ID="fluploadhighlight2" ClientIDMode="Static" runat="server" CssClass="form-control input-sm file-upload valhiglights" accept=".jpeg, .jpg, .png" />
                                                <span class="handle-file-request">(upload max file size,only Image -1500 KB)</span>
                                                <%--<asp:HiddenField ID="hdnfluploadhighlight2"  runat="server" />--%>
                                                <input type="hidden" id="hdnfluploadhighlight2" clientidmode="Static" runat="server" class="hdnvalhiglights ermovehdnvalhiglights" value="">
                                            </div>
                                            <span class="error">
                                                <asp:Label ID="lblfluploadhighlight2" CssClass="lblFileUpload" runat="server" ForeColor="#d41111" Text=""></asp:Label>
                                            </span>
                                            <div class="btn-view btn-view-pop" clientidmode="Static" runat="server" id="DivSaleDeedFinal" style="display: none">
                                                <i class="bi bi-eye"></i>View 
                                            </div>
                                            <div class="btn-view-pop btn-remove" style="display: none;">
                                                <i class="bi bi-x"></i>Remove 
                                            </div>
                                        </div>

                                        <div class="col-sm-4 col-xl-3 pt-4">
                                            <div class="input-icon input-icon-sm right">
                                                <label>Highlight Image 3</label>
                                                <i class="bi bi-images b5-icon"></i>
                                                <asp:FileUpload ID="fluploadhighlight3" ClientIDMode="Static" runat="server" CssClass="form-control input-sm file-upload valhiglights" accept=".jpeg, .jpg, .png" />
                                                <span class="handle-file-request">(upload max file size,pdf-1500 KB)</span>
                                                <%--<asp:HiddenField ID="hdnfluploadhighlight3" class="valhiglights" runat="server" />--%>
                                                <input type="hidden" id="hdnfluploadhighlight3" clientidmode="Static" runat="server" class="hdnvalhiglights ermovehdnvalhiglights" value="">
                                            </div>
                                            <span class="error">
                                                <asp:Label ID="lblfluploadhighlight3" CssClass="lblFileUpload" runat="server" ForeColor="#d41111" Text=""></asp:Label>
                                            </span>
                                            <div class="btn-view btn-view-pop" clientidmode="Static" runat="server" id="DivSaleAgreementDraft" style="display: none">
                                                <i class="bi bi-eye"></i>View 
                                            </div>
                                            <div class="btn-view-pop btn-remove" style="display: none;">
                                                <i class="bi bi-x"></i>Remove 
                                            </div>
                                        </div>

                                        <div class="col-sm-4 col-xl-3 pt-4">
                                            <div class="input-icon input-icon-sm right">
                                                <label>Highlight Image 4</label>
                                                <i class="bi bi-images b5-icon"></i>
                                                <asp:FileUpload ID="fluploadhighlight4" ClientIDMode="Static" runat="server" CssClass="form-control input-sm file-upload valhiglights" accept=".jpeg, .jpg, .png" />
                                                <span class="handle-file-request">(upload max file size,pdf-1500 KB)</span>
                                                <%--                                                <asp:HiddenField ID="hdnfluploadhighlight4" class="valhiglights" runat="server" />--%>
                                                <input type="hidden" id="hdnfluploadhighlight4" clientidmode="Static" runat="server" class="hdnvalhiglights ermovehdnvalhiglights" value="">
                                            </div>
                                            <span class="error">
                                                <asp:Label ID="lblfluploadhighlight4" CssClass="lblFileUpload" runat="server" ForeColor="#d41111" Text=""></asp:Label>
                                            </span>
                                            <div class="btn-view btn-view-pop" clientidmode="Static" runat="server" id="DivSaleAgreementFinal" style="display: none">
                                                <i class="bi bi-eye"></i>View 
                                            </div>
                                            <div class="btn-view-pop btn-remove" style="display: none;">
                                                <i class="bi bi-x"></i>Remove 
                                            </div>
                                        </div>

                                        <div class="col-sm-4 col-xl-3 pt-4">
                                            <div class="input-icon input-icon-sm right">
                                                <label>Highlight Image 5</label>
                                                <i class="bi bi-images b5-icon"></i>
                                                <asp:FileUpload ID="fluploadhighlight5" ClientIDMode="Static" runat="server" CssClass="form-control input-sm file-upload valhiglights" accept=".jpeg, .jpg, .png" />
                                                <span class="handle-file-request">(upload max file size,pdf-1500 KB)</span>
                                                <%--                                                <asp:HiddenField ID="hdnfluploadhighlight5" class="valhiglights" runat="server" />--%>
                                                <input type="hidden" id="hdnfluploadhighlight5" clientidmode="Static" runat="server" class="hdnvalhiglights ermovehdnvalhiglights" value="">
                                            </div>
                                            <span class="error">
                                                <asp:Label ID="lblfluploadhighlight5" CssClass="lblFileUpload" runat="server" ForeColor="#d41111" Text=""></asp:Label>
                                            </span>
                                            <div class="btn-view btn-view-pop" clientidmode="Static" runat="server" id="DivAllotmentLetter" style="display: none">
                                                <i class="bi bi-eye"></i>View 
                                            </div>
                                            <div class="btn-view-pop btn-remove" style="display: none;">
                                                <i class="bi bi-x"></i>Remove 
                                            </div>
                                        </div>


                                        <div class="col-sm-4 col-xl-3 pt-4">
                                            <div class="input-icon input-icon-sm right">
                                                <label>Splace Screen</label>
                                                <i class="bi bi-images b5-icon"></i>
                                                <asp:FileUpload ID="uploadflashscreen" ClientIDMode="Static" runat="server" CssClass="form-control input-sm file-upload" accept=".jpeg, .jpg, .png" />
                                                <span class="handle-file-request">(upload max file size,only Image -1500 KB)</span>
                                                <%--  <asp:HiddenField ID="hdnsplacescreen" runat="server" />--%>
                                                <input type="hidden" id="hdnsplacescreen" clientidmode="Static" runat="server" class="ermovehdnvalhiglights" value="">
                                            </div>
                                            <span class="error">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ClientIDMode="Static" ControlToValidate="uploadflashscreen" ValidationGroup="projval" runat="server" ErrorMessage="Upload flash Screen"></asp:RequiredFieldValidator>
                                                <asp:Label ID="lblsplacescreen" CssClass="lblFileUpload" runat="server" ForeColor="#d41111" Text=""></asp:Label>
                                            </span>
                                            <div class="btn-view btn-view-pop" clientidmode="Static" runat="server" id="Div1" style="display: none">
                                                <i class="bi bi-eye"></i>View 
                                            </div>
                                            <div class="btn-view-pop btn-remove" style="display: none;">
                                                <i class="bi bi-x">Remove</i>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-xl-3 pt-4">
                                            <div class="input-icon input-icon-sm right">
                                                <label>Logo</label>
                                                <i class="bi bi-images b5-icon"></i>
                                                <asp:FileUpload ID="UploadLOGO" ClientIDMode="Static" runat="server" CssClass="form-control input-sm file-upload" accept=".jpeg, .jpg, .png" />
                                                <span class="handle-file-request">(upload max file size,only Image -1500 KB)</span>
                                                <%--<asp:HiddenField ID="hdnUploadLOGO" runat="server" />--%>
                                                <input type="hidden" id="hdnUploadLOGO" clientidmode="Static" runat="server" class="ermovehdnvalhiglights" value="">
                                            </div>
                                            <span class="error">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="projval" ControlToValidate="UploadLOGO" runat="server" ErrorMessage="Upload logo"></asp:RequiredFieldValidator>
                                                <asp:Label ID="lblUploadLOGO" CssClass="lblFileUpload" runat="server" ForeColor="#d41111" Text=""></asp:Label>
                                            </span>
                                            <div class="btn-view btn-view-pop" clientidmode="Static" runat="server" id="div2" style="display: none">
                                                <i class="bi bi-eye"></i>View 
                                            </div>
                                            <div class="btn-view-pop btn-remove" style="display: none;">
                                                <i class="bi bi-x">Remove</i>
                                            </div>
                                        </div>


                                    </div>
                                   <%-- <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>--%>
                                            <div class="card-footer mx-2 pb-4">
                                                <div class="d-flex justify-content-center">
                                                    <asp:Button
                                                        ID="btnSave" ClientIDMode="Static"
                                                        runat="server" OnClick="btnSave_Click"
                                                        Text="Add" ValidationGroup="projval"
                                                        class="btn btn-sm handle-btn-success me-1 swtAltSubmit btnSave"
                                                        OnClientClick="if (validatePage()) { this.value='Please wait..'; this.style.display='none'; document.getElementById('bWait').style.display = ''; } else { return false; }" Style="min-width: 67px;" />
                                                    <button type="button" style="display: none" id="bWait" class="btn btn-secondary btn-sm me-1"><i class='fa fa-spinner fa-spin'></i>Please wait</button>
                                                    <div class="btn btn-sm handle-btn-danger swtAltCancel-Refresh">Cancel</div>
                                                    <asp:Button ID="btnCancel" ClientIDMode="Static" runat="server" Text="Cancel Project" OnClick="btnCancel_Click" Style="display: none;" />
                                                </div>
                                            </div>
                                      <%--  </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlProName" EventName="SelectedIndexChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
                                            <asp:PostBackTrigger ControlID="btnSave" />
                                        </Triggers>
                                    </asp:UpdatePanel>--%>
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


    <script type="text/javascript">
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

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            attachSweetAlert();
        });

        document.addEventListener('DOMContentLoaded', function () {
            attachSweetAlert();
        });

    </script>




    <script>
        function validatePage() {
            var flag = window.Page_ClientValidate('projval');
            var flag2 = false;

            var fileInputs = document.querySelectorAll(".valhiglights");
            var hdnvalhiglights = document.querySelectorAll(".hdnvalhiglights");
            var errorSpan = document.getElementById("fileError");

            var uploadflashscreen = document.getElementById('<%= uploadflashscreen.ClientID %>');
            var hdnsplacescreen = document.getElementById('<%= hdnsplacescreen.ClientID %>');
            var UploadLOGO = document.getElementById('<%= UploadLOGO.ClientID %>');
            var hdnUploadLOGO = document.getElementById('<%= hdnUploadLOGO.ClientID %>');

            var requireuploadflashscreen = document.getElementById('<%= RequiredFieldValidator2.ClientID %>');
            var requireUploadLOGo = document.getElementById('<%= RequiredFieldValidator3.ClientID %>');

            if (flag) {
                let isAnyFileUploaded = Array.from(fileInputs).some(input => input.files.length > 0);
                let isAnyHiddenFieldFilled = Array.from(hdnvalhiglights).some(input => input.value.trim() !== "");

                if (!isAnyFileUploaded && !isAnyHiddenFieldFilled) {
                    Swal.fire({
                        title: 'Please upload at least one highlight',
                        confirmButtonText: 'Ok',
                        customClass: {
                            confirmButton: 'handle-btn-success'
                        }
                    });

                    flag2= false; // Stop further execution
                }
                else {
                    flag2 = true;
                }
            }

            // Validate uploadflashscreen
            if (uploadflashscreen && hdnsplacescreen) {
                ValidatorEnable(requireuploadflashscreen, hdnsplacescreen.value === '' && (!uploadflashscreen.files || uploadflashscreen.files.length === 0));
            }

            // Validate UploadLOGO
            if (UploadLOGO && hdnUploadLOGO) {
                ValidatorEnable(requireUploadLOGo, hdnUploadLOGO.value === '' && (!UploadLOGO.files || UploadLOGO.files.length === 0));
            }

            flag = flag2;
           

            return flag;
        }
    </script>

    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            var fileUploaders = document.querySelectorAll('.file-upload');
            var viewLogoBtns = document.querySelectorAll('.btn-view');
            var errorLabels = document.querySelectorAll('.lblFileUpload');
            var removeBtns = document.querySelectorAll('.btn-remove');
            var screensrc = {};
            var fileType = {};
            var fileTitles = ['Highlights 1', 'Highlights 2', 'Highlights 3', 'Highlights 4', 'Highlights 6', 'Splace Screen', 'Logo'];

            if (!fileUploaders.length || !viewLogoBtns.length || !errorLabels.length || !removeBtns.length) {
                return;
            }

            fileUploaders.forEach(function (fileUploader, index) {
                fileUploader.addEventListener('change', function (event) {
                    var input = event.target;
                    var file = input.files[0];
                    var validFileTypes = ['image/jpeg', 'image/jpg', 'image/png']; // ✅ Allowed formats
                    var isValidFileType = validFileTypes.includes(file?.type);
                    var viewLogoBtn = viewLogoBtns[index];
                    var errorLabel = errorLabels[index];
                    var removeBtn = removeBtns[index];

                    fileType[index] = file?.type || null;
                    errorLabel.textContent = '';

                    if (!file) {
                        resetUploader(viewLogoBtn, errorLabel, removeBtn, index);
                        errorLabel.textContent = "No file selected.";
                        return;
                    }

                    if (!isValidFileType) {
                        resetUploader(viewLogoBtn, errorLabel, removeBtn, index);
                        errorLabel.textContent = "Invalid file type. Only JPEG, JPG, and PNG are allowed.";
                        return;
                    }

                    if (file.size > 1500 * 1024) {
                        resetUploader(viewLogoBtn, errorLabel, removeBtn, index);
                        errorLabel.textContent = "Image size must be under 1500 KB.";
                        return;
                    }

                    var reader = new FileReader();
                    reader.onload = function (e) {
                        screensrc[index] = e.target.result;
                        viewLogoBtn.style.display = 'inline-block';
                        removeBtn.style.display = 'inline-block';
                    };

                    reader.onerror = function (err) {
                        screensrc[index] = null;
                    };

                    reader.readAsDataURL(file);
                });

                removeBtns[index].addEventListener('click', function () {
                    var viewLogoBtn = viewLogoBtns[index];
                    var errorLabel = errorLabels[index];
                    var removeBtn = removeBtns[index];
                    resetUploader(viewLogoBtn, errorLabel, removeBtn, index);
                });

                viewLogoBtns[index].addEventListener('click', function () {
                    if (!screensrc[index]) {
                        var errorLabel = errorLabels[index];
                        errorLabel.textContent = "No file uploaded yet!";
                        resetUploader(viewLogoBtns[index], errorLabel, removeBtns[index], index);
                        return;
                    }


                    Swal.fire({
                        imageUrl: screensrc[index],
                        imageAlt: 'Uploaded Image Preview',
                        showConfirmButton: false,
                        showCloseButton: true
                    });
                });
            });

            function resetUploader(viewLogoBtn, errorLabel, removeBtn, index) {
                screensrc[index] = null;
                document.querySelectorAll('.file-upload')[index].value = '';
                viewLogoBtn.style.display = 'none';
                removeBtn.style.display = 'none';
                errorLabel.textContent = '';
            }
        });
    </script>




    <script type="text/javascript">
        window.screensrc = {};

        function bindImageToPreview(srclogo, index) {
            var viewLogoBtns = document.querySelectorAll('.btn-view');
            var removeBtns = document.querySelectorAll('.btn-remove');

            if (index !== -1 && viewLogoBtns[index]) {
                screensrc[index] = srclogo;
                viewLogoBtns[index].style.display = 'inline-block';
                removeBtns[index].style.display = 'inline-block';
                viewLogoBtns[index].src = srclogo;
            } else {
                console.error("View logo button not found or index is invalid.");
            }
        }

        document.addEventListener('DOMContentLoaded', function () {
            var fileUploaders = document.querySelectorAll('.file-upload');
            var viewLogoBtns = document.querySelectorAll('.btn-view');
            var removeBtns = document.querySelectorAll('.btn-remove');
            var errorLabels = document.querySelectorAll('.lblFileUpload');



            var fileType = {};
            var fileTitles = ['Highlights 1', 'Highlights 2', 'Highlights 3', 'Highlights 4', 'Highlights 6', 'Splace Screen', 'Logo'];

            if (!fileUploaders.length || !viewLogoBtns.length || !errorLabels.length || !removeBtns.length) {
                console.error("Required elements not found in the DOM.");
                return;
            }

            fileUploaders.forEach((fileUploader, index) => {
                if (!fileUploader || !viewLogoBtns[index] || !removeBtns[index] || !errorLabels[index]) {
                    console.error("Element at index " + index + " not found.");
                    return;
                }

                fileUploader.addEventListener('change', function (event) {
                    var input = event.target;
                    var file = input.files[0];
                    var validImageTypes = ['image/jpeg', 'image/png', 'image/jpg'];
                    var validFileTypes = validImageTypes.concat(['application/pdf']);
                    var isValidFileType = validFileTypes.includes(file.type);
                    var viewLogoBtn = viewLogoBtns[index];
                    var removeBtn = removeBtns[index];
                    var errorLabel = errorLabels[index];

                    fileType[index] = file.type;

                    errorLabel.textContent = '';

                    if (!file) {
                        resetUploader(viewLogoBtn, removeBtn, errorLabel, index);
                        errorLabel.textContent = "No file selected.";
                        return;
                    }

                    if (!isValidFileType) {
                        resetUploader(viewLogoBtn, removeBtn, errorLabel, index);
                        errorLabel.textContent = "Invalid file type. Only PDF, PNG, JPEG, and JPG files are allowed.";
                        return;
                    }

                    if (file.type === 'application/pdf' && file.size > 1500 * 1024) {
                        resetUploader(viewLogoBtn, removeBtn, errorLabel, index);
                        errorLabel.textContent = "PDF size must be under 1.5 MB";
                        return;
                    }

                    if (validImageTypes.includes(file.type) && file.size > 1500 * 1024) {
                        resetUploader(viewLogoBtn, removeBtn, errorLabel, index);
                        errorLabel.textContent = "Image size must be under 1.5 MB";
                        return;
                    }

                    var reader = new FileReader();
                    reader.onload = function (e) {
                        screensrc[index] = e.target.result;
                        viewLogoBtn.style.display = 'inline-block';
                        removeBtn.style.display = 'inline-block';
                        viewLogoBtn.src = validImageTypes.includes(file.type) ? screensrc[index] : '';
                    };

                    reader.onerror = function (err) {
                        console.error("Error reading file:", err);
                        screensrc[index] = null;
                    };

                    reader.readAsDataURL(file);
                });

                viewLogoBtns[index].addEventListener('click', function () {
                    if (!screensrc[index]) {
                        errorLabels[index].textContent = "No file uploaded yet!";
                        resetUploader(viewLogoBtns[index], removeBtns[index], errorLabels[index], index);
                        return;
                    }
                    var fileTitle = fileTitles[index];

                    if (fileType[index] === 'application/pdf') {
                        var newWindow = window.open();
                        newWindow.document.write(`<embed src="${screensrc[index]}" width="100%" height="100%">`);
                    } else {
                        Swal.fire({
                            html: `
                            <div style="position: relative;">
                                <div class="btn-close-icon" style="cursor: pointer; position: absolute; top: -15px; right: -25px;">&times;</div>
                                <h2 class="fw-bold">${fileTitle}</h2>
                                <img id="swalImage" src="${screensrc[index]}" alt="${fileTitle}" class="img-fluid mt-3">
                            </div>
                        `,
                            showConfirmButton: false,
                            didOpen: () => {
                                document.querySelector('.btn-close-icon').addEventListener('click', () => Swal.close());
                            }
                        }).then(() => {
                            viewLogoBtns[index].style.display = 'inline-block';
                            removeBtns[index].style.display = 'inline-block';
                        });
                    }
                });

                removeBtns[index].addEventListener('click', function () {
                    resetUploader(viewLogoBtns[index], removeBtns[index], errorLabels[index], index);
                });
            });

            function resetUploader(viewLogoBtn, errorLabel, removeBtn, index) {
                screensrc[index] = null;
                document.querySelectorAll('.file-upload')[index].value = '';
                document.querySelectorAll('.ermovehdnvalhiglights')[index].value = '';
                viewLogoBtn.src = '';
                viewLogoBtn.style.display = 'none';
                removeBtn.style.display = 'none';
                errorLabel.textContent = '';
                //   console.log("Reset uploader, hiding remove button.");




                //
            }
        });

        window.bindImageToPreview = bindImageToPreview;
    </script>





</asp:Content>

