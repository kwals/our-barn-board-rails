class Api::SessionsController < Devise::SessionsController
  skip_before_action protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def create
    self.resource = warden.authenticate!(auth_options)
    token = Tiddle.create_and_return_token(resource, request)
    render json: { authentication_token: token , user_email: current_user.email }
  end

  def destroy
    Tiddle.expire_token(current_user, request) if current_user
    render json: {}
  end

private

  def verify_signed_out_user
  end

end

