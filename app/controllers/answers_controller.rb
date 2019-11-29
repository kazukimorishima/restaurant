class AnswersController < ApplicationController
  def new
    @answer = Answer.new(inquiry_id: params[:inquiry_id])
    @inquiry = Inquiry.find_by(id: params[:inquiry_id])
  end

  def create
    @answer = Answer.new(inquiry_id: params[:inquiry_id], answer: params[:answer][:answer])
    if @answer.save
      flash[:notice] = "回答しました"
      redirect_to inquiries_path
    else
      flash[:notice] = "回答できませんでした"
      render "answer/new"      
    end
  end
  
  
end
