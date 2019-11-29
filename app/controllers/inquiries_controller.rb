class InquiriesController < ApplicationController
  
  def new
    @inquiry = Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    
    respond_to do |format| 
      if @inquiry.save
        InquiryMailer.send_when_create(@inquiry).deliver
        format.html { redirect_to root_path, notice: 'お問合せ保存されました。' }
        format.json { render "home/top", status: :created, location: @inquiry } 
      else
        format.html { render "home/top" }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity } 
      end
    end
    
    
    
    
    
    # if @inquiry.save
    #   flash[:notice] = "#{@inquiry.name}様、お問合せ送信されました"
    #   redirect_to root_path
    # else
    #   flash[:notice] = "お問合せ送信できませんでした"
    #   render 'inquiries/new'      
    # end
  end

  def index
    @inquiries = Inquiry.all.order(created_at: :desc)
  end

  private 
    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :phone, :content)
    end
end
