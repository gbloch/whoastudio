$ ->
  if $(".admins-posts").length > 0
    new AutoSizingTextarea(".title")
    new Wysiwyg(".wysiwyg",
      ["undo", "bold", "italic", "underline", "formatBlock",
       "insertUnorderedList", "insertImage", "createLink", "html"])
