class StudySessionController < ApplicationController

  get '/study_sessions' do
    if logged_in?
      erb :'study_sessions/study_sessions'
    else
      redirect '/login'
    end
  end

  get '/my_study_sessions/new' do
    if logged_in?
      erb :'study_sessions/new_study_session'
    else
      redirect '/login'
    end
  end

  post '/my_study_sessions' do
    if params[:date].empty? || params[:hours].empty? || params[:summary].empty?
      flash[:message] = "Error. Please fill out all fields and try again."
      redirect '/my_study_sessions/new'
    else
      @study_session = StudySession.new(date: params[:date], hours: params[:hours], summary: params[:summary])
      @study_session.student = current_student
      @study_session.save
      flash[:message] = "Success. Study session created."
      redirect "/my_study_sessions/#{@study_session.id}"
    end
  end

  get '/my_study_sessions/:id' do
    if logged_in?
      @study_session = StudySession.find_by(id: params[:id])
      erb :'study_sessions/show_study_session'
    else
      redirect '/login'
    end
  end

  get '/my_study_sessions/:id/edit' do
    if logged_in?
      @study_session = StudySession.find_by(id: params[:id])
      session[:study_session_id] = @study_session.id
      if @study_session && @study_session.student.id == current_student.id
        erb :'study_sessions/edit_study_session'
      else
        redirect '/login'
      end
    end
  end

  patch '/my_study_sessions/:id' do
    if params[:date].empty? || params[:hours].empty? || params[:summary].empty?
      flash[:message] = "Error. Please fill out all fields and try again."
      redirect "/my_study_sessions/#{@study_session.id}/edit"
    else
      @study_session = StudySession.find_by(id: params[:id])
      if params[:id].to_i == current_study_session
        @study_session.update(date: params[:date], hours: params[:hours], summary: params[:summary])
        @study_session.student = current_student
        @study_session.save
        redirect "/my_study_sessions/#{@study_session.id}"
      else
        redirect '/my_study_sessions'
      end
    end
  end

  delete '/my_study_sessions/:id' do
    @study_session = StudySession.find_by(id: params[:id])
    if logged_in?
      if @study_session && @study_session.student == current_student
        @study_session.delete
      end
      flash[:message] = "Success. Study session has been deleted."
      redirect '/my_study_sessions'
    else
      redirect '/login'
    end
  end

end
