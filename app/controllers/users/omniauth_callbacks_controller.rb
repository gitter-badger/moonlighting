class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(env["omniauth.auth"], current_user)

        if @user.persisted?
          sign_in_and_redirect edit_profile_path(@user), event: :authentication
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        else
          session["devise.#{provider}_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url
        end

      end
    }
  end

  [:linkedin].each do |provider|
    provides_callback_for provider
  end

  def after_sign_up_path_for(resource)
    edit_profile_path(current_user)
  end
end
