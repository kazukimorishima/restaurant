class HomeController < ApplicationController
  def top
        @inquiry = Inquiry.new
  end
end
