/*=============================================== CAROUSEL ===============================================*/
$(window).load(function() {
 if ($('.fantom-testimonial-carousel')) {
  $('.fantom-testimonial-carousel').each(

  function() {
   var $this = $(this);
   var $items = $this.find('.fantom-list-testimonial').data('items');
   $this.find('.fantom-list-testimonial').carouFredSel({
    auto: false,
    prev: {
     button: function() {
      return $this.find('a.prev');
     }
    },
    next: {
     button: function() {
      return $this.find('a.next');
     }
    },
    responsive: true,
    scroll: 1,
    width: '100%',
    height: 'auto',
    items: $items,
    swipe: {
     onMouse: true,
     onTouch: true
    }
   });
  })
 };
 if ($('.fantom-carousel')) {
  $('.fantom-carousel').each(

  function() {
   var $this = $(this);
   var $items = $this.find('.fantom-list-partner').data('items');
   $this.find('.fantom-list-partner').carouFredSel({
    auto: false,
    prev: {
     button: function() {
      return $this.find('a.prev');
     }
    },
    next: {
     button: function() {
      return $this.find('a.next');
     }
    },
    responsive: true,
    scroll: 1,
    width: '100%',
    height: 'auto',
    items: $items,
    swipe: {
     onMouse: true,
     onTouch: true
    }
   });
  })
  $(".thumb-product-img img").click(function () {
  	var img = $(this).attr('src');
    $(".wrap-product-img img").attr('src', img);
  });
         
 $("#zoom-img").elevateZoom({
			zoomWindowFadeIn: 500,
			zoomWindowFadeOut: 500,
			lensFadeIn: 500,
			lensFadeOut: 500,
			easing : true
});

 };
 $(function() {
  $("#fantomshop-slider-bar").slider({
   range: true,
   min: 0,
   max: 500,
   values: [0, 500],
   slide: function(event, ui) {
    $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
   }
  });
  $("#amount").val("$" + $("#fantomshop-slider-bar").slider("values", 0) + " - $" + $("#fantomshop-slider-bar").slider("values", 1));
 });
});

function imagesCarousel() {
 $(".fantom-images-carousel-item").carouFredSel({
  auto: true,
  circular: true,
  prev: 'a.prev',
  next: 'a.next',
  responsive: true,
  scroll: 1,
  width: '100%',
  height: 'auto',
  swipe: {
   onMouse: true,
   onTouch: true
  }
 });
};

/*=============================================== LAYER SLIDER AND PARALLAX ===============================================*/

function imageParallax() {
 $('.fantom-parallax').parallax("50%", 0.3);
};

function layerSlider() {
 $('#camera_wrap_4').camera({
  thumbnails: false,
  loader: 'bar',
  startWidth: 1170,
 });
}; 

/*=============================================== WINDOW LOAD FUNTION ===============================================*/

$(window).load(function() {

 $(window).bind('scroll', function(e) {
  headerScroll();
 });
 imagesCarousel();
 //navHover();
 initElementsAnimation();
 //partnerCarousel();
 //testimonialCarousel();
 initProgressBars();
 initpiechart1();
 initpiechart2();
 initpiechart3();
 initCounter();
 imageParallax();
 layerSlider()
});

/*=============================================== ELEMENTS ANIMATION ===============================================*/
var bMobile;  // true if in mobile mode
// Initiate event handlers
function navHover() {
  // .navbar-toggle is only visible in mobile mode
  bMobile = $('.navbar-toggle').is(':visible');
  var oMenus = $('.navbar-nav .dropdown'),
    nTimer;
  if (bMobile) {
    // Disable hover events for mobile
    oMenus.off();
  } else {
    // Set up menu hover for desktop mode
    oMenus.on({
      'mouseenter touchstart': function() {
        event.preventDefault();
        clearTimeout(nTimer);
        oMenus.removeClass('open');
        $(this).addClass('open');
      },
      'mouseleave': function() {
        nTimer = setTimeout(function() {
          oMenus.removeClass('open');
        }, 500);
      }
    });
  }
}
$(window).resize(navHover);
$(window).resize(imagesCarousel);
/*=============================================== ELEMENTS ANIMATION ===============================================*/

