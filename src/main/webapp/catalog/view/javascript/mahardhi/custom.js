(function ($) {
	"use strict";
	/*----------------------------------------------*/
	/* Loader  */
	/*----------------------------------------------*/	
	$(window).on("load", function () {
		$('.page-loader').fadeOut('slow',function(){
			$(this).remove();
		});
	});
	/*----------------------------------------------*/
	/* Menu Button click */
	/*----------------------------------------------*/
	$(function() {
		$('#menu .menu-navbar').removeClass('active');
		$('#btnMenuBar').on('click',function(e) {
			e.preventDefault();
			$(this).toggleClass('active');
			$('#menu .menu-navbar').toggleClass('active').slideToggle("slow");
		});
	});
	$(function() {
		// set column+content
		updateColumnsAndContent();
		// clikc events
		clickEventsInCategoryPage();

		// actions
		footerExplanCollapse();
		
	});
	$(window).resize(function () {
		// set column+content
		updateColumnsAndContent();
	});
	/*----------------------------------------------*/
	/* Update column+content in responsive */
	/*----------------------------------------------*/
	function updateColumnsAndContent() {
		if ($(window).width() < 992) {
			$('#column-left, #column-right').insertAfter('#content');

			// menu
			if ($("#menu .dropdown.menulist .toggle-menu").length == 0) {
				$("#menu .dropdown.menulist").append("<span class='toggle-menu'><i class='fa fa-plus'></i></span>");
				$("#menu .dropdown.menulist .dropdown-submenu.sub-menu-item").append("<span class='toggle-menu'><i class='fa fa-plus'></i></span>");

				$('#topCategoryList ul.sub-menu,#topCategoryList div.dropdown-menu').removeAttr("style");
				$('#topCategoryList').hide();

				// call explan-collapse
				responsiveMenuExpandCollapse();
			}

			// left, right
			$("#column-left .box-category .toggle-open, #column-right .box-category .toggle-open").remove();
			$("#column-left .box-category h3, #column-right .box-category h3").append("<span class='toggle-open'><i class='fa fa-chevron-down'></i></span>");

			$("#column-left .box-content .toggle-open, #column-right .box-content .toggle-open").remove();
			$("#column-left .box-content h3, #column-right .box-content h3").append("<span class='toggle-open'><i class='fa fa-chevron-down'></i></span>");

			$('#column-left ul.parent, #column-right ul.parent').hide();
			$('#column-left .filter_box, #column-right .filter_box, #column-left .block_box, #column-right .block_box, #column-left .box-content ul, #column-right .box-content ul').hide();

			// footer
			if ($(".footer-top .toggle-open").length == 0) {
				$(".footer-top h5").append("<span class='toggle-open'><i class='fa fa-chevron-down'></i></span>");
				$('.footer-top ul.list-unstyled').hide();
			}
		} else {
			$('#column-right').insertAfter('#content');
			$('#column-left').insertBefore('#content');

			// menu
			$("#menu .dropdown.menulist .toggle-menu").remove();
			$('#topCategoryList').show();
			$('#topCategoryList ul.sub-menu').removeAttr("style");
			$('#topCategoryList div.dropdown-menu').css("display", "");

			// left, right
			$("#column-left .box-category .toggle-open, #column-left .box-content .toggle-open").remove();
			$("#column-right .box-category .toggle-open, #column-right .box-content .toggle-open").remove();
			$('#column-left ul.parent, #column-right ul.parent').show();
			$('#column-left .filter_box, #column-right .filter_box, #column-left .block_box, #column-right .block_box, #column-left .box-content ul, #column-right .box-content ul').show();

			// footer
			$(".footer-top .toggle-open").remove();
			$('.footer-top ul.list-unstyled').show();
		}
	}
	/*----------------------------------------------*/
	/* Click events in category page */
	/*----------------------------------------------*/
	function clickEventsInCategoryPage() {
		$('.box-category .toggled').on('click',function(e) {
			e.preventDefault();
			if ($(window).width() < 992) {
				$(this).toggleClass('active');
				$(this).parent().find('ul.parent').toggleClass('active').slideToggle('slow');
			}
		});

		$('#column-left .box-content .toggled , #column-right .box-content .toggled').on('click',function(e) {
			e.preventDefault();
			if ($(window).width() < 992) {
				$(this).toggleClass('active');
				if ($(this).parent().find('ul').length != 0) {
					$(this).parent().find('ul').toggleClass('active').slideToggle('slow');
				} else {
					$(this).parent().find('.filter_box').toggleClass('active').slideToggle('slow');
					$(this).parent().find('.block_box').toggleClass('active').slideToggle('slow');
				}
			}
		});
	}	
	/*----------------------------------------------*/
	/* Responsive menu */
	/*----------------------------------------------*/
	function responsiveMenuExpandCollapse() {
		// expand-collapse
		$('#topCategoryList .dropdown.menulist .toggle-menu').on('click',function(e) {
			e.preventDefault();
			if($(this).parent().find('> ul.sub-menu').length != 0) {
				$(this).parent().find('> ul.sub-menu').slideToggle('slow');
			} else {
				$(this).parent().find('> div.dropdown-menu').slideToggle('slow');
			}
			$(this).parent().toggleClass('active');
			$(this).toggleClass('active');
			return false;
		});
	}
	/*----------------------------------------------*/
	/* Footer Toggle */
	/*----------------------------------------------*/
	function footerExplanCollapse() {
		$(".footer-top h5").addClass('toggled');
		$('.footer-top .toggled').on('click',function(e) {
			e.preventDefault();
			if ($(window).width() < 992) {
				$(this).toggleClass('active');
				$(this).parent().find('ul').toggleClass('active').toggle('slow');
			}
		});
	}	
	// category page active current page category
	$(function () {
		setNavigation();
		addbredcumb();
		setPageTitle();
		// alert msg
		setalert();
	});
	
	/*----------------------------------------------*/
	/* Braedcrub */
	/*----------------------------------------------*/
	function addbredcumb() {
		$('.breadcrumb').insertAfter('header');
		$('.breadcrumb').wrap("<div class='breadcrumb-row clearfix'></div>");
		$('.breadcrumb-row').wrap("<div class='container breadcrumb-container'></div>");
		$('.breadcrumb-container').wrap("<div class='breadcrumb-back'></div>");
	}	
	$(function(){
		if ( $('ul.breadcrumb li').length == 2 ) {
			var last_val=$('ul.breadcrumb').children('li').last().text();
			var link_val =$('ul.breadcrumb li:last-child a').attr('href');
		}
	});
	/*----------------------------------------------*/
	/* Page Title */
	/*----------------------------------------------*/
	function setPageTitle() {
		$('#content > h2,#content > h1').addClass("page_title");		
	}
	/*----------------------------------------------*/
	/* alert */
	/*----------------------------------------------*/
	function setalert() {
		$('<button type="button" class="close" data-dismiss="alert">&times;</button>').appendTo('.alert.alert-dismissible');	
	}
	/*----------------------------------------------*/
	/* Category page active current page category */
	/*----------------------------------------------*/
	function setNavigation() {
		var currentHref = window.location.href;
		$("#selectMe-desk li a").each(function () {
			var href = $(this).attr('href');
			if (currentHref === href) {
				if ($(this).parents('.has-more-category')) {
					$(this).parents('.has-more-category').find('a.list-group-item.main-item').addClass('active');
					$(this).parents('.has-more-category').find('.group').css("display","block");
				}
				$(this).addClass('active');
				$(this).parent().find('.group').css("display","block");
			}
		});
	}
	$(function() { setNavigation(); });
	$(window).resize(function() { setNavigation(); });

	$(function() {
		// Slider
		setProductCarousel();
		// Back to top
		backToTop();
		// Parallax
		parallax();
		// Header Fix
		fixHeader();
	});
	$(window).resize(function(){
		fixHeader();
	});
	/*----------------------------------------------*/
	/* Header Fixed  */
	/*----------------------------------------------*/
	function fixHeader(){
		$(window).on("scroll", function () {
		  	if ($(window).width() > 991) {     
		    	if ($(window).scrollTop() >= parseInt(44,10)) {
		        	$(".header-fixed").addClass("active");
		    	} else {
			        $(".header-fixed").removeClass("active");
			    }
		  	}
		  	else{
				$('.header-fixed').removeClass('active');
			}
		});
	}
	
	/*----------------------------------------------*/
	/* Slider for product */
	/*----------------------------------------------*/
	function setProductCarousel() {
		const direction = $('html').attr('dir');
		$('.product-carousel').each(function () {
			if ($(this).closest('#column-left').length == 0 && $(this).closest('#column-right').length == 0) {
				$(this).addClass('owl-carousel owl-theme');
				const items = $(this).data('items') || 4;
				const sliderOptions = {
					loop: false,
					nav: true,
					navText: ['<i class="fa fa-angle-left" aria-hidden="true">','<i class="fa fa-angle-right" aria-hidden="true">'],
					dots: false,
					items: items,
					responsiveRefreshRate: 200,
					responsive: {
						0: { items: 1 },
						481: { items: ((items - 2) > 1) ? (items - 2) : 1 },
						768: { items: ((items - 1) > 1) ? (items - 1) : 1 },
						991: { items: ((items - 1) > 1) ? (items - 1) : 1 },
						1150: { items: ((items - 1) > 1) ? (items - 1) : 1 },
						1024: { items: ((items - 1) > 1) ? (items - 1) : 1 },
						1200: { items: items }
					}
				};
				if (direction == 'rtl') sliderOptions['rtl'] = true;
				$(this).owlCarousel(sliderOptions);
			}
		});
		$('.instagram-item-5').each(function () {
			const sliderOptions = {
				items: 5,
				loop: false,
				margin: 30,
				autoplay: false,
				dots: false,
				nav: false,      
				responsive: {      
					0:{ items: 2 },    
					480: { items: 3 },
					767: { items: 4 },
					991: { items: 4 },
					991: { items: 5 },
					1170: { items: 5 }         
				}
			};
			if (direction == 'rtl') sliderOptions['rtl'] = true;
				$(this).owlCarousel(sliderOptions);
		})
	}
	/*----------------------------------------------*/
	/* Back to top function */
	/*----------------------------------------------*/
	function backToTop() {
		//Check to see if the window is top if not then display button
		$(window).scroll(function(){
			if ($(this).scrollTop() > 250) {
				$('.scrollToTop').fadeIn();
				$('.scrollToTop').addClass('active');
			} else {
				$('.scrollToTop').fadeOut();
				$('.scrollToTop').remove('active');
			}
		});
		//Click event to scroll to top
		$('.scrollToTop').on('click',function(){
			$('html, body').animate({scrollTop : 0},800);
			return false;
		});
	}
	function parallax() {
		if ($(window).width() > 768) {
			var parallax = document.querySelectorAll(".parallax"),
			speed = 0.5;
			window.onscroll = function(){
				[].slice.call(parallax).forEach(function(el,i){
					var windowYOffset = window.pageYOffset /1.5,
					elBackgrounPos = "50% " + (windowYOffset * speed) + "px";
					el.style.backgroundPosition = elBackgrounPos;
				});
			};
		}
	}
	/*----------------------------------------------*/
	/* Dropdown Toggle */
	/*----------------------------------------------*/
	$(function(){
		$(".btn-search").on('click',function(e){
			$('.header-search').addClass('active');
			$(".header-cart-toggle,#search .box-content,.currency-box .currency-menu,.dropdown-menu-right,.languages-box  .languages-menu,header-cart-toggle").slideUp("slow");
			e.stopPropagation();
		})

		$(".close-button").on('click',function(){
			$('.header-search').removeClass('active');
		})	

		$("#cart button.dropdown-toggle").on('click',function(e){
			e.stopPropagation();
			$(".header-cart-toggle").slideToggle( "2000" );
			$(".dropdown-menu-right,.languages-box  .languages-menu,.currency-box .currency-menu").slideUp("slow");		
			$('.header-search').removeClass('active');			
		});

		$(".currency-box button.dropdown-toggle").on('click',function(){
			$(this).toggleClass('active');
			$(".currency-box .currency-menu").slideToggle( "2000" );
			$(".header-cart-toggle,.account-link-toggle,.dropdown-menu-right,.languages-box  .languages-menu").slideUp("slow");
			$('.header-search').removeClass('active');
		});

		$(".languages-box button.dropdown-toggle").on('click',function(){
			$(this).toggleClass('active');
			$(".languages-box .languages-menu").slideToggle( "2000" );
			$(".header-cart-toggle,.account-link-toggle,.dropdown-menu-right,.currency-box .currency-menu").slideUp("slow");
			$('.header-search').removeClass('active');
		});

		$(".myaccount-dropdown a.dropdown-toggle").on('click',function(){
			$(".dropdown-menu-right").slideToggle("2000");
			$(".header-cart-toggle,.currency-box .currency-menu,.languages-box .languages-menu").slideUp("slow");
			$('.header-search').removeClass('active');
		});	

		$('.header-search').on('click',function(e){
			e.stopPropagation();
		});
		$(".header-cart-toggle").on("click", function(e){
		    e.stopPropagation();
		});
			
	});	
	$(document).on('click',function(){
		$("#search .box-content,.dropdown-menu-right,.myaccount-menu,.header-cart-toggle,.currency-box .currency-menu,.languages-box .languages-menu").slideUp('slow')	
		$(".myaccount > .dropdown-toggle,#cart .dropdown-toggle").removeClass('active');		
	});	
	/*----------------------------------------------*/
	/* quantity seter */
	/*----------------------------------------------*/
	$( document ).on( 'click', '.plus, .minus', function( e ) {
		e.preventDefault();
		var parent = $( this ).parents( '.product-btn-quantity' );
		var quantity = parent.find( '[name="quantity"]' );
		var val = quantity.val();
		if ( $( this ).hasClass( 'plus' ) ) {
			val = parseInt( val ) + 1;
		} else {
			if(val == 1) {
				val = 1;
			}
			else {
				val = val >= 1 ? parseInt( val ) - 1 : 0;
			}
		}
		quantity.val( val );
		return false;
	} );
	
	/*----------------------------------------------*/
	/* Hover zoom button */
	/*----------------------------------------------*/
	function hoverzoom() {
		setTimeout(function () {
			if ($(window).width() > 767) {
				$('.hover-zoom').magnificPopup({
					type:'image',
					gallery:{
						enabled:true,
						arrowMarkup: '<button title="%title%" type="button" class="mfp-arrow mfp-arrow-%dir%"><i class="fa fa-angle-%dir% fa-4x"></i></button>'
					}
				});
			}
		}, 1000);		
	}
	$(function() { hoverzoom(); });
	$(window).resize(function() { hoverzoom(); });

})(jQuery);