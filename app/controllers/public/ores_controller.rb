class Public::OresController < ApplicationController
  def index
    # ページネーション
    @ores = Ore.page(params[:page].per(8))
  end

  def show
    @ore = Ore.find(params[:id])
  end

end
