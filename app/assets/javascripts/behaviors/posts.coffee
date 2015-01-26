$ ->
  hljs.configure useBR: true

  $("code").each (i, block) ->
    hljs.highlightBlock(block)
