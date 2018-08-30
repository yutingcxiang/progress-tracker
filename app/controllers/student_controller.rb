class StudentController < ApplicationController
  get '/my_study_sessions' do
    if logged_in?
      @student = Student.find_by(id: params[:id])
            binding.pry
      erb :'students/my_study_sessions'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/study_sessions'
    else
      erb :'students/login'
    end
  end

  post '/login' do
    @student = Student.find_by(username: params[:username])
    if @student && @student.authenticate(params[:password])
      session[:user_id] = @student.id
      redirect '/study_sessions'
    else
      redirect '/login'
    end
  end

  get '/signup' do
    if logged_in?
      redirect '/study_sessions'
    else
      erb :'students/signup'
    end
  end

  post '/signup' do
    @student = Student.new(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    if @student.save
      session[:user_id] = @student.id
      redirect '/study_sessions'
    else
      redirect '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/'
    else
      redirect '/'
    end
  end
end
