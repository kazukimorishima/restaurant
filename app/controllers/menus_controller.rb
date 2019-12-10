class MenusController < ApplicationController
    def index
        @menus = Menu.all
    end
    
    def new
        @menu = Menu.new
    end
    
    def create
        @menu = Menu.new(menu_params)
        if @menu.save
          flash[:notice] = "新メニュー登録されました"
        else
          flash[:notice] = "新メニュー登録できませんでした"
          render "menus/new"      
        end
    end
    
    def edit
        @menu = Menu.find_by(id: params[:id])
    end
    
    def update
        @menu = Menu.find_by(id: params[:id])
        @menu.update(params.require(:menu).permit(:name, :detail, :category_id, :price))
        flash[:notice] = "編集が完了しました"
    end
    
    def destroy
        @menu = Menu.find(params[:id])
        @menu.destroy
    end
    
    private 
    def menu_params
      params.require(:menu).permit(:name, :detail, :category_id, :price)
    end
end
