class StudentController < ApplicationController
  get '/students/:slug' do
    if logged_in?
      @student = Student.find_by_slug(params[:slug])
      erb :'students/show'
    else
      redirect '/'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/study_sessions'
    else
      redirect '/students/signup'
    end
  end

  post '/login' do
    @student = Student.find_by(id: params[:user_id])
    if @student && @student.authenticate(params[:password])
      session[:id] = @student.id
      redirect '/study_sessions'
    else
      redirect '/students/login'
  end

  get '/signup' do
    if logged_in?
      redirect :'/study_sessions/study_session'
    else
      erb :'students/signup'
    end
  end

  post '/signup' do
    @student = Student.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
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
