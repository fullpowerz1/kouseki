class Admin::HomesController < ApplicationController
  def top
    @rankings = Ranking.page(params[:page]).per(8).order('created_at DESC')
  end
end
