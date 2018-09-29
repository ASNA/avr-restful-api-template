<%@ Page Language="AVR" MasterPageFile="~/BasicMasterPage.master" AutoEventWireup="false" CodeFile="Index.aspx.vr" Inherits="Index" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server">
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Disabled</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container">
           <main>
               <h4>REST api examples:</h4>
               <a href="/api/customers/345">api/customers/345 - get a single entity</a>
           </main>
   
<%--           <aside>
              aside
           </aside>--%>
   
           <footer>
              footer   
           </footer>
        </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <%--<script src="assets/js/flatpickr.js"></script>--%>

    <script>
        const today = new Date();
        const fp = flatpickr(document.querySelector("#inputBirthDate"),{"maxDate": today});
    </script>
</asp:Content>

