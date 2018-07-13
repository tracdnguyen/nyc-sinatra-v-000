class FiguresController < ApplicationController
  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    binding.pry
    @figure = Figure.create(params["figure"])
    @landmarks = []
    if !params[:landmark][:name].empty?
      @landmarks = Landmark.find_or_create_by(:name => params["new_landmark"])
      @figure.landmarks << @landmarks
    end
    @titles = []
    if !params[:title][:name].empty?
      @titles = Title.find_or_create_by(:name => params["new_title"])
      @figure.titles << @titles
    end

    @figure.save
    
    redirect to "/figures/#{@figure.id}"
  end

end
