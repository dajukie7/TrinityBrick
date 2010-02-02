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
            image: $('#slideshowImage'),
            samples: $('.sample')
        }

        var options = $.extend(defaults, options);
        var products = new Array();


        LoadProducts(this);
        BoldProductName($('#productName').html());
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
            slideshow.controls.removeClass('active').addClass('inactive');
            $(slideshow.controls[0]).addClass('active').removeClass('inactive');

            slideshow.samples.removeClass('selected');
            $(prod).addClass('selected');

            for (i = 0; i < 3; i++) {
                $(slideshow.controls[i]).attr('path', product.Images[i]);
            }

            BoldProductName(product.Name);
            UpdateSlideshow(product);
        }

        function UpdateSlideshow(product) {
            $('#productDescription').html(product.Description);
            $('#productName').html(product.Name);
            $('.options .option b').html(product.Name);
            BoldProductName(product.Name);
        }

        function BindSlideshow() {
            slideshow.controls.click(function() {
                //set the active button, reset the others
                slideshow.controls.removeClass('active').addClass('inactive');
                $(this).addClass('active').removeClass('inactive');

                //change the slideshow image
                var path = $(this).attr('path');
                slideshow.image.attr('src', defaults.imgDir + path);
            });
        }

        function BoldProductName(name) {
            var description = $('#productDescription').html().replace(name, '<b>' + name + '</b>');

            //first remove the <b> tag from the options
            var map = $('#info .option.map').html().replace('<b>' + name + '</b>', name).replace(name, '<b>' + name + '</b>');
            var email = $('#info .option.email').html().replace('<b>' + name + '</b>', name).replace(name, '<b>' + name + '</b>');

            $('#productDescription').html(description);
            $('#info .option.map').html(map);
            $('#info .option.email').html(email);
        }
    };
})(jQuery);