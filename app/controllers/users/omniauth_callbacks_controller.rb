class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    user = User.find_for_oauth(env['omniauth.auth'])
    if user.persisted?
      sign_in user
      flash[:notice] = t('devise.omniauth_callbacks.success', :kind => User::SOCIALS[params[:action].to_sym])
      if user.sign_in_count == 1
        redirect_to edit_profile_path(user)
      else
        redirect_to profile_path(user)
      end
    else
      puts "FUCK"
      session['devise.user_attributes'] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  User::SOCIALS.each do |k, _|
    alias_method k, :all
  end

end
