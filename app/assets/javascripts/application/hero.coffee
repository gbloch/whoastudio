class HeroLinks
  constructor: ($element) ->
    @$links = $element.find(".button")
    @$activeLinks = $element.find(".active")
    @bindEvents()

  bindEvents: ->
    @$links.hover(@remove, @add)

  remove: =>
    @$activeLinks.removeClass("active")

  add: =>
    @$activeLinks.addClass("active")
    
$ ->
  new HeroLinks($(".hero-intro__links"))
