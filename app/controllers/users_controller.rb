class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:update, :edit ]

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.page(params[:page])
  end



  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(user_params)
    flash[:success]="edit complited"
    redirect_to :root and return
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :member,:profile, :works ,:avatar)
  end


end
