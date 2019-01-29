require 'pry'
class ApplicationController < Sinatra::Base

    set :views, "app/views"
    set :method_override, true

    get "/" do
      erb :home
    end

    get "/apples" do
      @apples = Apple.all
      erb :index
    end

    get "/new" do
      erb :new
    end

    post "/apples" do
      apple = Apple.find_or_create_by(name: params[:name], crunchiness: params[:crunchiness], sweetness: params[:sweetness], summary: params[:summary], versatility: params[:versatility].to_i, pie?: params[:pie?], origin: params[:origin], parentage: params[:parentage])
      redirect "/apples/#{apple.id}"
    end

    get "/apples/:id" do
      id = params[:id]
      @apple = Apple.find(id)
      erb :show
    end

    get "/apples/:id/edit" do
      id = params[:id]
      @apple = Apple.find(id)
      erb :edit
    end

    patch "/apples/:id" do
      apple = Apple.find(params[:id])
      apple.update(name: params[:name], crunchiness: params[:crunchiness], sweetness: params[:sweetness], summary: params[:summary], versatility: params[:versatility].to_i, pie?: params[:pie?], origin: params[:origin], parentage: params[:parentage])
      redirect "/apples/#{apple.id}"
    end
end
