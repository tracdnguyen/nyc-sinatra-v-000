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
      @landmarks = Landmark.create(params[:landmark])
      @figure.landmarks << @landmarks
    end
    @titles = []
    if !params[:title][:name].empty?
      @titles = Title.create(params[:title])
      @figure.titles << Title.create(params[:title])
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

end
