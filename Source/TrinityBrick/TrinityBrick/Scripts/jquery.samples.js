(function($) {
    $.fn.samples = function(options) {

        var defaults = {
            imgDir: "../Content/Images/",
            imgFormat: ".jpg",
            slideshowId: "#slideshow"
        };

        var slideshow = {
            container: $(defaults.slideshowId),
            controls: $('.control'),
            image: $('#slideshowImage')
        }

        var options = $.extend(defaults, options);
        var products = new Array();


        LoadProducts(this);
        BindSlideshow();

        return this.each(function() {
            $(this).click(function() {
                LoadProduct(this);
            })
        });

        function LoadProducts(collection) {
            //add each product to the products array
            collection.each(function() {
                //setup shortcuts to paths
                var infoPath = $(this).children('.sampleInfo');
                var imagePath = infoPath.children('.images').children('.image');

                //create product
                var product = {
                    Name: infoPath.children('.sampleName').html(),
                    Description: infoPath.children('.sampleDescription').html(),
                    Id: infoPath.children('.sampleId').html(),
                    Images: [$(imagePath[0]).html(), $(imagePath[1]).html(), $(imagePath[2]).html()]
                };

                //add product to products collection	
                products[product.Id] = product;
            });
        };

        function LoadProduct(prod) {
            var product = products[$(prod).children('.sampleInfo').children('.sampleId').html()];
            slideshow.image.attr('src', defaults.imgDir + product.Images[0]);
            slideshow.controls.removeClass('active');
            $(slideshow.controls[0]).addClass('active');

            for (i = 0; i < 3; i++) {
                $(slideshow.controls[i]).attr('path', product.Images[i]);
            }

            //UpdateSlideshow(product);
        }

        function BindSlideshow() {
            slideshow.controls.click(function() {
                //set the active button, reset the others
                slideshow.controls.removeClass('active');
                $(this).addClass('active');

                //change the slideshow image
                var path = $(this).attr('path');
                slideshow.image.attr('src', defaults.imgDir + path);
            });
        }
    };
})(jQuery);