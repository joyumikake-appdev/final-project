Rails.application.routes.draw do

  

  # Routes for the Parenting resource:

  # CREATE
  post("/insert_parenting", { :controller => "parentings", :action => "create" })
          
  # READ
  get("/parentings", { :controller => "parentings", :action => "index" })
  
  get("/parentings/:path_id", { :controller => "parentings", :action => "show" })
  
  # UPDATE
  
  post("/modify_parenting/:path_id", { :controller => "parentings", :action => "update" })
  
  # DELETE
  get("/delete_parenting/:path_id", { :controller => "parentings", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Study resource:

  # CREATE
  post("/insert_study", { :controller => "studies", :action => "create" })
          
  # READ
  get("/studies", { :controller => "studies", :action => "index" })
  
  get("/studies/:path_id", { :controller => "studies", :action => "show" })
  
  # UPDATE
  
  post("/modify_study/:path_id", { :controller => "studies", :action => "update" })
  
  # DELETE
  get("/delete_study/:path_id", { :controller => "studies", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
