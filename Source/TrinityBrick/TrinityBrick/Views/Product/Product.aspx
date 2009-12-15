<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TrinityBrick.ViewModels.ProductViewModel>" %>
<%@ Import Namespace="TrinityBrick.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Product
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="_primaryContent" runat="server">

    <h2>Product</h2>
    
    <div id="slideshow">
        <% Html.RenderPartial("~/Views/Product/Slideshow.ascx", Model.Products[0]); %>   
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="_subNavigation" runat="server">
    <ul>
    <% foreach(ProductEntity product in Model.Products)
     { %>
             
        <li style="display:inline;">
            <img src="../../Content/Images/<%= product.SampleImagePath %>" alt="<%= Model.Products[0].Name %>" onclick="Update(<%= product.Id %>)" />
        </li>
             
    <%} %>
    </ul>
    
    <script type="text/javascript">
        function Update(id)
        {   
            $.getJSON("/Product/Update/" + id, UpdateSlideshow);
        }
        
        function UpdateSlideshow(product) {
            $('#productName').html(product.Name);
            $('#slideshowImage').attr('src','../../Content/Images/' + product.Images[0]);
            $('.control').each( function(iterator) {
                $(this).attr('path',product.Images[iterator]);
            });
        }
        
        $(document).ready(function(){
            $('.control').click(function(){
                var control = $(this);
                $('#slideshowImage').attr('src','../../Content/Images/'+control.attr('path'));
            })
        });

    </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="_secondaryContent" runat="server">
</asp:Content>
