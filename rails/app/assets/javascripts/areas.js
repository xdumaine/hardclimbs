$(function() {
	$(".chzn-select").chosen()
	$("a[rel=popover]").popover()
	$("a[rel=tooltip]").tooltip()
    $("#area-list .table th a, .pagination a").on("click", function() {
      $.getScript(this.href);
      return false;
    });
});
