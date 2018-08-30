class StudySessionController < ApplicationController
  get '/study_sessions' do
    @study_session = Study_session.all
    if logged_in?
      erb :'study_sessions/study_sesion'
    else
      redirect '/login'
    end
  end

  get '/study_session/new' do
    if logged_in?
      erb :'study_sessions/new_study_session.erb'
    else
      redirect '/login'
    end
  end

  get '/study_session/:id' do
    if logged_in/
      @study_session = Study_session.find_by(id: params[:id])
      erb :'study_sessions/study_session'
    else
      redirect '/login'
    end
  end

end
