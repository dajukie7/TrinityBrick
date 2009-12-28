<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="_primaryContent" runat="server">

    <h2>Our Work</h2>
    
    <ul id="clients">
        <li class="client">
            <img alt="client name" src="../../Content/Images/Clients/example.jpg" />
            <h3>Client Name</h3>
        </li>
        <li class="client">
            <img alt="client name" src="../../Content/Images/Clients/example.jpg" />
            <h3>Client Name</h3>
        </li>
        <li class="client">
            <img alt="client name" src="../../Content/Images/Clients/example.jpg" />
            <h3>Client Name</h3>
        </li>
        <li class="client">
            <img alt="client name" src="../../Content/Images/Clients/example.jpg" />
            <h3>Client Name</h3>
        </li>
        <div class="clear"></div>
    </ul>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="_subNavigation" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="_secondaryContent" runat="server">
</asp:Content>
