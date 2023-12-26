//<![CDATA[

$(window).load(function () {
  quickView.initquickView();
});

var quickView = {

  'initquickView' : function () {
    $('body').append('<div class="quickview-container"></div>');
    $('.quickview-container').load('index.php?route=product/quickview/insertcontainer');
  },

  'addCloseButton' : function () {
    $('.quickview-wrapper-inner').prepend("<a href='javascript:void(0);' class='quickview-btn' onclick='quickView.closeButton()'>&times;</a>");
    
  },

  'closeButton' : function () {
    $('.quickview-overlay').hide();
    $('.quickview-wrapper').hide().html('');
    $('.quickview-loader').hide();
  },

  ajaxView :function(url){
    if(url.search('route=product/product') != -1) {
      url = url.replace('route=product/product', 'route=product/quickview');
    } else {
      url = 'index.php?route=product/quickview/seoview&ourl=' + url;
    }

    $.ajax({
      url     : url,
      type    : 'get',
      beforeSend  : function() {
        $('.quickview-overlay').show();
        $('.quickview-loader').show(); 
        $('.tooltip').removeClass('fade top in');     
      },
      success   : function(json) {
        if(json['success'] == true) {          
          $('.quickview-wrapper').html(json['html']);
          quickView.addCloseButton();    

            const direction = $('html').attr('dir');
            $('#quick-carousel').each(function () {
                const items = $(this).data('items') || 3;
                const sliderOptions = {
                    loop: false,
                    nav: true,
                    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
                    dots: false,
                    items: 3,
                    responsiveRefreshRate: 200,
                    responsive: {
                        0: { items:1 },
                        320: { items:2 },
                        425: { items:3 },
                        480: { items:3 },
                        767: { items:4 },
                        768: { items:3 },
                        991: { items:3 },
                        992: { items:3 },
                        1201: { items:3 }
                    }
                };
                if (direction == 'rtl') sliderOptions['rtl'] = true;
                  $(this).owlCarousel(sliderOptions);
            });
            $('.quickview-wrapper').show();
            $('.quickview-loader').hide();       


          $('#datetimepicker').datetimepicker({
            pickTime: false
          });                   
          $('#datetime').datetimepicker({
            pickDate: true,
            pickTime: true
          });
          
          $('#Time').datetimepicker({
            pickDate: false
          });

        }
      }
    });

  }
};
//]]>