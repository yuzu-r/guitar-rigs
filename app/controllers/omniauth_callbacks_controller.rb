class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    generic_callback('twitter')
  end

  def generic_callback(provider)
    @identity = Identity.find_for_oauth request.env['omniauth.auth']
    @user = @identity.user || current_user
    if @user.nil?
      @user = User.create(email: @identity.email || '')
      @identity.update_attribute(:user_id, @user.id)
    end
    if @user.email.blank? && @identity.email
      @user.update_attribute(:email, @identity.email)
    end
    if @user.username.blank? && @identity.username
      callback_username = '@' + @identity.username
      puts "callback username: #{callback_username}" 
      @user.update_attribute(:username, callback_username)
    end
    if @user.persisted?
      @identity.update_attribute(:user_id, @user.id)
      @user = FormUser.find(@user.id)
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end