# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

form_selector = "#user-create-form"

$(document).on "click", ".js_submit_btn", (event) ->
  # $(form_selector)[0].submit()だとajax通信ではなく、通常の通信になるため、
  # Rails.fireを使う。第一引数はsubmit対象のform要素を指定する。
  # https://www.bokukoko.info/entry/2017/12/22/194327
  Rails.fire($(form_selector)[0], "submit")

$(document).on "ajax:success", form_selector, (event) ->
  json_str = JSON.stringify(event.detail[0])
  $(".output_success > ul").append("<li>#{json_str}</li>")

$(document).on "ajax:error", form_selector, (event) ->
  json_str = JSON.stringify(event.detail[2])
  $(".output_error > ul").append("<li>#{json_str}</li>")

