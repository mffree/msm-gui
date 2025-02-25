class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    m = Movie.new 
    m.title = params.fetch("the_title") # fetching from the form inputs
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director_id")
    m.save

    redirect_to("/movies")
  end

  def update # updating movie
    movie_id = params.fetch("path_id")
    m = Movie.where({ :id => movie_id }).at(0)
    m.title = params.fetch("the_title") # fetching from the form inputs
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director_id")
    m.save

    redirect_to("/movies/#{movie_id}")

  end


  def destroy # {"path_id"=>"72"}
    movie_id = params.fetch("path_id")
    d = Movie.where({ :id => movie_id }).at(0)
    d.destroy # don't have to do d.save

    redirect_to("/movies")
  end


end
