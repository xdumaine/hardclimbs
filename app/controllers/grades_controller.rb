class GradesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @grade = Grade.new
  end
  
  def index
    authorize! :index, @grade, :message => 'Not authorized as an administrator.'
    @grades = Grade.all
  end
  
  def edit
    @grade = Grade.find(params[:id])
  end

  def show
    @grade = Grade.find(params[:id])
  end
  
  def update
      authorize! :update, @grade, :message => 'Not authorized as an administrator.'
      @grade = Grade.find(params[:id])
      if @grade.update_attributes(params[:grade])
        redirect_to grades_path, :notice => "Grade updated."
      else
        redirect_to grades_path, :alert => "Unable to update grade."
      end
    end

  def create
    authorize! :create, @grade, :message => 'Not authorized as an administrator.'
    @grade = Grade.new(params[:grade])
    if @grade.save
      flash[:success] = "Thanks for adding a grade!"
      redirect_to @grade
    else
      render 'new'
    end
  end
    
  def destroy
    authorize! :destroy, @grade, :message => 'Not authorized as an administrator.'
    grade = Grade.find(params[:id])
    grade.destroy
    redirect_to grades_path, :notice => "Grade deleted."
  end
end
