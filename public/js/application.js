$(document).ready(function() {
  addPokemonButtonListener();
});

var addPokemonButtonListener = function(){
  $("#new_pokemon_form").on("submit", function(event){
    event.preventDefault();
    var $this = $(this);
    var method = $this.attr("method");
    var url = $this.attr("action");
    var data = $this.serialize();

    $.ajax({
      url: url,
      method: method,
      data: data
    }).done(function(response){
      $this[0].reset();
      $("#team_members").prepend(response);
    })
  })
}
