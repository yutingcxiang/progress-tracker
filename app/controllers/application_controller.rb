require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

  helpers do
    def current_student
			if session[:user_id]
			  Student.find_by_id(session[:user_id])
			end
		end

		def logged_in?
			!!current_student
		end

    def current_study_session
      if session[:study_session_id]
        StudySession.find_by(id: params[:id])
      end
    end
	end

end
