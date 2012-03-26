require 'spec_helper'

describe MoviesController do

def valid_attributes
  {:rating =>'G', :director =>'Clint Eastwood'}
end

describe "GET same_director" do
  describe "with director" do
    it "assigns all movies as @movies" do
      movie = Movie.create! valid_attributes
      get :similar_movies, :id=> movie.id
      assigns(:movies).should eq([movie])
    end
  end

  describe "without director" do
    it "redirects to the homepage" do
      movie = Movie.create!
      get :similar_movies, :id=> movie.id
      response.should redirect_to movies_path
    end
  end
end

end
