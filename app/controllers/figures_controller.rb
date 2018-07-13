class FiguresController < ApplicationController
  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])
    @landmarks = []
    if !params[:landmark][:name].empty?
      @landmarks = Landmark.create(params["new_landmark"])
      @figure.landmarks << @landmarks
    end
    @titles = []
    if !params[:title][:name].empty?
      @titles = Title.create(params["new_title"])
      @figure.titles << @titles
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

end
