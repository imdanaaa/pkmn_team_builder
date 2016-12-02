include HTTParty

helpers do
  def get_pokemon(name)
    pokemon = HTTParty.get(
      "http://pokeapi.co/api/v2/pokemon/#{name}"
      ).body
  pokemon = JSON.parse(pokemon)
  pokemon["forms"][0]["name"] = pokemon_name
  pokemon_name
  end

  def get_pokemon_sprite(name)
     pokemon = HTTParty.get(
      "http://pokeapi.co/api/v2/pokemon/#{name}"
      ).body
    pokemon = JSON.parse(pokemon)
    pokemon["sprites"]["front_default"] = pokemon_sprite
    pokemon_sprite
  end
end
