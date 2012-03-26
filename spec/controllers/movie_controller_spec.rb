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

## Adding those to increase coverage

describe "GET index" do
  context "with RESTful URL" do
    it "assigns all movies as @movies" do
      movie = Movie.create! valid_attributes
      session[:sort] = "title"
      session[:ratings] = {"G"=>"1"}
      get :index, :sort =>session[:sort], :ratings=> session[:ratings]
      assigns(:movies).should eq([movie])
    end
  end

  context "without RESTful URL" do
    it "is missing the sort parameter" do
      session[:sort] = "title"
      session[:ratings] = {"G"=>"1"}
      get :index
      response.should redirect_to(movies_path(:sort=>session[:sort], :ratings=>session[:ratings]))
    end
    it "is missing the ratings parameter" do
      session[:sort] = "release_date"
      session[:ratings] = {"G"=>"1"}
      get :index, :sort => session[:sort]
      response.should redirect_to(movies_path(:sort=>session[:sort], :ratings=>session[:ratings]))
    end
  end
end

describe "GET show" do
  it "assigns the requested movie as @movie" do
    movie = Movie.create! valid_attributes
   get :show, :id => movie.id
   assigns(:movie).should eq(movie)
  end
end

#describe "GET new" do
#it "assigns a new movie as @movie" do
#get :new
#assigns(:movie).should be_a_new(Movie)
#end
#end
       
describe "GET edit" do
  it "assigns the requested movie as @movie" do
   movie = Movie.create! valid_attributes
   get :edit, :id => movie.id
   assigns(:movie).should eq(movie)
  end
end
       
describe "POST create" do
  describe "with valid params" do
    it "creates a new movie" do
      expect {
        post :create, :movie => valid_attributes
      }.to change(Movie, :count).by(1)
    end
       
    it "assigns a newly created movie as @movie" do
      post :create, :movie => valid_attributes
      assigns(:movie).should be_a(Movie)
      assigns(:movie).should be_persisted
    end
               
    it "redirects to the homepage" do
      post :create, :movie => valid_attributes
      response.should redirect_to(movies_path)
    end
  end
end
             
describe "PUT update" do
  describe "with valid params" do
    it "updates the requested movie" do
      movie = Movie.create! valid_attributes
      # Assuming there are no other movies in the database, this
      # specifies that the movie created on the previous line
      # receives the :update_attributes message with whatever params are
      # submitted in the request.
      Movie.any_instance.should_receive(:update_attributes!).with({'title' => 'params'})
      put :update, :id => movie.id, :movie => {'title' => 'params'}
    end

    it "assigns the requested movie as @movie" do
      movie = Movie.create! valid_attributes
      put :update, :id => movie.id, :movie => valid_attributes
      assigns(:movie).should eq(movie)
    end

    it "redirects to the homepage" do
      movie = Movie.create! valid_attributes
      put :update, :id => movie.id, :movie => valid_attributes
      response.should redirect_to(movie_path(movie))
    end
  end
end

describe "DELETE destroy" do
  it "destroys the requested movie" do
    movie = Movie.create! valid_attributes
      expect {
      delete :destroy, :id => movie.id
      }.to change(Movie, :count).by(-1)
    end

  it "redirects to the movies list" do
    movie = Movie.create! valid_attributes
    delete :destroy, :id => movie.id
    response.should redirect_to(movies_url)
  end
end
#End MovieControoler
end
