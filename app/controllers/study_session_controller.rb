class StudySessionController < ApplicationController

  get '/study_sessions' do
    if logged_in?
      erb :'study_sessions/study_sessions'
    else
      redirect '/login'
    end
  end

  get '/study_sessions/new_study_session' do
    if logged_in?
      erb :'study_sessions/new_study_session'
    else
      redirect '/login'
    end
  end

  post '/study_sessions' do
    if params[:date].empty? || params[:hours].empty? || params[:summary].empty?
      flash[:message] = "Error. Please fill out all fields and try again."
      redirect '/study_sessions/new_study_session'
    else
      @study_session = StudySession.new(date: params[:date], hours: params[:hours], summary: params[:summary])
      @study_session.student = current_student
      @study_session.save
      flash[:message] = "Success. Study session created."
      redirect "/study_sessions/#{@study_session.id}"
    end
  end

  get '/study_sessions/:id' do
    if logged_in?
      @study_session = StudySession.find_by(id: params[:id])
      erb :'study_sessions/show_study_session'
    else
      redirect '/login'
    end
  end

  get '/study_sessions/:id/edit' do
    if logged_in?
      @study_session = StudySession.find_by(id: params[:id])
      erb :'study_sessions/edit_study_session'
    else
      redirect '/login'
    end
  end

  patch '/study_sessions/:id' do
    if params[:date].empty? || params[:hours].empty? || params[:summary].empty?
      flash[:message] = "Error. Please fill out all fields and try again."
      redirect "/study_sessions/#{@study_session.id}/edit"
    else
      if @study_session && @study_session.student.id == curent_student.id
        @study_session = StudySession.find_by(id: params[:id])
        @study_session.update(date: params[:date], hours: params[:hours], summary: params[:summary])
        @study_session.student = current_student
        @study_session.save
        redirect "/study_sessions/#{@study_session.id}"
      else
        redirect "/my_study_sessions"
      end
    end
  end

  delete '/study_sessions/:id' do
    @study_session = StudySession.find_by(id: params[:id])
    if logged_in?
      if @study_session && @study_session.student == current_student
        @study_session.delete
      end
      flash[:message] = "Success. Study session has been deleted."
      redirect '/study_sessions'
    else
      redirect '/login'
    end
  end

end
