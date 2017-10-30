class MoviesController < ApplicationController

  before_action :authenticate_user!

  def index
    @movies = 
  end

  
  
end
