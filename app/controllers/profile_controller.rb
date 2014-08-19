class ProfileController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_person, only: [:show, :edit, :update, :destroy]

  def show
    @profile = Profile.find_by_user_id(current_user.id)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.assign_attributes(user_params)

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user.profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit( :email,
                                  profile_attributes:[ :id, :first_name, :last_name, :birth_year,
                                                      :location, :languages,  :country_code, :bio,
                                                      :phone_number])
  end
end
