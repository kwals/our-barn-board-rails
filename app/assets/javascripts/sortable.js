$(document).ready(function () {
    // Custom sorting plugin // --- No Need to edit this ---\\
    (function ($) {
        $.fn.sorted = function (customOptions) {
            var options = {
                reversed: false,
                by: function (a) { return a.text(); }
            };
            $.extend(options, customOptions);
            $data = $(this);
            arr = $data.get();
            arr.sort(function (a, b) {
                var valA = options.by($(a));
                var valB = options.by($(b));
                if (options.reversed) {
                    return (valA < valB) ? 1 : (valA > valB) ? -1 : 0;
                } else {
                    return (valA < valB) ? -1 : (valA > valB) ? 1 : 0;
                }
            });
            return $(arr);
        };
    })(jQuery);

    var $gird = $("#fantom-portfolio-items"),
    $filterOptions = $('#fantom-portfolio-nav');
    var $btns = $filterOptions.children();
    var opts = {
        speed: 550,
    };
    $gird.shuffle(opts);
    $gird.shuffle('shuffle', 'all');
    $btns.click(function () {
        var $this = $(this),
            group = $this.data('group');
        $gird.shuffle('shuffle', group);
    });
});

//---------------------------------------- EDIT BELOW ------------------------------\\
/**
  // Filter Handler 
  var $filter = $('#fantom-portfolio-nav a');

  // define portfolio "#div" with the portfolio list ( li ) elements in 
  var $portfolio = $('#fantom-portfolio #fantom-portfolio-items');

  // clone the "#div"
  var $data = $portfolio.clone();

  // attempt to call Quicksand on every click event handler 
  $filter.click(function(e) {
  
	//check if the title attr is set to "all"
    if ($($(this)).attr("title") == 'all') {
	
		//if all then show all list ( li )
      var $filteredData = $data.find('li');
	  
    } else {
	
		//get the title attribute dynamically using $(this)
      var $filteredData = $data.find('li[data-type=' + $($(this)).attr("title") + ']');

    }
    // finally, call quicksand and dump the $fileredData in
    $portfolio.quicksand($filteredData, {
      duration: 800,
      easing: 'easeInOutQuad',
      
    });

  });
});
**/
