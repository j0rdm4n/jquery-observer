// Generated by CoffeeScript 1.6.3
(function() {
  $(function() {
    return $('#search').observe(function(form) {
      return $('#searches').append($("<div>" + ($('#search .search').val()) + "</div>"));
    });
  });

}).call(this);
