require "rails_helper"

RSpec.describe "Movies" do
    describe 'happy path' do
        it 'can return a list of the top rated movies' do
            get "/api/v1/movies"

            expect(response).to be_successful
            json = JSON.parse(response.body, symbolize_names: true)

            expect(json[:data].length).to eq(20)
            expect(json[:data][0][:id]).to be_a(Integer)
            expect(json[:data][0][:type]).to eq("movie")
            expect(json[:data][0][:attributes][:title]).to be_a(String)
            expect(json[:data][0][:attributes][:vote_average]).to be_a(Float)

        end
    end
end