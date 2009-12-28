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
                <div class="control" id="image1" path="<%= Model.Products[0].Images[0] %>">Image 1</div>
                <div class="control" id="image2" path="<%= Model.Products[0].Images[1] %>">Image 2</div>
                <div class="control" id="image3" path="<%= Model.Products[0].Images[2] %>">Image 3</div>
                <div class="clear"></div>
            </div>
        </div>
        <div id="info">
            <h1 id="productName"><%= Model.Products[0].Name %></h1>
            <p id="productDescription"><%= Model.Products[0].Description %></p>
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
            $('.sample').samples();
        });

    </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="_secondaryContent" runat="server">
</asp:Content>
