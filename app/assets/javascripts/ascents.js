$(function() {
	$('.chzn-select').chosen()
	$("a[rel=popover]").popover()
	$("a[rel=tooltip]").tooltip()
	$("#ascent-list .table th a, .pagination a").on("click", function() {
		$.getScript(this.href);
		return false;
	});
	$('.best_in_place').best_in_place();
	/*$.datepicker.setDefaults({
	   showOn: 'both',
	   buttonImageOnly: true,
	   buttonImage: 'calendar.gif',
	   buttonText: 'Calendar' });*/
	   
	$('#ascent_date_2i').change(function() {
		$('#ascent_date_end_2i').val($(this).val())
	});
	$('#ascent_date_3i').change(function() {
		$('#ascent_date_end_3i').val($(this).val())
	});
	$('#ascent_date_1i').change(function() {
		$('#ascent_date_end_1i').val($(this).val())
	});
});
