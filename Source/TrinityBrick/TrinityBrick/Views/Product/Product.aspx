<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TrinityBrick.ViewModels.ProductViewModel>" %>
<%@ Import Namespace="TrinityBrick.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Product
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="_primaryContent" runat="server">
    
    <div >
        <div id="slideshow">
            <div class="image">
                <img id="slideshowImage" src="../../Content/Images/<%= Model.Products[0].Images[0] %>" alt="<%= Model.Products[0].Name %>" />
            </div>
            <div class="controls">
                <div class="control active" id="image1" path="<%= Model.Products[0].Images[0] %>"><div>1</div></div>
                <div class="control inactive" id="image2" path="<%= Model.Products[0].Images[1] %>"><div>2</div></div>
                <div class="control inactive" id="image3" path="<%= Model.Products[0].Images[2] %>"><div>3</div></div>
                <div class="clear"></div>
            </div>
        </div>
        <div id="info">
            <h1 id="productName"><%= Model.Products[0].Name %></h1>
            <p id="productDescription"><%= Model.Products[0].Description %></p>
            <div class="options">
                <div class="option email">Would you like to know more about <%= Model.Products[0].Name %>?</div>
                <a href="../Contact?message=<%= Model.Products[0].Name %>" class="action email">Ask Us</a>
                <div class="clear"></div>
            </div>
            <div class="options">
                <div class="option map">Would you like to find houses near you with <%= Model.Products[0].Name %></div>
                <div class="action map">Map It</div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="_subNavigation" runat="server">
    <ul id="samples">
    <% foreach(ProductEntity product in Model.Products)
     { %>
             
        <li class="sample">
            <img src="../../Content/Images/<%= product.SampleImagePath %>" alt="<%= Model.Products[0].Name %>" />
            <div class="sampleInfo">
                <h4 class="sampleName"><%= product.Name %></h4>
                <span class="sampleId hidden"><%= product.Id %></span>
                <span class="sampleDescription hidden"><%= product.Description %></span>
                <div class="images hidden">
                    <%
                     foreach (string image in product.Images)
                     { %>
                         <span class="image"><%= image %></span>
                    <% } %>
                </div>
            </div>
        </li>
             
    <%} %>
        <div class="clear"></div>
    </ul>
    
    <script type="text/javascript">
        function Update(id)
        {
            $.getJSON("/Product/Update/" + id, UpdateSlideshow);
        }

        function UpdateSlideshow(product) {
            $('#slideshowImage').attr('src', '../../Content/Images/' + product.Images[0]);
            $('#productName').html(product.Name);
            $('#productDescription').html(product.Description);
            $('.control').each( function(iterator) {
                $(this).attr('path',product.Images[iterator]);
            });
        }

        $(document).ready(function() {
            $('.sample:first').addClass('selected');
            $('.sample').samples();
        });

    </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="_secondaryContent" runat="server">
</asp:Content>
