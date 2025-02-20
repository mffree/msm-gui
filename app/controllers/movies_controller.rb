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
    m.title = params.fetch("movie_title") # fetching from the form inputs
    m.year = params.fetch("movie_year")
    m.duration = params.fetch("movie_duration")
    m.description = params.fetch("movie_description")
    m.image = params.fetch("movie_image")
    m.director_id = params.fetch("director_id") # ADD ERROR MESSAGE
    m.save

    redirect_to("/movies")

  end

  def updating_director # updating director
    director_id = params.fetch("path_id")
    d = Director.where({ :id => director_id }).at(0)
    d.name = params.fetch("director_name") # fetching from the form inputs
    d.dob = params.fetch("director_dob")
    d.bio = params.fetch("director_bio")
    d.image = params.fetch("director_image")
    d.save

    redirect_to("/directors/#{director_id}")

  end


  def deleting_director
    director_id = params.fetch("path_id")
    d = Director.where({ :id => director_id }).at(0)
    d.destroy # don't have to do d.save

    redirect_to("/directors")
  end


end
