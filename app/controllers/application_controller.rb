class ApplicationController < ActionController::Base
  before_action :get_img_url
  before_action :use_api_key


  #setting a global root path for images
  def get_img_url
    @imdb_img_path = "https://image.tmdb.org/t/p/w400"
  end

  def use_api_key
    @api_key = "c5850ed73901b8d268d0898a8a9d8bff"
    @base_url = "https://api.themoviedb.org/3/"
  end


end
