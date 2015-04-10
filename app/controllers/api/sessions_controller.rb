class Api::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def create
    self.resource = warden.authenticate!(auth_options)
    token = Tiddle.create_and_return_token(resource, request)
    render json: { authentication_token: token }
  end

  def destroy
    Tiddle.expire_token(current_user, request) if current_user
    render json: {}
  end

  # def index 
  #   render json: { "Bob" => "#{current_user.email}, #{current_user.horses}, #{current_user.created_at}"}
  # end

private

  def verify_signed_out_user
  end

end

