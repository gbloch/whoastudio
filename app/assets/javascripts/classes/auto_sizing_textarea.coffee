class @AutoSizingTextarea extends Whoa
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
    if height >= 82
      @textarea.height(height)
      @textarea.scrollTop(0)
