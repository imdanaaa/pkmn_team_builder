helpers do


  def current_trainer
    @current_trainer ||= Trainer.find(session[:id]) if session[:id]
  end

  def logged_in?
    current_trainer
  end

  def login(trainer)
    session[:id] = @trainer.id
  end

  def logout
    session[:id] = nil
  end
end
