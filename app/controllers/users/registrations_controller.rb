class Users::RegistrationsController  < Devise::RegistrationsController

  def create
    super do |user|
      #ensure_fresh_tracking_id
      #tracker.track Tracker::EVENTS[:sign_up]
      #tracker.set({ "$email" => user.email })
      #user.tracking_id = tracker.user_id
      #user.avatar_url = get_gravatar_url(@user.email)
      user.build_profile
      #user.save(validate: false)


    end
  end

  protected
  def after_update_path_for(resource)
    profile_path
  end


end
