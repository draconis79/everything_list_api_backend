class WelcomeController < ActionController
  def index
    render json: {status: 200, message: 'Everything List API'}
  end
end
