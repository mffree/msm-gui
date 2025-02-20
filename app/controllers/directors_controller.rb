class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  def new_director # adding a new director
    d = Director.new # Creating a new row in the directors database via the Director class aka model
    d.name = params.fetch("director_name") # fetching from the form inputs
    d.dob = params.fetch("director_dob")
    d.bio = params.fetch("director_bio")
    d.image = params.fetch("director_image")
    d.save

    redirect_to("/directors")

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
