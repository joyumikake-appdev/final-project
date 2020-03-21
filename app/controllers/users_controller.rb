class UsersController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:new_registration_form, :create] })

  def index
    @users = User.all.order({ :user_name => :asc })
    render ({ :template => "users/index.html.erb"})
  end

  def user_details
    the_username = params.fetch("detail_username")
    @user = User.where({ :user_name => the_username}).at(0)
    @own_studies = @user.own_studies
    the_kid_id = Parenting.where({ :parent_id => @user.id}).pluck(:kid_id)
    @kids = User.where({ :id => the_kid_id})
    render ({ :template => "users/user_details.html.erb"})
  end

  def new_registration_form
    render({ :template => "user_sessions/sign_up.html.erb" })
  end

  def create
    @user = User.new
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.user_name = params.fetch("query_user_name")
    @user.is_parent = params.fetch("query_is_parent", false)

    save_status = @user.save

    if save_status == true
      session.store(:user_id,  @user.id)
   
      redirect_to("/", { :notice => "User account created successfully."})
    else
      redirect_to("/user_sign_up", { :alert => "User account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "users/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.user_name = params.fetch("query_user_name")
    @user.is_parent = params.fetch("query_is_parent", false)
    @user.total_points = params.fetch("query_total_points")
    
    if @user.valid?
      @user.save

      redirect_to("/", { :notice => "User account updated successfully."})
    else
      render({ :template => "users/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account cancelled" })
  end
  
end
