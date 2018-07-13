class FiguresController < ApplicationController
  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @title_ids = []
    if !params[:title][:name].empty?
      @titles << Title.create(name: params["title"]["name"])
    end
    if !params[:figure][:title_ids].empty?
      params[:figure][:title_ids].each do |title|
        id = landmark.gsub("title_","").to_i
        @title_ids << Title.find(id)
      end
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end

    @landmark_ids = []
    if !params[:landmark][:name].empty?
      @landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    if !params[:figure][:landmark_ids].empty?
      params[:figure][:landmark_ids].each do |landmark|
        id = landmark.gsub("landmark_","").to_i
        @landmark_ids << Landmark.find(id)
      end
    end
    if !params[:title][:name].empty?
      @titles << Title.create(name: params["title"]["name"])
    end

    @figure = Figure.find_or_create_by(name: params[:figure][:name])
    @figure.landmarks = @landmark_ids
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

end
