class HomeController < ApplicationController
  def top
        @inquiry = Inquiry.new
  end
  
  def menu
  end
end