function initElementsAnimation() {
 if ($(".animated").length > 0) {
  $(".animated").each(function() {
   var $this = $(this);
   $this.appear(function() {
    $this.addClass("go");
   }, {
    accX: 0,
    accY: -200
   });
  })
 };
} 
/*=============================================== PROGRESS BAR ===============================================*/

function initProgressBars() {
 if ($('.fantom-progress').length > 0) {
  $('.fantom-progress').each(function() {
   var $this = $(this);
   $this.appear(function() {
    var $percentage = $this.find('.progress-bar').data('precentage');
    $this.find('.progress-bar').animate({
     'width': $percentage + '%'
    }, {
     duration: 1000,
     easing: 'swing',
    }), 'slow';
    $this.find('.progress-value').countTo({
     from: 0,
     to: $percentage,
     speed: 1300,
     refreshInterval: 50
    })
   }, {
    accX: 0,
    accY: -100
   })
  })
 };
}

/*=============================================== PIECHART ===============================================*/

function initpiechart1() {
 if ($('.fantom-chart-1').length > 0) {
  $('.fantom-chart-1').appear(function() {
   $(this).easyPieChart({
    easing: 'easeOutBounce',
    size: 230,
    lineWidth: 25,
    barColor: "#00CDAB",
    lineCap: 'circle',
    scaleColor: false,
    onStep: function(from, to, percent) {
     $(this.el).find('.percent').text(Math.round(percent));
    }
   });
  }, {
   accX: 0,
   accY: -100
  });
 };
}

function initpiechart2() {
 if ($('.fantom-chart-2').length > 0) {
  $('.fantom-chart-2').appear(function() {
   $(this).easyPieChart({
    easing: 'easeOutBounce',
    size: 230,
    lineWidth: 25,
    barColor: "#FFD633",
    lineCap: 'circle',
    scaleColor: false,
    onStep: function(from, to, percent) {
     $(this.el).find('.percent').text(Math.round(percent));
    }
   });
  }, {
   accX: 0,
   accY: -100
  });
 };
}

function initpiechart3() {
 if ($('.fantom-chart-3').length > 0) {
  $('.fantom-chart-3').appear(function() {
   $(this).easyPieChart({
    easing: 'easeOutBounce',
    size: 230,
    lineWidth: 25,
    barColor: "#FF4D4D",
    lineCap: 'circle',
    scaleColor: false,
    onStep: function(from, to, percent) {
     $(this.el).find('.percent').text(Math.round(percent));
    }
   });
  }, {
   accX: 0,
   accY: -100
  });
 };
}

/*=============================================== COUNTER ===============================================*/

function initCounter() {
 "use strict";
 if ($(".fantom-counter").length > 0) {
  $(".fantom-counter").each(function() {
   var $this = $(this);
   var $start = $this.data('start');
   var $end = $this.data('end');
   $this.appear(function() {
    $this.find('.count').countTo({
     from: $start,
     to: $end,
     speed: 2000,
     refreshInterval: 50
    })
   }, {
    accX: 0,
    accY: -100
   });
  });
 }
} /*=============================================== HEADER ANIMATION ===============================================*/

function headerScroll() {
 "use strict";
 var changeNavigationOn = 80;
 var sy = scrollY();
 // console.log($(window).innerWidth());
 if ($(window).innerWidth() > 991) {
  if (sy >= changeNavigationOn) {
   // console.log("ON");
   $("#header").removeClass('changeHeaderOn');
  } else {
   $("#header").removeClass('changeHeaderOn');
  }
  if (sy >= 10) {
   $("#header").addClass('changeHeaderOn');
  }
 }
}

function scrollY() {
 "use strict";
 return window.pageYOffset || document.documentElement.scrollTop;
}