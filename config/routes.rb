Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  post("/directors/insert_director", { :controller => "directors", :action => "new_director" }) # adding a new director  
  post("/directors/update_director/:path_id", { :controller => "directors", :action => "updating_director" }) # updating a director  
  get("delete_director/:path_id", { :controller => "directors", :action => "deleting_director" }) # deleting a director
  
  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })

  post("/insert_movie_record", { :controller => "movies", :action => "create" })   
  post("/modify_movie_record/:path_id", { :controller => "movies", :action => "update" })   
  get("/delete_movie/:path_id", { :controller => "movies", :action => "destroy" }) 

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })

  post("/insert_actor_record", { :controller => "actors", :action => "create" }) 
  post("/modify_actor_record/:path_id", { :controller => "actors", :action => "update" }) 
  get("delete_actor/:path_id", { :controller => "actors", :action => "destroy" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
end
