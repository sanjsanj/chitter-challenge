class Chitter

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate params[:email], params[:password]
    if user
      session[:user_id] = user.id
      session[:user_name] = user.user_name
      session[:user_handle] = user.user_handle
      redirect to '/'
    else
      flash[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    erb :'sessions/goodbye'
  end

end
