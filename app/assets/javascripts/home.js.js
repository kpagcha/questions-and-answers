// Generated by CoffeeScript 1.8.0
(function() {
  $(document).on("submit", "form[name=upvote-form]", function() {
    var form;
    form = $(this);
    $.post("/vote", $(this).serialize(), function(data) {
      form.find("input").addClass("disabled");
      $("#vote-count-".concat(form.find("#question_id").attr('value'))).html(data['votes']);
    });
  });

}).call(this);
