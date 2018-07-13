class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    if !params["landmark"]["name"].empty?
      @landmark.name = Landmark.create(params[:landmark][:name])
    end

    if !params["landmark"]["year_completed"].empty?
      @landmark.year_completed = Landmark.create(params[:landmark][:year_completed])
    end
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
end
