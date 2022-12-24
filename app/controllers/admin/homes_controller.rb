class Admin::HomesController < ApplicationController
  def top
    @rankings = Ranking.page(params[:page])
  end
end
