<%@ Page Language="AVR" MasterPageFile="~/BasicMasterPage.master" AutoEventWireup="false" CodeFile="Index.aspx.vr" Inherits="Index" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">

        <div class="container">
           <main>
               <h4>Index.aspx page</h4>
               <p>This page is <code>index.aspx</code> in the <code>views</code> folder. Notice that you don't see <code>index.aspx</code> in the URL. 
                  ASP.NET's routing engine maps the empty URL to the <code>views/index.aspx</code> page. In this template's master page you can 
                  see an example of how ASP.NET's 
                   <a href="https://docs.microsoft.com/en-us/dotnet/api/system.web.ui.control.getrouteurl?view=netframework-4.7.1#System_Web_UI_Control_GetRouteUrl_System_Object_">
                   <code>GetRouteUrl()</code> 
                   </a>
                   method (shown below) is used to fetch a URL by its named route 
                  (as defined in <code>web.config</code>) for use with the <code>Home</code> link in the navbar above. 
                  <br />  
                  <br />  
                  <code style="margin-left: 2rem;"> &lt;a class="nav-link" href="&lt;%#: GetRouteUrl('home') %>">Home &lt;span class="sr-only">(current)&lt;/&lt;span>&lt;/a></code>

               </p>
               <br />

               <h4>Example REST api routes in this template:</h4>
               <p>The URL <code>/api/customers/345</code> doesn't map to an ASPX page. Rather, it uses ASP.NET's routing engine along with the 
                   <code>ASNAJsonRestRouting.DLL</code> to map the request to a method in a class. This method returns Json. Use the links below
                   to see examples of the Json returned. These two example requests are HTTP GET requests. However, it is also possible 
                   issue POST requests (as well as other kinds of requests) to send data to update a data store.

               </p>

               <h5>Get a single customer</h5>
               <a title="Click this link to show the example Json" href="/api/customers/345">api/customers/345 - get a single entity</a>
               <br />
               <h5>Get all customers</h5>
               <a title="Click this link to show the example Json" href="/api/customers">api/customers - get all customers</a>
           </main>  
        </div


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">

</asp:Content>

