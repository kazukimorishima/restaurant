class DinnersController < ApplicationController
    
    def index
        @dinners = Dinner.all
    end
    
    def new
        @dinner = Dinner.new
    end
    
    def create
        @dinner = Dinner.new(dinner_params)
        if @dinner.save
          flash[:notice] = "ディナー写真が登録されました"
        else
          flash[:notice] = "ディナー写真を登録できませんでした"
          render "dinners/new"  
        end
    end
    
    def edit
        @dinner = Dinner.find_by(id: params[:id])
    end
    
    def update
        @dinner = Dinner.find_by(id: params[:id])
        @dinner.update(params.require(:dinner).permit(:image))
        flash[:notice] = "編集が完了しました"
    end
    
    def destroy
        @dinner = Dinner.find(params[:id])
        @dinner.destroy
    end
    
    private 
    def dinner_params
      params.require(:dinner).permit(:image)
    end
    
    
end
