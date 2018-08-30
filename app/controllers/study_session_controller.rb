class StudySessionController < ApplicationController
  get '/study_sessions' do
    @study_session = Study_session.all
    if logged_in?
      erb :'study_sessions/study_sesion'
    else
      redirect '/login'
    end
  end
end
