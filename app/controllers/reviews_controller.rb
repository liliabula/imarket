class ReviewsController < ApplicationController
before_action :find_mentor
before_action :find_review, only: [:edit, :update, :destroy]
before_action :authenticate_user!, only: [:new, :edit]

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.mentor_id = @mentor.id 
		@review.user_id = current_user.id

		if @review.save
			redirect_to mentor_path(@mentor)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @review.update(review_params)
			redirect_to mentor_path(@mentor)
		else
			render 'edit'	
		end
	end

	def destroy
		@review.destroy
		redirect_to mentor_path(@mentor)
	end

	private

		def review_params
			params.require(:review).permit(:rating, :comment)
		end

	def find_mentor
		@mentor = Mentor.find(params[:mentor_id])
	end
	
	def find_review
		@review = Review.find(params[:id])
	end

end
