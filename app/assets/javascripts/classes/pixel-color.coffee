class @.PixelColor
  constructor: (target) ->
    @post = $(target)
    @_initialize()
    @_postImage()

  _initialize: -> 
    @postImage = @post.find(".post__image")
    @postImageWrapper = @post.find(".post__image-wrapper")

  _postImage: ->
    @image = new Image
    @image.crossOrigin = "anonymous"
    @image.src = @postImage.attr "src"
    @image.onload = =>
      @_paint(@postImageWrapper, @_pixelColor())

  _pixelColor: ->
    @_toRGBA @_pixelData()

  _pixelData: ->
    @canvas = $("<canvas>")[0]
    @context = @canvas.getContext("2d")
    @context.drawImage @image, 0, 0, 200, 200
    @context.getImageData(0, 0, 1, 1).data

  _paint: (element, color) ->
    element.css 
      "background-color": color
      "opacity": 1

  _toRGBA: (data) ->
    "rgba(#{data[0]}, #{data[1]}, #{data[2]}, #{data[3]})"
