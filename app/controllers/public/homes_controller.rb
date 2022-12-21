class Public::HomesController < ApplicationController
  def top
    @ores = Ore.page(params[:page]).per(4).order('created_at DESC')
    @genres = Genre.all
  end

  def about
  end

end
