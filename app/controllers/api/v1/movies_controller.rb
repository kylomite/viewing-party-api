class Api::V1::MoviesController < ApplicationController
    def index
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            # faraday.headers["Authorization"] = "Bearer #{Rails.application.credentials.TMDB[:key]}"
        end

        response = conn.get("/3/movie/top_rated", { api_key: Rails.application.credentials.TMDB[:key]})

        json = JSON.parse(response.body, symbolize_names: true)
        movie_list = json[:results]
        render json: MovieSerializer.format_top_rated(movie_list)
    end

    def show

    end
end