jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $("#create_new_label").click (e) ->
    e.stopPropagation()
    $("#add_new_label").toggle()
    $("#select_label").toggle()
    return
