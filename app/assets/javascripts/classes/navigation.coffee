class Navigation
  constructor: (selector) ->
    @csrfToken = $("meta[name='csrf-token']").attr("content")

    @navigation = $(selector)
    @body = $("body")
    @navigationTrigger = @navigation.find(".navigation__trigger")
    @_bindEvents()

  _bindEvents: ->
    @navigationTrigger.on "click", (event) =>
      event.preventDefault()
      @body.toggleClass "expanded"
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
