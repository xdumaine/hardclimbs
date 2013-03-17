$(function() {
  $("#climber-list .table th a, .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#ascent-list .table th a, .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
});
