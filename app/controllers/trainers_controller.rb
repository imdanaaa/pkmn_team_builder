
# TRAINERS INDEX
get '/trainers' do
  @trainers = Trainer.all
  erb :'/trainers/index'
end

# TRAINERS NEW
get '/trainers/new' do
  erb :'/trainers/new'
end

# TRAINERS CREATE
post '/trainers' do

  # if params[:password_confirmation] == params[:trainer][:password]
    @trainer = Trainer.new(params[:trainer])

    if @trainer.save
      session[:id] = @trainer.id
      redirect "/"
    else
      @errors = @trainer.errors.full_messages
      erb :'trainers/new'
    end

  # else
  #   @errors = ["Passwords do not match!"]
  #   erb :'trainers/new'
  # end

end

# TRAINERS SHOW
get '/trainers/:trainer_id' do
  @trainer = Trainer.find(params[:trainer_id])
  erb :'trainers/show'
end

# TRAINERS EDIT
get '/trainers/:id/edit' do
  @trainer = Trainer.find(params[:trainer_id])
  erb :'trainers/edit'
end


# TRAINERS UPDATE
put '/trainers/:id' do
  @trainer = Trainer.find(params[:trainer_id])
  @trainer.update(params[:trainer])
  redirect "/trainers/#{@trainer.id}"
end


# TRAINERS DESTROY
delete '/trainers/:id' do
  @trainer = Trainer.find(params[:trainer_id])
  @trainer.destroy
  redirect "/trainers"
end
