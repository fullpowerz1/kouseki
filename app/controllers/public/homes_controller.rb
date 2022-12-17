class Public::HomesController < ApplicationController
  def top
    @ores = Ore.page(params[:page]).per(4)
  end

end
