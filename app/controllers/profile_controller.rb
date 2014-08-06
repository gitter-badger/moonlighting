class ProfileController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @profile = Profile.all
  end

  def show
    @profile = Profile.find_by_user_id(current_user.id)
  end

  def edit
    @profile = Profile.find_by_user_id(current_user.id)
  end

  def new
    @profile = Profile.new
  end

  def update
    respond_to do |format|
      if @profile.update(person_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:profile).permit(:first_name, :last_name, :bio, :location, :phone_number, :country_code, :languages, :birth_year)
    end
end
