class AxesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @axes = Axe.all
  end
  
  def new
    @axe = Axe.new
  end

  def show
    @axe = Axe.find_by(id: axe_params[:id])
  end

  def create
    @axe = Axe.create(axe_params)
    if @axe.save
      puts "successfully created"
    else
      puts "error"
    end
  end

  private
    def axe_params
      params.require(:axe).permit(:id, :url, :like_count)
    end
end
