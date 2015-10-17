class HeroLinks
  constructor: ($element) ->
    @$links = $element.find(".button")
    @$activeLinks = $element.find(".active")
    @bindEvents()

  bindEvents: ->
    @$links.hover(@add, @remove)

  remove: =>
    $("body").removeClass("active")

  add: =>
    $("body").addClass("active")

$ ->
  new HeroLinks($(".hero-intro__links"))
