$(function() {
	$('.chzn-select').chosen()
	$("a[rel=popover]").popover()
	$("a[rel=tooltip]").tooltip()
	//$('.still-hard-tooltip').tooltip()
    $("#climb-list .table th a, .pagination a").on("click", function() {
      $.getScript(this.href);
      return false;
    });
});
