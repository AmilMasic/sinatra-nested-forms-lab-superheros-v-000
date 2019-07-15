require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :team
    end

    post '/teams' do
      @team = Team.new(params[:team])

      params[:team][:heroes].each do |args|
        Heroes.new(args)
      end
      @heroes = Heroes.all
      erb :superhero
    end

end
