$('[rel=tooltip]').tooltip()
$(function() {
  $("#area-list .table th a, .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
});