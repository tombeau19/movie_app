require 'httparty'
require 'pp'

class MoviesController < ApplicationController

  before_action :authenticate_user!

  def index
    @movies = current_user.movies.map do |movie|
      url = "http://www.omdbapi.com/?i=#{movie.api_id}&apikey=d31f1a94"
      response = HTTParty.get(url)
      response_body = JSON.parse(response.body)

      movie.title = response_body['Title']
      movie.release_year = response_body['Year']
      movie.rating = response_body['Rated']
      movie.poster = response_body['Poster']
      movie
    end
  end

  # def destroy
  #   FavoriteMovie.find_by(user_id: current_user.id, movie_id: @movie.id).delete
  #   redirect_to movies_url, notice: 'Movie was successfully destroyed.'
  # end

end
