class FiguresController < ApplicationController
  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @landmarks = []
    if !params[:landmark][:name].empty?
      @landmarks << Landmark.create(name: params[:landmark][:name])
    end
    if params[:figure][:landmark_ids] != nil
      params[:figure][:landmark_ids].each do |landmark|
        id = landmark.gsub("landmark_","").to_i
        @landmarks << Landmark.find(id)
      end
    end
    @titles = []
    if !params[:title][:name].empty?
      @titles << Title.create(params[:title])
    end
    if params[:figure][:title_ids] != nil
      params[:figure][:title_ids].each do |title|
        id = title.gsub("title_","").to_i
        @titles << Title.find(id)
      end
    end
    @figure = Figure.find_by(name: params[:figure][:name]) || Figure.create(name: "#{params[:figure][:name]}")
    @figure.landmarks = @landmarks
    @figure.titles = @titles
    
    redirect to "/figures/#{@figure.id}"
  end

end
