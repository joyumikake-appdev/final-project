Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:detail_username", { :controller => "users", :action => "user_details" } )

  #------------------------------  

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
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
  
  # DELETE FORM
  get("/cancel_user_account/:detail_username", { :controller => "users", :action => "cancel" })

  # DELETE RECORD
  get("/destory_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # Routes for the Study resource:

  # CREATE
  get("/report_study", { :controller => "studies", :action => "report" })
  post("/insert_study", { :controller => "studies", :action => "create" })
          
  # READ
  get("/studies", { :controller => "studies", :action => "index" })
  
  get("/studies/:path_id", { :controller => "studies", :action => "show" })
  
  # UPDATE
  
  post("/modify_study/:path_id", { :controller => "studies", :action => "update" })
  
  # DELETE
  get("/delete_study/:path_id", { :controller => "studies", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  get("/insert_comment_from_studypage", { :controller => "comments", :action => "create_from_studypage" })
  get("/insert_comment_from_userpage", { :controller => "comments", :action => "create_from_userpage" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------  

  # Routes for the Parenting resource:

  # CREATE
  get("/insert_parenting", { :controller => "parentings", :action => "create" })
          
  # READ
  get("/parentings", { :controller => "parentings", :action => "index" })
  
  get("/parentings/:path_id", { :controller => "parentings", :action => "show" })
  
  # UPDATE
  
  post("/modify_parenting/:path_id", { :controller => "parentings", :action => "update" })
  
  # DELETE
  get("/delete_parenting/:path_id", { :controller => "parentings", :action => "destroy" })

  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
