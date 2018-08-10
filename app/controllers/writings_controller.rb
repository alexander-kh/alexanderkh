class WritingsController < ApplicationController
  before_action :set_writing, only: [:show, :edit, :update, :destroy]
  
  def index
    @writings = Writing.all
  end
  
  def new
    @writing = Writing.new
  end
  
  def create
    @writing = Writing.new(writing_params)
    if @writing.save
      flash[:notice] = "Writing has been successfully created"
      redirect_to writings_path
    else
      redirect_to new_writing_path
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @writing.update(writing_params)
      flash[:notice] = "Writing has been successfully updated"
      redirect_to writing_path(@writing)
    else
      redirect_to edit_writing_path(@writing)
    end
  end
  
  def destroy
    @writing.destroy
    flash[:notice] = "Writing has been successfully removed"
    redirect_to writings_path
  end

  private
  
  def set_writing
    @writing = Writing.find_by(permalink: params[:id])
  end
  
  def writing_params
    params.require(:writing).permit(:title, :content, :status)
  end
end
