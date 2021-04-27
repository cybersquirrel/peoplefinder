class PingController < ActionController::Base

  protect_from_forgery with: :exception

  def index
    render json: Deployment.info
  end

  def httpdump
    render plain: request.env
  end
end
