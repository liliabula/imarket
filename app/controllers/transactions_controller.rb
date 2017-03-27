class TransactionsController < ApplicationController

	def create
		mentor =  Mentor.find_by!(slug: params[:slug])

		sale = mentor.sales.create(
			amount: (mentor.price * 100).floor,
			email_user: current_user.email,
			email_mentor: mentor.user.email,
			stripe_token: params[:stripeToken]
			)
		sale.running!

		if sale.completed?
		  	redirect_to pickup_url(guid: sale.guid)
	  	else
			redirect_to mentor_path(mentor), notice: @error
		end
	end


	def pickup
		@sale = Sale.find_by!(guid: params[:guid])
		@mentor = @sale.mentor
	end

end