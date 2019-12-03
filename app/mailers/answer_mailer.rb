class AnswerMailer < ApplicationMailer
    def send_when_create(answer)
        @answer = answer
        @inquiry = Inquiry.find_by(id: answer.inquiry_id)
        mail to: @inquiry.email,
        subject: 'お問い合わせ内容の回答です'
    end
end
