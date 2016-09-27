class PrototypesController < ApplicationController

   before_action :set_prototype, only:[:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.page(params[:page]).per(8)
  end

  def show
    @likes = Like.where(prototype_id: params[:id])
  end

  def new
    @prototype = Prototype.new
    @prototype.capturedimages.build
  end

  def create
    Prototype.create(create_params)
    redirect_to :root
  end

  def destroy
    if @prototype.user_id == current_user.id
       @prototype.destroy
    end
    redirect_to :root
  end

  def edit
  end

  def update
    if @prototype.user_id == current_user.id
       @prototype.update(update_params)
    end
    flash[:success]="edit complited"
    redirect_to :root
  end




  private

  def create_params
    params.require(:prototype).permit(:name, :catchcopy, :content, :user_id, capturedimages_attributes:[:image, :role])
  end

  def update_params
    params.require(:prototype).permit(:name, :catchcopy, :content, :user_id, capturedimages_attributes:[:id, :image, :role])
  end

  def set_prototype
    @prototype=Prototype.find(params[:id])
  end



end
