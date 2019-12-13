class HomeController < ApplicationController
  before_action :home_params, only: [:search]
  def index
    request = RestClient.get("#{@base_url}movie/upcoming?api_key=#{@api_key}&page=#{params[:page]}")
    @movies = JSON.parse(request)
  end

  def details(id=0)
    if id == 0
      _id = params[:id]
    else
      _id = id
    end
    request = RestClient.get("https://api.themoviedb.org/3/movie/#{_id}?api_key=#{@api_key}")
    @movie = JSON.parse(request)
  end

  def search
    @searchfor = params[:search_movie]
    puts "[#{@searchfor}]"
    request = RestClient.get("https://api.themoviedb.org/3/search/movie?api_key=#{@api_key}&query=#{@searchfor}&page=#{params[:page]}")
    @movie = JSON.parse(request)
  end


  private
  def home_params
    params.permit(:search_movie)
  end

  helper_method :details
end
