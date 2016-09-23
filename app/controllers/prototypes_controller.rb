class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
  end
  def show
    @prototype=Prototype.find(params[:id])
  end
  def new
    @prototype=Prototype.new
    @prototype.capturedimages.build
  end

  def create
    Prototype.create(create_params)
    redirect_to :root
  end


  private
  def create_params
    params.require(:prototype).permit(:name, :catchcopy, :content, :user_id, capturedimages_attributes:[:image, :role])
  end

end
