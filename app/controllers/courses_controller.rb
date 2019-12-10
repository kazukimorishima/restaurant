class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end
    
    def new
        @course = Course.new
    end
    
    def create
        @course = Course.new(course_params)
        if @course.save
          flash[:notice] = "コース写真が登録されました"
        else
          flash[:notice] = "コース写真を登録できませんでした"
          render "courses/new"  
        end
    end
    
    def edit
        @course = Course.find_by(id: params[:id])
    end
    
    def update
        @course = Course.find_by(id: params[:id])
        @course.update(params.require(:course).permit(:name, :detail, :image))
        flash[:notice] = "編集が完了しました"
    end
    
    def destroy
        @course = Course.find(params[:id])
        @course.destroy
    end
    
    private 
    def course_params
      params.require(:course).permit(:name, :detail, :image)
    end
    
end
