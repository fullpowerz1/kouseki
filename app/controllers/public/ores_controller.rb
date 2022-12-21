class Public::OresController < ApplicationController
  def index
    # ページネーション
    @ores = Ore.page(params[:page]).per(8).order('created_at DESC')
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @ore = Ore.find(params[:id])
  end

end
