<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Contact
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="_primaryContent" runat="server">

    <h2>Contact Us</h2>
    
    <% using (Html.BeginForm()) { %>
        <p>
            <label for="name">Name</label>
            <input type="text" id="name" name="name" />
        </p>        
        <input type="submit" value="Submit" />
    <% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="_subNavigation" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="_secondaryContent" runat="server">
</asp:Content>
