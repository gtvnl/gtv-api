class UsersController < ApplicationController
  before_action :authenticate_request
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      Log.create(description: "CREATE: User #{@user.name} [#{@user.email}]")

      render json: @user, status: :created, location: @user
    else
      Log.create(description: "ERROR: Creating User #{@user.name} [#{@user.email}] [#{@user.errors}]")

      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      Log.create(description: "UPDATE: User #{@user.name} [#{@user.email}]")
      render json: @user
    else
      Log.create(description: "ERROR: Updating User #{@user.name} [#{@user.email}] [#{@user.errors}]")

      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    Log.create(description: "DELETE: User #{@user.name} [#{@user.email}]")

    @user.destroy
    redirect_to :back

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password_digest)
    end
end
