class AdminNavigation
  constructor: ->
    @adminBody = $("#admin")
    @csrfToken = $("meta[name='csrf-token']").attr("content")
    @navigationTrigger = $(".hamburger-icon")
    @sideNavigation = $(".side-navigation")
    @_bindEvents()

  _bindEvents: ->
    @navigationTrigger.on "click", =>
      @navigationTrigger.toggleClass "expanded"
      @sideNavigation.toggleClass "expanded"
      @adminBody.toggleClass "expanded"
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

if $("#admin").length > 0
  new AdminNavigation()

