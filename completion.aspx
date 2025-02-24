<%@ Page Title="" Language="C#" MasterPageFile="AdminKey2h.master" AutoEventWireup="true" CodeFile="completion.aspx.cs" Inherits="adminkey2hcom_Completion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <style>
.circle-sec [type="text"] {
  width: 200px;
}
.circle-sec{display:flex; justify-content: center;}
.circle-sec section {
  position: relative; 
  border-radius: 7px;
  padding: 5px 30px 30px;
  margin: 20px;
  width: 260px; 
}
      .pie-text-1 {
          font-size: 14px;
    font-weight: bold;
}
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
<div class="panel-header bg-primary-gradient">
    <div class="page-inner py-5">
        <div class="d-flex pb-2 align-items-left align-items-sm-center flex-column flex-sm-row justify-content-between">
            <div>
                <h2 class="text-white pb-2 fw-bold text-uppercase">Completion Update</h2> 
            </div> 
        </div>
    </div>
</div>
<div class="page-inner mt--5">
    <div class="row mt--2">
        <div class="col-md-12">
    <div class="card">
        <div class="card-body">

            <div class="form-group">
                <div class="form-border margin-top20">
                    <div class="form-title"> 
                        <h3>Completion Details</h3>
                    </div>
                    <div class="row mx-0 margin-top20 mb-4">
                        <div class="col-sm-4 col-xl-3 pt-3"> 
            <div class="input-icon input-icon-sm right">
                <label>Project Name <span class="text-danger">*</span></label>
                <i class="bi bi-journal-bookmark-fill b5-icon"></i>
                <asp:DropDownList class="bs-select form-control input-sm" ID="ddlprojects" runat="server">
                </asp:DropDownList> 
            </div>
            <span class="error">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="" ValidationGroup="projval" ControlToValidate="ddlprojects" runat="server" ErrorMessage=" Select project name"></asp:RequiredFieldValidator>
            </span> 
 
        <div class="pt-3">
    <div class="input-icon input-icon-sm right">
        <label>Completion <span class="text-danger">*</span></label>
        <i class="bi bi-percent b5-icon"></i>
        <asp:TextBox runat="server" ID="txtCompletionPercentage" value="75" ClientIDMode="Static" class="form-control input-sm" autocomplete="off" placeholder=""></asp:TextBox>
        <div class="handle-file-request">(in percentage)</div>
    </div>
    <span class="error">
        <asp:RequiredFieldValidator ClientIDMode="Static" EnableClientScript="true" SetFocusOnError="true" ControlToValidate="txtCompletionPercentage" Display="Dynamic" ValidationGroup="projval" ID="RequiredFieldValidator16" runat="server" ErrorMessage="Enter completion percentage"></asp:RequiredFieldValidator>
        <asp:CustomValidator ClientIDMode="Static" ID="CustomValidator1" runat="server" ValidationGroup="projval" ClientValidationFunction="validProjectstatus" Display="Dynamic" ErrorMessage="Max 3 digit"></asp:CustomValidator>
        <asp:RegularExpressionValidator ClientIDMode="Static" ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ValidationGroup="projval" ControlToValidate="txtCompletionPercentage" ValidationExpression="^(100|[1-9][0-9]?)$" ErrorMessage="Enter valid number between 1 and 100"></asp:RegularExpressionValidator>
    </span>
</div>
</div>

        <div class="col-sm-4 col-xl-4 pt-3">
            <div class="circle-sec">  
                <section>
                  <div class="flex info"> 
                  </div>
                  <div class="pie" id="progressPie" data-pie='{ "lineargradient": ["green"], "round": true, "percent": 75,"colorCircle": "#e6e6e6" }'></div> 
                </section> 
              </div>
        </div>
                        </div>
                    </div>
                </div>
            </div>
        <div class="card-footer">
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

         <script type="text/javascript">
             function validatePage() {
                 var flag = Page_ClientValidate('projval')
                 return flag;
             }
         </script>

        <script>
            document.getElementById('<%= txtCompletionPercentage.ClientID %>').addEventListener('keypress', function (e) {
                if (e.key < '0' || e.key > '9' || this.value.length >= 3) {
                    e.preventDefault();
                }
            });
        </script>
    <script type="text/javascript">
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
                        document.getElementById('<%= btnCancel.ClientID %>').click();
                } else if (result.dismiss === Swal.DismissReason.cancel) {
                    // User clicked 'No' 
                }
            });
        });
    });
    </script>


         <script src='https://cdn.jsdelivr.net/gh/tomik23/circular-progress-bar@latest/docs/circularProgressBar.min.js'></script> 
  
        <script>
            // update circle when range change
            window.addEventListener("DOMContentLoaded", () => { 
                const pie = document.querySelectorAll(".pie");
                const circleSection = document.querySelector(".circle-sec");
                const range = document.querySelector('[type="text"]');

                range.addEventListener("input", (e) => {
                    pie.forEach((el, index) => {
                        const options = {
                            index: index + 1,
                            percent: e.target.value
                        };
                        circle.animationTo(options);
                    });
                });

                // start the animation when the element is in the page view
                const elements = [].slice.call(document.querySelectorAll(".pie"));
                const circle = new CircularProgressBar("pie");

                // circle.initial();

                if ("IntersectionObserver" in window) {
                    const config = {
                        root: null,
                        rootMargin: "0px",
                        threshold: 0.75
                    };

                    const ovserver = new IntersectionObserver((entries, observer) => {
                        entries.map((entry) => {
                            if (entry.isIntersecting && entry.intersectionRatio > 0.75) {
                                circle.initial(entry.target);
                                observer.unobserve(entry.target);
                            }
                        });
                    }, config);

                    elements.map((item) => {
                        ovserver.observe(item);
                    });
                } else {
                    elements.map((element) => {
                        circle.initial(element);
                    });
                }

                setInterval(() => {
                    const typeFont = [100, 200, 300, 400, 500, 600, 700];
                    const colorHex = `#${Math.floor((Math.random() * 0xffffff) << 0).toString(
                        16
                    )}`;
                    const options = {
                        index: 17,
                        percent: Math.floor(Math.random() * 100 + 1),
                        colorSlice: colorHex,
                        fontColor: colorHex,
                        fontSize: `${Math.floor(Math.random() * (1.4 - 1 + 1) + 1)}rem`,
                        fontWeight: typeFont[Math.floor(Math.random() * typeFont.length)]
                    };
                    circle.animationTo(options);
                }, 3000);

                // global configuration
                const globalConfig = {
                    speed: 30,
                    animationSmooth: "1s ease-out",
                    strokeBottom: 5,
                    colorSlice: "#FF6D00",
                    colorCircle: "#f1f1f1",
                    round: true
                };

                const global = new CircularProgressBar("global", globalConfig);
                global.initial();

                // update global example when change range
                const pieGlobal = document.querySelectorAll(".global");
                range.addEventListener("input", (e) => {
                    pieGlobal.forEach((el, index) => {
                        const options = {
                            index: index + 1,
                            percent: e.target.value
                        };
                        global.animationTo(options);
                    });
                });

                document.querySelectorAll("pre code").forEach((el) => {
                    hljs.highlightElement(el);
                });

                const infoCode = document.querySelectorAll(".info-code");
                infoCode.forEach((info) => {
                    info.addEventListener("click", (e) => {
                        e.target.closest("section").classList.toggle("show-code");
                    });
                });
            });
        </script>

</asp:Content>

