class Users::RegistrationsController  < Devise::RegistrationsController

  def create
    super do |user|
      user.skip_confirmation!
      user.build_profile

    end
  end

  protected
  def after_sign_up_path_for(resource)
    edit_profile_path(current_user)
  end


end
