Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  post("/directors/insert_director", { :controller => "directors", :action => "new_director" }) # adding a new director  
  post("/directors/update_director/:path_id", { :controller => "directors", :action => "updating_director" }) # updating a director  
  get("/directors/delete_director/:path_id", { :controller => "directors", :action => "deleting_director" }) # deleting a director
  
  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })

  post("/movies/insert_movie", { :controller => "movies", :action => "create" })   
  # post("/movies/update_movie/:path_id", { :controller => "movies", :action => "update" })   
  # get("/movies/delete_movie/:path_id", { :controller => "movies", :action => "delete" }) 

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
end
