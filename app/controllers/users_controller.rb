class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.page(params[:page]).per(8)
  end



  def edit
  end

  def update
    current_user.update(update_params)
    flash[:success]="edit complited"
    redirect_to :root and return
      end

  private
  def update_params
    params.require(:user).permit(:name, :email, :member,:profile, :works ,:avatar)
  end


end
