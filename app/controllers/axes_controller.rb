class AxesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :rig]
  def index
    @axes = Axe.all_with_count
  end
  
  def new
    @axe = Axe.new
  end

  def show
    @axe = Axe.find_by(id: axe_params[:id])
  end

  def create
    @axe = current_user.axes.create(axe_params)
    if @axe.save
      flash[:notice] = 'Axe created successfully.'
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def toggle_like
    @axe = Axe.find_by(id: params[:axe_id])
    like = @axe.likes.where(user_id: current_user.id).first
    if like
      like.destroy
      render json: {:success => "success", :like_count => @axe.likes.count}
    else
      @axe.likes.create(user_id: current_user.id)
      render json: {:success => "success", :like_count => @axe.likes.count}
    end
  end

  def rig
    user = User.find_by(id: params[:id])
    if user
      @axes = Axe.rig(params[:id])
      @user = user
    end
  end

  def destroy
    puts "trying to delete #{params}"
    axe = Axe.find_by(id: params[:id])
    if axe && axe.user_id == current_user.id
      axe.destroy
    else
      flash[:warning] = 'Not your axe!'
    end
    #redirect_to user_rig_path(current_user.id)
    render json: {:success => "success"}
  end

  private
    def axe_params
      params.require(:axe).permit(:id, :url, :like_count,:caption)
    end
end
