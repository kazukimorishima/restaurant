class SpacesController < ApplicationController
    
    def index
        @spaces = Space.all
    end
    
    def new
        @space = Space.new
    end
    
    def create
        @space = Space.new(space_params)
        if @space.save
          flash[:notice] = "スペース写真が登録されました"
        else
          flash[:notice] = "スペース写真を登録できませんでした"
          render "spaces/new"  
        end
    end
    
    def edit
        @space = Space.find_by(id: params[:id])
    end
    
    def update
        @space = Space.find_by(id: params[:id])
        @space.update(params.require(:space).permit(:image))
        flash[:notice] = "編集が完了しました"
    end
    
    def destroy
        @space = Space.find(params[:id])
        @space.destroy
    end
    
    private 
    def space_params
      params.require(:space).permit(:image)
    end    
    
end
