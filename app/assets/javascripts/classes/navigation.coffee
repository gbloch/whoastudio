class Navigation
  constructor: (selector) ->
    @navigation = $(selector)
    @body = $("body")
    @navigationTrigger = @navigation.find(".navigation__trigger")

    @_changeTriggerContentsColor()
    @_bindEvents()

  _bindEvents: ->
    $(window).on("scroll", @_changeTriggerContentsColor)
    @navigationTrigger.on "click", (event) =>
      event.preventDefault()
      @body.toggleClass "expanded"

  _changeTriggerContentsColor: =>
    if $(window).scrollTop() > $(window).height() - 22
      @navigationTrigger.addClass("dark")
    else
      @navigationTrigger.removeClass("dark")

$ ->
  new Navigation(".navigation")
