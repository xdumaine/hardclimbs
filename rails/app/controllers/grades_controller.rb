class GradesController < ApplicationController
  before_filter :authenticate_user!
  
  add_breadcrumb "Grades", :grades_path.to_s
  
  def new
    @grade = Grade.new
  end
  
  def index
    @grades = Grade.all
  end
  
  def edit
    @grade = Grade.find(params[:id])
  end

  def show
    @grade = Grade.find(params[:id])
  end
  
  def update
      @grade = Grade.find(params[:id])
      if @grade.update_attributes(params[:grade])
        redirect_to grades_path, :notice => "Grade updated."
      else
        redirect_to grades_path, :alert => "Unable to update grade."
      end
    end

  def create
    @grade = Grade.new(params[:grade])
    if @grade.save
      flash[:success] = "Thanks for adding a grade!"
      redirect_to @grade
    else
      render 'new'
    end
  end
    
  def destroy
    grade = Grade.find(params[:id])
    grade.destroy
    redirect_to grades_path, :notice => "Grade deleted."
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:name, :style_id, :rank)
    end
end
