class AnswersController < ApplicationController
  def new
    @answer = Answer.new(inquiry_id: params[:inquiry_id])
    @inquiry = Inquiry.find_by(id: params[:inquiry_id])
  end

  def create
    @answer = Answer.new(answer_params)
  
    
    respond_to do |format| 
      if @answer.save
        AnswerMailer.send_when_create(@answer).deliver
        format.html { redirect_to root_path, notice: '回答が保存されました。' }
        format.json { render "home/top", status: :created, location: @answer } 
      else
        format.html { render "home/top" }
        format.json { render json: @answer.errors, status: :unprocessable_entity } 
      end
    end
  end
  
  private 
    def answer_params
      params.require(:answer).permit(:inquiry_id, :answer)
    end
  
  
end
