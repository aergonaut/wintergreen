class Authentication
  def initialize(params, omniauth)
    @params = params
    @omniauth = omniauth
  end

  def authenticated?
    user.present?
  end

  def user
    @user ||= find_or_create_user
  end

  def find_or_create_user
    identity = Identity.find_or_create_by(provider: @params[:provider], uid: @omniauth[:uid])
    unless identity.user.present?
      user = User.new(login: @omniauth[:info][:nickname], email: @omniauth[:info][:email])
      user.save!

      identity.user = user
      identity.access_key = @omniauth[:credentials][:token]
      identity.save!
    end
    identity.user
  end
end
