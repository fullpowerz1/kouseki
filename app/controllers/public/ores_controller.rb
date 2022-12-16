class Public::OresController < ApplicationController
  def index
    # ページネーション
    @ores = Ore.all.page(params[:page].per(8))
  end
end
