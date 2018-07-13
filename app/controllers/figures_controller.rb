class FiguresController < ApplicationController
  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

end
