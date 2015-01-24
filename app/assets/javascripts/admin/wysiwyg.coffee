class @Wysiwyg
  constructor: (element, buttons) ->
    @element = $(element)
    @buttons = buttons
    @generateWysiwyg()

  generateWysiwyg: () ->
    @element.editable
      autosave: true
      autosaveInterval: 2500
      buttons: @buttons
