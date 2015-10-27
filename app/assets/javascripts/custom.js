(function ($) {
	'use strict';
	function stickyHeader () {
		// if($(window).scrollTop() > 10) {
		// 	$('header').addClass('header-fixed'); 
		// }
		// else if($(this).scrollTop() <= 10) {
		// 	$('header').removeClass('header-fixed'); 
		// }
	}
	function menuHover () {
		if ($('header nav.mainmenu ul li').length) {
			$('header nav.mainmenu ul li').each(function () {
				$(this).find('a').addClass('hvr-underline-from-left');
			});
		};
	}
	function sliderAnimation () {
		$('.slider').bxSlider({
			auto: true,
			controls:false,
			pager: false,
			onSlideAfter: function (currentSlideNumber, totalSlideQty, currentSlideHtmlObject) {
			    $('.active-slide').removeClass('active-slide');
			    $('.slider>.item').eq(currentSlideHtmlObject + 1).addClass('active-slide')
			},
			onSliderLoad: function () {
			    $('.slider>.item').eq(1).addClass('active-slide')
			} 
		});
	}
	function serviceHover () {
		if ($('#service .single-service').length) {
			$('#service .single-service').each(function () {
				$(this).addClass('hvr-float-shadow hvr-bounce-to-bottom');
				$(this).find('.single-service-bounce-bg').addClass('hvr-bounce-to-bottom');
				$(this).find('img').addClass('hvr-pulse-shrink');
			});
		};
	}
	function selectPhoneHover () {
		if ($('#select-phone .col-lg-4').length) {
			$('#select-phone .col-lg-4').each(function () {
				$(this).addClass('hvr-shadow-radial');
				$(this).find('a').addClass('hvr-bounce-to-right');
				$(this).find('img').addClass('hvr-bounce-out');
			});
		};
	}
	function testimonialCarousel () {
		if ($('#testimonial-content').length) {
			$('#testimonial-content').owlCarousel({
				loop: true,
				dots : true, 
				autoplay:true,
				autoplayTimeout:2000,
				autoplayHoverPause:true,
			    items: 1,
			    thumbs: true,
    			thumbsPrerendered: true
			});
			

		};
	}
	function clientLogo () {
		if($("#client-logo-carousel").length) {
			$("#client-logo-carousel").owlCarousel({
				items:5,
			    loop:true,
			    margin:85,
			    autoplay:true,
			    autoplayTimeout:2000,
			    autoplayHoverPause:true,
			    nav: false,
			    dots: false
			});
			$("#client-logo-carousel").each(function () {
				$(this).find('img').addClass('hvr-bounce-out');
			});
		}
	}
	function wowActivation () {
		new WOW().init();
	}
	function backTotop () {
		var duration = 700;
		$('body').append(function () {
			return '<a href="#" class="back-to-top"> <i class="fa fa-angle-up"></i> </a>';
		});
		$('a.back-to-top').on('click', function(event) {
			event.preventDefault();
		    $('html, body').animate({scrollTop: 0}, duration);
		    return false;
		});
		if ($(window).scrollTop() > 1) {
            $('.back-to-top').fadeIn(duration);
        } else {
            $('.back-to-top').fadeOut(duration);
        }
	}
	function mobileNavJs () {
		if($('header nav.mainmenu ul').length) {
			$('header .nav-toggler').on('click', function () {
				$(this).parent().find('ul').slideToggle();
			});
		}
	}
	function purchaseToggler () {
		if ($('.condition').length) {
			$('.condition .col-lg-4').on('click', function () {
				$('.condition .col-lg-4').removeClass('active');
				$('.condition .col-lg-4 i').removeClass('fa-check');
				$(this).addClass('active');
				$(this).find('i').addClass('fa-check');
			});
		}
		if($('.choose-phone').length){
			$('.choose-phone .single-phone').on('click', function () {
				$('.choose-phone .single-phone').removeClass('active');
				$(this).addClass('active');
				$(this).parent().parent().children('p').addClass('active');
				$(this).parent().parent().children('p').find('span').text('');
				$(this).parent().parent().children('p').find('span').addClass('fa fa-check active');
			});
		}
		if($('.choose-carrier').length){
			$('.choose-carrier .single-carrier').on('click', function () {
				$('.choose-carrier .single-carrier').removeClass('active');
				$(this).addClass('active');
				$(this).parent().parent().children('p').addClass('active');
				$(this).parent().parent().children('p').find('span').text('');
				$(this).parent().parent().children('p').find('span').addClass('fa fa-check active');
			});
		}
		if($('.choose-memory').length){
			$('.choose-memory .single-memory').on('click', function () {
				$('.choose-memory .single-memory').removeClass('active');
				$(this).addClass('active');
				$(this).parent().parent().children('p').addClass('active');
				$(this).parent().parent().children('p').find('span').text('');
				$(this).parent().parent().children('p').find('span').addClass('fa fa-check active');
			});
		}
		// all section checker
		$('.purchase-step-one .col-lg-3.submit').find('a').on('click', function () {
			if (!$('.choose-phone .single-phone').hasClass('active') || !$('.choose-carrier .single-carrier').hasClass('active') || !$('.choose-memory .single-memory').hasClass('active') ) {
				return false;
			}
		});
		$('.purchase-step-two .col-lg-3.submit').on('click', function () {
			if (!$('.condition .col-lg-4').hasClass('active')) {
				return false;
			}
		});
	}
	function fbLikeButton () {
		if ($('.social-share-wrap').length) {
			$('body').prepend('<div id="fb-root"></div>');
			(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) return;
				js = d.createElement(s); js.id = id;
				js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3&appId=755902611190769";
				fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
		};
	}
	function twFollowButton () {
		if ($('.social-share-wrap').length) {
			!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
		};
	}
	function googleMap () {
		if ($('#gmap')) {
            var map;
            map = new GMaps({
                div: '#gmap',
                control: false,
                lat: -37.812802,
                lng: 144.956981
            });
            map.addMarker({
                icon: 'img/map-marker.png',
                lat: -37.812802,
                lng: 144.956981,
                title: 'Envato HeadQuarter'
            });   
		};
	}
	//Contact Form Validation
	if($('.contact-form').length){
		$('.contact-form').validate({ // initialize the plugin
			rules: {
				name: {
					required: true
				},
				email: {
					required: true,
					email: true
				},
				subject: {
					required: true
				},
				message: {
					required: true
				}
			},
			submitHandler: function (form) { 
				// sending value with ajax request
				$.post($(form).attr('action'), $(form).serialize(), function (response) {
					$(form).parent('div').append(response);
					$(form).find('input[type="text"]').val('');
					$(form).find('textarea').val('');
				});
				return false;
			}
		});
	}
	/**
	* Document ready Event
	*/
	$(document).on('ready', function () {
		clientLogo();
		menuHover();
		serviceHover();
		selectPhoneHover();
		testimonialCarousel();
		sliderAnimation();
		// wowActivation();
		mobileNavJs();
		purchaseToggler();
		fbLikeButton();
		twFollowButton();
		// googleMap();
		
	});
	/**
	* Window Load Event
	*/
	$(window).on('load', function () {

	});
	/**
	* Window Scroll Event
	*/
	$(window).on('scroll', function () {
		stickyHeader();
		backTotop();
	});

})(jQuery);