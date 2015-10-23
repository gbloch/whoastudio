class FlexibleTextArea
  constructor: (element) ->
    @$element = $(element)
    @_bindEvents()

  _bindEvents: ->
    @$element.flexible()
    @$element.on("keyup", "updateHeight")

$ ->
  $("[data-flexible-textarea]").each ->
    new FlexibleTextArea(@)
