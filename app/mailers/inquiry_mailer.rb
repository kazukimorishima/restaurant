class InquiryMailer < ApplicationMailer
    def send_when_create(inquiry)
        @inquiry = inquiry
        mail to: inquiry.email,
        subject: 'お問合せ受付ました'
    end
end
