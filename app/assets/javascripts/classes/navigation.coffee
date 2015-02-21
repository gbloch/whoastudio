class Navigation
  constructor: (selector) ->
    @csrfToken = $("meta[name='csrf-token']").attr("content")

    @navigation = $(selector)
    @main = $(".layout-main")
    @navigationTrigger = @navigation.find(".navigation__trigger")
    @navigationDrawer = @navigation.find(".navigation__drawer")
    @_bindEvents()

  _bindEvents: ->
    @navigationTrigger.on "click", (event) =>
      event.preventDefault()
      @main.toggleClass "expanded"
      @navigationTrigger.toggleClass "expanded"
      @navigationDrawer.toggleClass "expanded"
      @_setSession()

  _setSession: ->
    if @navigationTrigger.hasClass("expanded")
      @_ajax("expanded")
    else
      @_ajax("")

  _ajax: (data) =>
    $.ajax
      type: "post"
      url: "/set_navigation_state_session"
      data: 
        navigation_state: data
      beforeSend: (xhr) ->
        xhr.setRequestHeader('X-CSRF-Token', @csrfToken)

$ ->
  new Navigation(".navigation")
