class Admin::OresController < ApplicationController
  def index
    @ores = Ore.all
    @ore = Ore.new
  end

  def new
    @ore = Ore.new
  end

  def create
    @Ore = Ore.new(ore_params)
    @ore.save!
    redirect_to admin_ore_path(@ore.id)
  end

  def show
    @ore = Ore.find(params[:id])
    @ore_new = Ore.new
  end

  def update
    @ore = Ore.find(params[:id])
    @ore.update(ore_params)
    redirect_to admin_ore_path(@ore)
  end

  private

  def ore_params
    params.require(:ore).permit(:stone, :introduction, :is_active, :image, :genre_id)
  end

end
