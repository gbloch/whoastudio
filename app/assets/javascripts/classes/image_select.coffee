$ ->
  $("[data-image-select-trigger]").on "click", ->
    $("[data-image-select]").trigger( "click" );
