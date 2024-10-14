class MovieSerializer
    include JSONAPI::Serializer
    attributes :title, :vote_average

    def self.format_top_rated(movies)
        { data:
            movies.map do |movie| 
                {
                id: movie[:id],
                type: "movie",
                attributes: {
                title: movie[:original_title],
                vote_average: movie[:vote_average]
                }
            }
        end
        }
    end
end
