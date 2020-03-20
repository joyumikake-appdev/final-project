class ParentingsController < ApplicationController
  def index
    @parentings = Parenting.all.order({ :created_at => :desc })

    render({ :template => "parentings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @parenting = Parenting.where({:id => the_id }).at(0)

    render({ :template => "parentings/show.html.erb" })
  end

  def create
    @parenting = Parenting.new
    @parenting.kid_id = params.fetch("query_kid_id")
    @parenting.parent_id = params.fetch("query_parent_id")

    if @parenting.valid?
      @parenting.save
      redirect_to("/parentings", { :notice => "Parenting created successfully." })
    else
      redirect_to("/parentings", { :notice => "Parenting failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @parenting = Parenting.where({ :id => the_id }).at(0)

    @parenting.kid_id = params.fetch("query_kid_id")
    @parenting.parent_id = params.fetch("query_parent_id")

    if @parenting.valid?
      @parenting.save
      redirect_to("/parentings/#{@parenting.id}", { :notice => "Parenting updated successfully."} )
    else
      redirect_to("/parentings/#{@parenting.id}", { :alert => "Parenting failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @parenting = Parenting.where({ :id => the_id }).at(0)

    @parenting.destroy

    redirect_to("/parentings", { :notice => "Parenting deleted successfully."} )
  end
end
