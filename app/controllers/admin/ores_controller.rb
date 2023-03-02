class Admin::OresController < ApplicationController
  # adminの管理者権限
  before_action :authenticate_admin!

  def index
    @ores = Ore.all
    @ore = Ore.new
  end

  def new
    @ore = Ore.new
  end

  def create
    @ore = Ore.new(ore_params)
    tag_list = params[:ore][:stone].split(',')
    if @ore.save!
       @ore.save_ores(tag_list)
       redirect_to admin_ore_path(@ore.id),notice:'投稿完了しました:)'
    else
       redirect_to admin_ores_path
    end
  end

  def show
    @ore = Ore.find(params[:id])
    @ore_new = Ore.new
  end

  def edit
    @ore = Ore.find(params[:id])
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
