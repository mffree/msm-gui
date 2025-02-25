class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create # adding a new actor
    a = Actor.new
    a.name = params.fetch("the_name") # fetching from the form inputs
    a.dob = params.fetch("the_dob")
    a.bio = params.fetch("the_bio")
    a.image = params.fetch("the_image")
    a.save

    redirect_to("/actors")
  end


  def update 
    actor_id = params.fetch("path_id")
    a = Actor.where({ :id => actor_id }).at(0)
    a.name = params.fetch("the_name") # fetching from the form inputs
    a.dob = params.fetch("the_dob")
    a.bio = params.fetch("the_bio")
    a.image = params.fetch("the_image")
    a.save

    redirect_to("/actors/#{actor_id}")

  end

  def destroy
    actor_id = params.fetch("path_id")
    a = Actor.where({ :id => actor_id }).at(0)
    a.destroy # don't have to do d.save

    redirect_to("/actors")
  end

end
