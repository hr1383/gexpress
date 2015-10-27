(($) ->

  stickyHeader = ->    
    return

  menuHover = ->
    if $('header nav.mainmenu ul li').length
      $('header nav.mainmenu ul li').each ->
        $(this).find('a').addClass 'hvr-underline-from-left'
        return
    return

  sliderAnimation = ->
    $('.slider').bxSlider
      auto: true
      controls: false
      pager: false
      onSlideAfter: (currentSlideNumber, totalSlideQty, currentSlideHtmlObject) ->
        $('.active-slide').removeClass 'active-slide'
        $('.slider>.item').eq(currentSlideHtmlObject + 1).addClass 'active-slide'
        return
      onSliderLoad: ->
        $('.slider>.item').eq(1).addClass 'active-slide'
        return
    return

  serviceHover = ->
    if $('#service .single-service').length
      $('#service .single-service').each ->
        $(this).addClass 'hvr-float-shadow hvr-bounce-to-bottom'
        $(this).find('.single-service-bounce-bg').addClass 'hvr-bounce-to-bottom'
        $(this).find('img').addClass 'hvr-pulse-shrink'
        return
    return

  selectPhoneHover = ->
    if $('#select-phone .col-lg-4').length
      $('#select-phone .col-lg-4').each ->
        $(this).addClass 'hvr-shadow-radial'
        $(this).find('a').addClass 'hvr-bounce-to-right'
        $(this).find('img').addClass 'hvr-bounce-out'
        return
    return

  testimonialCarousel = ->
    if $('#testimonial-content').length
      $('#testimonial-content').owlCarousel
        loop: true
        dots: true
        autoplay: true
        autoplayTimeout: 2000
        autoplayHoverPause: true
        items: 1
        thumbs: true
        thumbsPrerendered: true
    return

  clientLogo = ->
    if $('#client-logo-carousel').length
      $('#client-logo-carousel').owlCarousel
        items: 5
        loop: true
        margin: 85
        autoplay: true
        autoplayTimeout: 2000
        autoplayHoverPause: true
        nav: false
        dots: false
      $('#client-logo-carousel').each ->
        $(this).find('img').addClass 'hvr-bounce-out'
        return
    return

  wowActivation = ->
    (new WOW).init()
    return

  backTotop = ->
    duration = 700
    $('body').append ->
      '<a href="#" class="back-to-top"> <i class="fa fa-angle-up"></i> </a>'
    $('a.back-to-top').on 'click', (event) ->
      event.preventDefault()
      $('html, body').animate { scrollTop: 0 }, duration
      false
    if $(window).scrollTop() > 1
      $('.back-to-top').fadeIn duration
    else
      $('.back-to-top').fadeOut duration
    return

  mobileNavJs = ->
    if $('header nav.mainmenu ul').length
      $('header .nav-toggler').on 'click', ->
        $(this).parent().find('ul').slideToggle()
        return
    return

  purchaseToggler = ->
    if $('.condition').length
      $('.condition .col-lg-4').on 'click', ->
        $('.condition .col-lg-4').removeClass 'active'
        $('.condition .col-lg-4 i').removeClass 'fa-check'
        $(this).addClass 'active'
        $(this).find('i').addClass 'fa-check'
        return
    if $('.choose-phone').length
      $('.choose-phone .single-phone').on 'click', ->
        $('.choose-phone .single-phone').removeClass 'active'
        $(this).addClass 'active'
        $(this).parent().parent().children('p').addClass 'active'
        $(this).parent().parent().children('p').find('span').text ''
        $(this).parent().parent().children('p').find('span').addClass 'fa fa-check active'
        return
    if $('.choose-carrier').length
      $('.choose-carrier .single-carrier').on 'click', ->
        $('.choose-carrier .single-carrier').removeClass 'active'
        $(this).addClass 'active'
        $(this).parent().parent().children('p').addClass 'active'
        $(this).parent().parent().children('p').find('span').text ''
        $(this).parent().parent().children('p').find('span').addClass 'fa fa-check active'
        return
    if $('.choose-memory').length
      $('.choose-memory .single-memory').on 'click', ->
        $('.choose-memory .single-memory').removeClass 'active'
        $(this).addClass 'active'
        $(this).parent().parent().children('p').addClass 'active'
        $(this).parent().parent().children('p').find('span').text ''
        $(this).parent().parent().children('p').find('span').addClass 'fa fa-check active'
        return
    # all section checker
    $('.purchase-step-one .col-lg-3.submit').find('a').on 'click', ->
      if !$('.choose-phone .single-phone').hasClass('active') or !$('.choose-carrier .single-carrier').hasClass('active') or !$('.choose-memory .single-memory').hasClass('active')
        return false
      return
    $('.purchase-step-two .col-lg-3.submit').on 'click', ->
      if !$('.condition .col-lg-4').hasClass('active')
        return false
      return
    return

  fbLikeButton = ->
    if $('.social-share-wrap').length
      $('body').prepend '<div id="fb-root"></div>'
      ((d, s, id) ->
        js = undefined
        fjs = d.getElementsByTagName(s)[0]
        if d.getElementById(id)
          return
        js = d.createElement(s)
        js.id = id
        js.src = '//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3&appId=755902611190769'
        fjs.parentNode.insertBefore js, fjs
        return
      ) document, 'script', 'facebook-jssdk'
    return

  twFollowButton = ->
    if $('.social-share-wrap').length
      !((d, s, id) ->
        js = undefined
        fjs = d.getElementsByTagName(s)[0]
        p = if /^http:/.test(d.location) then 'http' else 'https'
        if !d.getElementById(id)
          js = d.createElement(s)
          js.id = id
          js.src = p + '://platform.twitter.com/widgets.js'
          fjs.parentNode.insertBefore js, fjs
        return
      )(document, 'script', 'twitter-wjs')
    return

  googleMap = ->
    if $('#gmap')
      map = undefined
      map = new GMaps(
        div: '#gmap'
        control: false
        lat: -37.812802
        lng: 144.956981)
      map.addMarker
        icon: 'img/map-marker.png'
        lat: -37.812802
        lng: 144.956981
        title: 'Envato HeadQuarter'
    return

  'use strict'
  #Contact Form Validation
  if $('.contact-form').length
    $('.contact-form').validate
      rules:
        name: required: true
        email:
          required: true
          email: true
        subject: required: true
        message: required: true
      submitHandler: (form) ->
        # sending value with ajax request
        $.post $(form).attr('action'), $(form).serialize(), (response) ->
          $(form).parent('div').append response
          $(form).find('input[type="text"]').val ''
          $(form).find('textarea').val ''
          return
        false

  ###*
  * Document ready Event
  ###

  $(document).on 'ready', ->
    clientLogo()
    menuHover()
    serviceHover()
    selectPhoneHover()
    testimonialCarousel()
    sliderAnimation()
    # wowActivation();
    mobileNavJs()
    purchaseToggler()
    fbLikeButton()
    twFollowButton()
    return

  ###*
  * Window Load Event
  ###

  $(window).on 'load', ->

  ###*
  * Window Scroll Event
  ###

  $(window).on 'scroll', ->
    stickyHeader()
    backTotop()
    return
  return
) jQuery

# ---
# generated by js2coffee 2.1.0