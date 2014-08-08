class WelcomePageBackgroundImage
  constructor: ->
    @image = $(".hero-image")
    @_centerImage()
    @_bindEvents()

  _bindEvents: ->
    $(window).on "resize", =>
      @_centerImage()

  _centerImage: ->
    top = @_getTop()
    console.log top
    @image.css("top": -top)

  _getTop: =>
    imageHeight = @image.outerHeight()
    windowHeight = $(window).height()

    if(windowHeight < imageHeight - 100)
      (imageHeight - windowHeight) / 2
    else
      0

$ ->
  if $(".welcome-index").length > 0
    new WelcomePageBackgroundImage()
