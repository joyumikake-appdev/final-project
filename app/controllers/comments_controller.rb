class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order({ :created_at => :desc })

    render({ :template => "comments/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @comment = Comment.where({:id => the_id }).at(0)

    render({ :template => "comments/show.html.erb" })
  end

  def create
    @comment = Comment.new
    @comment.body = params.fetch("input_body")
    @comment.author_id = @current_user.id
    @comment.study_id = params.fetch("input_study_id")

    if @comment.valid?
      @comment.save
      redirect_to("/studies/#{@comment.study_id}", { :notice => "Comment created successfully." })
    else
      redirect_to("/comments", { :notice => "Comment failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @comment = Comment.where({ :id => the_id }).at(0)

    @comment.body = params.fetch("query_body")
    @comment.author_id = params.fetch("query_author_id")
    @comment.study_id = params.fetch("query_study_id")

    if @comment.valid?
      @comment.save
      redirect_to("/comments/#{@comment.id}", { :notice => "Comment updated successfully."} )
    else
      redirect_to("/comments/#{@comment.id}", { :alert => "Comment failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @comment = Comment.where({ :id => the_id }).at(0)

    @comment.destroy

    redirect_to("/comments", { :notice => "Comment deleted successfully."} )
  end
end
