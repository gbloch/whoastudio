class Wysiwyg
  constructor: (element, buttons) ->
    @element = $(element)
    @buttons = buttons
    @generateWysiwyg()

  generateWysiwyg: () ->
    @element.editable
      autosave: true
      autosaveInterval: 2500
      buttons: @buttons

class AutoSizingTextarea
  constructor: (element) ->
    @textarea = $(element)
    @span = $("<span>")
    @setup()
    @resize()
    @bindEvents()

  bindEvents: ->
    @textarea.on "keyup, keydown, keypress", =>
      @resize()

  setup: ->
    @span.appendTo(".post_title")
    @span.addClass("title")
    @span.css("visibility", "hidden")

  resize: ->
    @span.html(@textarea.val())
    height = @span.outerHeight()
    if height >= 92
      @textarea.height(height)
      @textarea.scrollTop(0)
   
$ ->
  if $(".admin-posts").length > 0
    new AutoSizingTextarea(".title")
    new Wysiwyg(".wysiwyg", 
      ["undo", "bold", "italic", "underline", "formatBlock", "insertImage"])
