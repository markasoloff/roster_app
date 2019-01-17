class Api::VotesController < ApplicationController
  
  def show
    @vote = Vote.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  # def update
  #   @task = Task.find_by(id: params[:id])
  #   @task.text = params[:text] || @task.text
  #   @task.completed = params[:completed] || @task.completed
  #   @task.save
  #   render "show.json.jbuilder"
  # end


end
