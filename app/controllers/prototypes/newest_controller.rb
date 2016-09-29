class Prototypes::NewestController < ApplicationController

  def index
    @prototypes = Prototype.order("created_at DESC").page(params[:page]).per(8)
  end
end
