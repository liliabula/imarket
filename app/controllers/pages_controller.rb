class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]
  def home
  end
  def about
  end	
  def dashboard
  	@mentor = current_user.mentors
  	@receivedcalls = Sale.where(email_mentor: current_user.email)
  	@bookedcalls = Sale.where(email_user: current_user.email)
  		
  end	
  def bementor
  end
end
