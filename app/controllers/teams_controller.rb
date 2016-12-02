get '/trainers/:trainer_id/teams' do
  @trainer = Trainer.find(params[:trainer_id])
  @teams = Team.all
  @pokemons = Pokemon.all
  erb :'teams/index'
end

get '/trainers/:trainer_id/teams/new' do
  @trainer = Trainer.find(params[:trainer_id])
  erb :'teams/new'
end

post '/trainers/:trainer_id/teams' do
  @trainer = Trainer.find(params[:trainer_id])
  @team = Team.new(params[:id])
  p "*" *100
  p @team
  p "*" *100
  if @team.save
    redirect to "/trainers/#{@trainer.id}"
  else
    erb :'teams/new'
  end
end

get '/trainers/:trainer_id/teams/:id' do
  @trainer = Trainer.find(params[:trainer_id])
  @team = Team.find(params[:id])
  erb :'teams/show'
end

get '/trainers/:trainer_id/teams/:id/edit' do
  @trainer = Trainer.find(params[:trainer_id])
  @team = Team.find(params[:id])
  erb :'teams/edit'
end

put '/trainers/:trainer_id/teams/:id' do
  @trainer = Trainer.find(params[:trainer_id])
  @team = Team.find(params[:id])
  if @team.update_attributes(params[:team])
    redirect "/trainers/#{@trainer.id}/teams"
  else
    erb :'teams/edit' #show edit teams view again(potentially displaying errors)
  end
end

delete '/trainers/:trainer_id/teams/:id' do
  @trainer = Trainer.find(params[:trainer_id])
  @team = @trainer.teams.find(params[:id])
  @team.destroy
  redirect "/trainers/#{@trainer.id}/teams"
end
