class @.Posts
  constructor: (target) ->
    @post = $(target)
    @_decorateCodeElements()

  _decorateCodeElements: ->
    hljs.configure useBR: true

    @post.find("code").each (i, block) ->
      hljs.highlightBlock(block)

$ ->
  $("article.post").each ->
    new Posts(@)

  #crossOrigin
  #http://stackoverflow.com/questions/18474727/canvas-has-been-tainted-by-cross-origin-data-work-around
