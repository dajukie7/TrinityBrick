<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<TrinityBrick.Models.ProductEntity>" %>
<div>
    <h2 id="productName"><%=Model.Name %></h2>
    <div class="image">
        <img id="slideshowImage" src="../../Content/Images/<%= Model.Images[0] %>" alt="<%= Model.Name %>" />
    </div>
    <div class="controls">
        <div class="control" path="<%= Model.Images[0] %>">Image 1</div>
        <div class="control" path="<%= Model.Images[1] %>">Image 2</div>
        <div class="control" path="<%= Model.Images[2] %>">Image 3</div>
    </div>
</div>

