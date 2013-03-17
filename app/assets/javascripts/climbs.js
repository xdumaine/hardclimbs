$(function() {
  $("#climb-list .table th a, .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
});