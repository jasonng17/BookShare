class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @user = User.all
    respond_to do |format|
      format.xml { render xml: @user}
    end
  end


  def show
    respond_to do |format|
      format.xml { render xml: @user}
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.xml { render xml: @user, status: :created}
      else
        format.xml { render xml: @user.error, status: :unprocessable_entity}
      end
    end
  end


  def update
    respond_to do |format|
      if @user.update(user_params)
        format.xml { head :no_content, status: :ok }
      else
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user.destroy
    respond_to do |format|
      format.xml { head :no_content, status: :ok }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :school, :department, :contact, :email, :password, :password_confirmation)
  end
end