<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="_primaryContent" runat="server">
    <h1 class="tagLine">Brick That Lasts A Lifetime</h1>
    <hr class="rule" />
    <div class="clear"></div>
    <h2>
        At <span class="name">Trinity Brick</span> our mission statement is 
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque elit sapien, porttitor vitae convallis quis, tincidunt eu risus. Nullam a tellus sapien, in ultrices nunc. 
    </h2>
    <a href="#" class="samples"><img alt="See Our Brick Samples" src="../../Content/Images/samples.png"/></a>
    <img alt="Trinity Brick" src="../../Content/Images/brick.png" class="brick" />
</asp:Content>

<asp:Content ID="indexSecondary" ContentPlaceHolderID="_secondaryContent" runat="server">
    <div class="container_12">
        <div id="about" class="grid_4">
            <h2>Trinity Brick</h2>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nisl diam, 
                semper nec bibendum ut, consequat eget nisl. Curabitur scelerisque neque nec 
                erat ullamcorper pellentesque. Etiam euismod diam nec magna aliquet ultricies. 
                Aliquam erat volutpat. Vivamus dignissim posuere quam, vitae sagittis arcu 
                ornare mollis. Sed nisi magna, facilisis eu aliquam non, ornare sed tellus. 
                Nam magna purus, fringilla ut cursus ac, sollicitudin sit amet enim. 
                Suspendisse vitae velit in augue mattis sodales. Nam quis ligula mi. Duis 
                hendrerit nulla non elit mattis sit amet luctus lacus tristique. 
            </p>
        </div>
        <div id="ourWork" class="grid_4">        
            <h2>Our Work</h2>   
            <i>click an image below to see some of our work</i>
            <div class="thumb"></div>
            <div class="thumb"></div>
            <div class="thumb"></div>
            <div class="thumb"></div>
            <div class="thumb"></div>
            <div class="thumb"></div>
            <div class="thumb"></div>
            <div class="thumb"></div>
            <div class="thumb"></div>
        </div>
        <div id="contact" class="grid_4">
            <h2>Come See Us</h2>
            <div id="location">                
                <h3 class="location">Location</h3>
                <span class="address">2515 W. Reno Ave</span>
                <span class="address">Oklahoma City, OK 73107</span>
                <a class="address" href="#">Map It</a>
            </div>
            <div id="phone">
                <h3>Phone</h3>
                <span class="phoneTitle">Local</span>
                <span class="phone">(405) 235-3900</span>
                <span class="phoneTitle">Toll Free</span>
                <span class="phone">1-800-572-5053</span>
                <a class="phone" href="#">Questions or Comments?</a>
            </div>            
        </div>
        <div class="clear"></div>
    </div>
</asp:Content>