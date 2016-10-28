class PrototypesController < ApplicationController

   before_action :set_prototype, only:[:show, :edit, :update, :destroy]
   before_action :sign_in_required, only:[:new, :create, :edit, :update, :destory]

  def index
    @prototypes = Prototype.order("likes_count DESC").page(params[:page]).per(8)
  end

  def show
    @likes = Like.where(prototype_id: params[:id])
    @comment = Comment.new
  end

  def new
    @prototype = Prototype.new
    @prototype.capturedimages.build
  end

  def create
    if Prototype.create(create_params)
      flash[:success]="prototype successfully"
      redirect_to :root
    else
      flash[:danger]="prototype unsuccessfully"
      redirect_to :action => "new"
  end
end

  def destroy
    if @prototype.user_id == current_user.id
       @prototype.destroy
    end
    flash[:success]="delete complited"
    redirect_to :root
  end

  def edit
    @mainimage = @prototype.capturedimages.first
    @subimage = @prototype.capturedimages.where(role: 1)
  end

  def update
    if @prototype.user_id == current_user.id
      if @prototype.update(update_params)
      flash[:success]="edit complited"
      redirect_to :root
      else
        flash[:danger]="edit failed"
        redirect_to :action =>"edit"
      end
    end
  end




  private

  def create_params
    params.require(:prototype).permit(:name, :catchcopy, :content, :user_id, capturedimages_attributes:[:image, :role]).merge(tag_list: params[:prototype][:tag])
  end

  def update_params
    params.require(:prototype).permit(:name, :catchcopy, :content, :user_id, capturedimages_attributes:[:id, :image, :role]).merge(tag_list: params[:prototype][:tag])
  end

  def set_prototype
    @prototype=Prototype.find(params[:id])
  end



end
