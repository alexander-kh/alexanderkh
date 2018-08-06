class NotesController < ApplicationController
  before_action :require_signing_in
  before_action :set_resource, only: [:new, :edit, :update]
  before_action :set_note, only: [:edit, :update, :destroy]
  
  def new
    @note = Note.new
  end
  
  def create
    @note = resource.notes.build(note_params)
    if @note.save
      flash[:notice] = "Note has been successfully created"
      redirect_to polymorphic_path(resource)
    end
  end
  
  def edit
  end
  
  def update
    if @note.update(note_params)
      flash[:notice] = "Note has been successfully updated"
      redirect_to polymorphic_path(resource)
    else
      flash[:alert] = "Note can't be blank"
      redirect_to edit_polymorphic_path([resource, @note])
    end
  end
  
  def destroy
    @note.destroy
    flash[:notice] = "Note has been successfully removed"
    redirect_to polymorphic_path(resource)
  end
  
  private
  
  def resource
    if params[:book_id].present?
      Book.find(params[:book_id])
    else
      Course.find(params[:course_id])
    end
  end
  
  def set_resource
    @resource = resource
  end
    
  def set_note
    @note = resource.notes.find(params[:id])
  end
        
  def note_params
    params.require(:note).permit(:text)
  end
end
