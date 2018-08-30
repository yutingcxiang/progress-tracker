require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  helpers do
    def current_student
			if session[:student_id]
			  Student.find_by_id(session[:student_id])
			end
		end

		def logged_in?
			!!session[:student_id]
		end
	end

end
