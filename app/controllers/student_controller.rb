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
      redirect :'/study_sessions/study_session'
    else
      erb :'students/login'
    end
  end

  get '/signup' do
    if logged_in?
      redirect :'/study_sessions/study_session'
    else
      erb :'students/signup'
    end
  end


end
