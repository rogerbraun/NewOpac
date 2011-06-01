read_from_google = (address, query) ->
  $.getJSON address, {query: query}, (data) ->
    if data == "empty"
      alert "Leider nichts gefunden"
    else
      $("#buch_titel").attr("value", data.title)
      $("#buch_autor").attr("value", data.author)
      $("#buch_verlag").attr("value", data.publisher)
      $("#buch_jahr").attr("value", data.year)
      $("#buch_inhalt").attr("value", data.description)
      $("#buch_isbn").attr("value", data.isbn)
  false
