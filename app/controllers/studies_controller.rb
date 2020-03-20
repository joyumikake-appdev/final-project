class StudiesController < ApplicationController
  def index
    @studies = Study.all.order({ :created_at => :desc })

    render({ :template => "studies/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @study = Study.where({:id => the_id }).at(0)
    @comments = Comment.where({:study_id => the_id})
    render({ :template => "studies/show.html.erb" })
  end

  def report
    render({ :template => "studies/report.html.erb" })
  end

  def create
    @study = Study.new
    @study.user_id = @current_user.id
    @study.day = params.fetch("query_day")
    @study.english = params.fetch("query_english")
    @study.japanese = params.fetch("query_japanese")
    @study.math = params.fetch("query_math")
    @study.science = params.fetch("query_science")
    @study.social_study = params.fetch("query_social_study")
    @study.other_study = params.fetch("query_other_study")
    @study.game = params.fetch("query_game")
    @study.diary = params.fetch("query_diary")

    if @study.valid?
      @study.save
      redirect_to("/studies", { :notice => "Study created successfully." })
    else
      redirect_to("/studies", { :notice => "Study failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @study = Study.where({ :id => the_id }).at(0)

    @study.user_id = params.fetch("query_user_id")
    @study.day = params.fetch("query_day")
    @study.english = params.fetch("query_english")
    @study.japanese = params.fetch("query_japanese")
    @study.math = params.fetch("query_math")
    @study.science = params.fetch("query_science")
    @study.social_study = params.fetch("query_social_study")
    @study.other_study = params.fetch("query_other_study")
    @study.game = params.fetch("query_game")
    @study.diary = params.fetch("query_diary")
    @study.point = params.fetch("query_point")

    if @study.valid?
      @study.save
      redirect_to("/studies/#{@study.id}", { :notice => "Study updated successfully."} )
    else
      redirect_to("/studies/#{@study.id}", { :alert => "Study failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @study = Study.where({ :id => the_id }).at(0)

    @study.destroy

    redirect_to("/studies", { :notice => "Study deleted successfully."} )
  end
end
