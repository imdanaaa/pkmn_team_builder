get '/teams/:team_id/pokemons' do
  @team = Team.find(params[:team_id])
  @pokemons = Pokemon.all
  erb :'pokemons/index'

end

get '/teams/:team_id/pokemons/new' do
  @team = Team.find(params[:team_id])
  @pokemon = Pokemon.new
  if request.xhr?
    erb :'teams/_new_pokemon_form', {layout:false, locals: {pokemon: @pokemon}}
  else
    erb :'pokemons/new'
  end
end

post '/teams/:team_id/pokemons' do
  @team = Team.find(params[:team_id])
  @pokemon = Pokemon.new(params[:pokemon])
  if @pokemon.save && request.xhr?
    redirect "/teams/#{@team.id}/pokemons"
  else
    erb :'pokemons/new' #show new pokemons view again(potentially displaying errors)
  end
end
