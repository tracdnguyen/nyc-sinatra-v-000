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
      @figure.landmarks << Landmark.create(params["new_landmark"])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params["new_title"])
    end

    @figure.save
    binding.pry
    redirect to "/figures/#{@figure.id}"
  end

end
