
$(function (){

    "use strict";

    var wind = $(window);


    //smooth scroll
    $('.local-nav .navbar-nav').singlePageNav({
        speed:1000,
        currentClass:'active',
        offset:60
    });


    // navbar scrolling background
    wind.on("scroll",function () {

        var bodyScroll = wind.scrollTop(),
            navbar = $(".navbar-custom");

        if(bodyScroll > 100){

            navbar.addClass("fixed-top-nav");

        }else{

            navbar.removeClass("fixed-top-nav");
        }
    });


    /* ======= Navbar for Desktop and Mobile Devices ======= */
    (function () {

        var navbar      = $('.navbar-custom'),
            width       = Math.max($(window).width(), window.innerWidth),
            mobileTest;

        if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
            mobileTest = true;
        }

        navbarSubmenu(width);
        hoverDropdown(width, mobileTest);

        $(window).resize(function() {
            var width = Math.max($(window).width(), window.innerWidth);
            hoverDropdown(width, mobileTest);
        });

        /* ---------------------------------------------- /*
         * Navbar submenu
        /* ---------------------------------------------- */

        function navbarSubmenu(width) {
            if (width > 767) {
                $('.navbar-custom .navbar-nav > li.dropdown').hover(function() {
                    var MenuLeftOffset  = $('.dropdown-menu', $(this)).offset().left;
                    var Menu1LevelWidth = $('.dropdown-menu', $(this)).width();
                    if (width - MenuLeftOffset > Menu1LevelWidth * 2) {
                        $(this).children('.dropdown-menu').css( {'right': 'auto', 'left': '0'});
                    } else {
                        $(this).children('.dropdown-menu').css( {'right': '0', 'left': 'auto'});
                    }
                    if ($('.dropdown', $(this)).length > 0) {
                        var Menu2LevelWidth = $('.dropdown-menu', $(this)).width();
                        if (width - MenuLeftOffset - Menu1LevelWidth < Menu2LevelWidth) {
                            $(this).children('.dropdown-menu').addClass('left-side');
                        } else {
                            $(this).children('.dropdown-menu').removeClass('left-side');
                        }
                    }
                });
            }
        }


        /* ---------------------------------------------- /*
         * Navbar hover dropdown on desctop
        /* ---------------------------------------------- */

        function hoverDropdown(width, mobileTest) {
            if ((width > 767) && (mobileTest !== true)) {
                $('.navbar-custom .navbar-nav > li.dropdown, .navbar-custom li.dropdown > ul > li.dropdown').removeClass('open');
                var delay = 0;
                var setTimeoutConst;
                $('.navbar-custom .navbar-nav > li.dropdown, .navbar-custom li.dropdown > ul > li.dropdown').hover(function() {
                    var $this = $(this);
                    setTimeoutConst = setTimeout(function() {
                        $this.addClass('open');
                        $this.find('.dropdown-toggle').addClass('disabled');
                    }, delay);
                },
                function() {
                    clearTimeout(setTimeoutConst);
                    $(this).removeClass('open');
                    $(this).find('.dropdown-toggle').removeClass('disabled');
                });
            } else {
                $('.navbar-custom .navbar-nav > li.dropdown, .navbar-custom li.dropdown > ul > li.dropdown').unbind('mouseenter mouseleave');
                $('.navbar-custom [data-toggle=dropdown]').not('.binded').addClass('binded').on('click', function(event) {
                    event.preventDefault();
                    event.stopPropagation();
                    $(this).parent().siblings().removeClass('open');
                    $(this).parent().siblings().find('[data-toggle=dropdown]').parent().removeClass('open');
                    $(this).parent().toggleClass('open');
                });
            }
        }

        /* ---------------------------------------------- /*
         * Navbar collapse on click
        /* ---------------------------------------------- */

        $(document).on('click','.navbar-collapse.in',function(e) {
            if( $(e.target).is('a') && $(e.target).attr('class') != 'dropdown-toggle' ) {
                $(this).collapse('hide');
            }
        });

    }());


    // owlCarousel
    $('.clients .owl-carousel, .blocks .owl-carousel, .shop-items .owl-carousel').owlCarousel({
        items:1,
        loop:true,
        mouseDrag:false,
        autoplay:true,
        smartSpeed:500
    });

    $('.slider-nav .owl-carousel').owlCarousel({
        items:1,
        loop:true,
        mouseDrag:false,
        autoplay:true,
        smartSpeed:500,
        dots:false,
        nav:true,
        navText:['<span> <i class="fa fa-chevron-left" aria-hidden="true"></i> </span>',
        '<span> <i class="fa fa-chevron-right" aria-hidden="true"></i> </span>']
    });



     // accordion
    $(".accordion").on("click",".accordion-icon", function () {

        $(this).next().slideDown();

        $(".accordion-info").not($(this).next()).slideUp();

    });



    // typejs
    $('.caption .typed span').typed({
        strings: ["DESIGN","THINKING"],
        loop: true,
        typeSpeed:50,
        startDelay: 1000,
        backDelay: 2000
    });


    //smooth button scroll
    $('.button-scroll').on('click', function(){
      
        var scrollTo = $(this).attr('data-scrollTo');

        $('body, html').animate({

        "scrollTop": $('#'+scrollTo).offset().top - 60
        }, 1000 );

    });


    // progress bar
    wind.on('scroll', function () {
        $(".progress-main .progress-bar").each(function () {
            var bottom_of_object = 
            $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = 
            $(window).scrollTop() + $(window).height();
            var myVal = $(this).attr('data-value');
            if(bottom_of_window > bottom_of_object) {
                $(this).css({
                  width : myVal
                });
            }
        });
    });



    // YouTubePopUp
    $("a.vid").YouTubePopUp();


    // magnificPopup
    $('.portfolio').magnificPopup({
      delegate: 'a',
      type: 'image'
    });


    // stellar
    wind.stellar();


    // counterUp
    $('.numbers .counter').counterUp({
        delay: 10,
        time: 1500
    });


    // isotope
    $('.gallery').isotope({
      // options
      itemSelector: '.item-img'
    });

    var $gallery = $('.gallery').isotope({
      // options
    });

    // filter items on button click
    $('.filtering').on( 'click', 'span', function() {

        var filterValue = $(this).attr('data-filter');

        $gallery.isotope({ filter: filterValue });

    });

    $('.filtering').on( 'click', 'span', function() {

        $(this).addClass('active').siblings().removeClass('active');

    });


    // textillate
    $('.tlt').textillate({
        loop:true
    });


});


// Preloader

$(window).on("load",function (){


    // loading page
    $(".loading").fadeOut(500);


     // contact form
    $('#contact-form').validator();

    $('#contact-form').on('submit', function (e) {
        if (!e.isDefaultPrevented()) {
            var url = "contact.php";

            $.ajax({
                type: "POST",
                url: url,
                data: $(this).serialize(),
                success: function (data)
                {
                    var messageAlert = 'alert-' + data.type;
                    var messageText = data.message;

                    var alertBox = '<div class="alert ' + messageAlert + ' alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + messageText + '</div>';
                    if (messageAlert && messageText) {
                        $('#contact-form').find('.messages').html(alertBox);
                        $('#contact-form')[0].reset();
                    }
                }
            });
            return false;
        }
    });

});