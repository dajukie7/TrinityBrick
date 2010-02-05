<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Contact
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="_primaryContent" runat="server">

    <h2>Contact Us</h2>    
    
    <div id="contact_options">
        <h3 class="by_email">Email</h3>
        <h3 class="by_phone">Phone</h3>
    </div>
    
    <div class="clear"></div>
    
    <form id="contact_form" action="/Contact" method="post">
        <div class="section">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" />
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" />
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" />
        </div>   
        <div class="section">
            <label for="comments">Comments:</label>
            <textarea rows="7" cols="18" id="comments" name="comments"><%= ViewData["Message"] %></textarea>
        </div>  
        <div class="clear"></div>   
        <input type="submit" value="Submit"/>
    </form>
    
    <div class="divider">
    
    </div>
    
    <div class="contact">
        <span class="phoneTitle">Local</span>
        <span class="phone">(405) 235-3900</span>
        <span class="phoneTitle">Toll Free</span>
        <span class="phone">1-800-572-5053</span>
    </div>
    
    <div class="clear"></div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="_subNavigation" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="_secondaryContent" runat="server">
</asp:Content>
