class MentorsController < ApplicationController
  before_action :set_mentor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]
  def index
    @mentors = Mentor.all
  end

  def show
  end

  def new
    @mentor = current_user.mentors.build
  end

  def edit
  end

  def create
    @mentor = current_user.mentors.build(mentor_params)

    respond_to do |format|
      if @mentor.save
        format.html { redirect_to @mentor, notice: 'Mentor was successfully created.' }
        format.json { render :show, status: :created, location: @mentor }
      else
        format.html { render :new }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mentor.update(mentor_params)
        format.html { redirect_to @mentor, notice: 'Mentor was successfully updated.' }
        format.json { render :show, status: :ok, location: @mentor }
      else
        format.html { render :edit }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mentor.destroy
    respond_to do |format|
      format.html { redirect_to mentors_url, notice: 'Mentor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_mentor
      @mentor = Mentor.find(params[:id])
    end

    def mentor_params
      params.require(:mentor).permit(:name, :profession, :location, :price, :description, :industries, :expertise, :cover)
    end

    def check_user
      if current_user != @mentor.user
        redirect_to root_url, alert: "Sorry, you don't have access to this page"
      end
    end
end
