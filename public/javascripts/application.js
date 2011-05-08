// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function read_from_openlibrary(adress, isbn) {
  new Ajax.Request(adress,
    {
      method:'get',
      parameters: {isbn: $("buch_isbn").value},
      onSuccess: function(transport){
        var response = transport.responseText || "no response text";
        if(response === "empty"){alert("Keine Ergebnisse");}
        var json = transport.responseJSON;
        for(var book in json){
          var data = json[book]
          $("buch_titel").value = data.title 
          $("buch_titel").value += " - " + data.subtitle
          $("buch_autor").value = data.authors[0].name
          $("buch_seiten").value = data.number_of_pages
          if(data.published_places){
            $("buch_ort").value = data.published_places[0].name
          }
          $("buch_verlag").value = data.publishers[0].name
          $("buch_jahr").value = data.publish_date
        }
      },
      onFailure: function(){ alert('Something went wrong...') }
    });
  return false; 
}
function read_from_google(adress, query) {
  new Ajax.Request(adress,
    {
      method:'get',
      parameters: {query: query},
      onSuccess: function(transport){
        var response = transport.responseText || "no response text";
        if(response === "empty"){alert("Keine Ergebnisse");}
        var data = transport.responseJSON;
        $("buch_titel").value = data.title 
        $("buch_autor").value = data.author
        $("buch_verlag").value = data.publisher
        $("buch_jahr").value = data.year
        $("buch_inhalt").value = data.description
        $("buch_isbn").value = data.isbn
      },
      onFailure: function(){ alert('Something went wrong...') }
    });
  return false; 
}
function read_from_nacsis(adress, query) {
  new Ajax.Request(adress,
    {
      method:'get',
      parameters: {isbn: query},
      onSuccess: function(transport){
        var response = transport.responseText || "no response text";
        if(response === "empty"){alert("Keine Ergebnisse");}
        var data = transport.responseJSON;
        $("buch_nacsis_japanisch").value = data.nacsis ;
      },
      onFailure: function(){ alert('Something went wrong...') }
    });
  return false; 
}
