class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.all
  end

  def show
    @prototype = Prototype.find(params[:id])
  end
  def new
    @prototype = Prototype.new
    @prototype.capturedimages.build
  end

  def create
    Prototype.create(create_params)
    redirect_to :root
  end

  def delete
    prototype = Prototype.destroy(params[:id])
    if prototype.user_id == current_user.id
      prototype.destroy
    end
    redirect_to :root
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype =Prototype.find(params[:id])
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



end
