# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # On click nested reply set correct parent_id on the modal form
  $(".comment .btn-add-nested").click ->
    $("#modal #post_comment_parent_id").val($(".comment").has(this).attr("data-id"))

  # Moving submit() call to the modal save button
  form = $("#modal form")

  form_submit = form.find("input[type='submit']")
  form_submit.hide()

  modal_submit = $("#modal .btn-save")
  modal_submit.text(form_submit.val())

  modal_submit.click ->
    form.submit()
