get '/sessions/new' do
  erb :'sessions/new'
end


post '/sessions' do
  @trainer = Trainer.find_by_email(params[:email])
  #if this works, we login the trainer with helper method
  if @trainer && @trainer.password == params[:password]
    # session[:id] = @trainer.id
    login(@Trainer)
    redirect '/'

  else
    @errors = ["Trainer name && Password not found."]
    erb :'sessions/new'
  end
end



# delete '/sessions/:id' do
delete '/sessions' do
  # session[:id] = nil
  #helper method
  logout
  redirect '/'
end
