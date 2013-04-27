$(function() {
	$('.chzn-select').chosen()
	$("a[rel=popover]").popover()
	$("a[rel=tooltip]").tooltip()
	$("#ascent-list .table th a, .pagination a").live("click", function() {
		$.getScript(this.href);
		return false;
	});
	$('.best_in_place').best_in_place();
	/*$.datepicker.setDefaults({
	   showOn: 'both',
	   buttonImageOnly: true,
	   buttonImage: 'calendar.gif',
	   buttonText: 'Calendar' });*/
});
