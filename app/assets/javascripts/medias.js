$(function() {
	$('.chzn-select').chosen()
	$("a[rel=popover]").popover()
	$("a[rel=tooltip]").tooltip()
    $("#media-list .table th a, .pagination a").live("click", function() {
      $.getScript(this.href);
      return false;
    });
});