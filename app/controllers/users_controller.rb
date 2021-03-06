class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_token, except: [:login, :create, :show]
  before_action :authorize_user, except: [:login, :create, :index, :show]

  # GET / users
  # def index
  #   @users = User.all
  #   render json: @users.to_json(include: :list_categories)
  # end


  # GET /users/1
  def show
    render json: @user.to_json(include: :list_categories)
  end


  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
end


  # PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end


  def login
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      token = create_token(user.id, user.username)
      render json: { status: 200, token: token, user: user }
    else
      render json: { status: 401, message: "Unauthorized" }
    end
  end


  private

  def create_token(id, username)
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
  end

    def payload(id, username)
      {
        exp: (Time.now + 5.minutes).to_i,
        iat: Time.now.to_i,
        iss: ENV['JWT_ISSUER'],
        user: {
          id: id,
          username: username
        }
      }
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  # USER REQUIREMENT
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
