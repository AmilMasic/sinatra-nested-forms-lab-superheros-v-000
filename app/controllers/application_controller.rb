require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :team
    end

    post '/team' do
      @team = Team.new(params[:team])

      params[:team][:heroes].each do |args|
        Heroes.new(args)
      end
      @heroes = Heroes.all
      erb :super_hero
    end

end
