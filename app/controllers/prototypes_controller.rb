class PrototypesController < ApplicationController
  def index
  end
  def show
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
    params.require(:prototype).permit(:name, :catchcopy, :content, capturedimages_attributes:[:image]).merge(capturedimages_attributes:[:role])
  end

end
