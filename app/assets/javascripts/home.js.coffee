$(document).on "submit", "form[name=upvote-form]", ->
  form = $(this)
  $.post "/vote", $(this).serialize(), (data) ->
    form.find("input").addClass "disabled"
    $("#vote-count-".concat(form.find("#question_id").attr('value'))).html data['votes']
    return

  return
