$.fn.stripe = function() {
	$(this).each(function() {
		$c = $(this)
		if ($c.is(":first-child"))
		  $c.addClass("first");
		if ($c.is(":last-child"))
		  $c.addClass("last");
		if ($c.is(":nth-child(even)"))
		  $c.addClass("alt");
	});
	return $(this);
}

function stripe() {
  $('tr, ul.list li, .list-weights tr td').stripe();
}
$(function () {
  stripe();

  $(document).bind("ajaxSend", function(){
    $("#item-form-container").toggleClass('loading');
  });
});
