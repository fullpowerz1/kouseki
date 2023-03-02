class Admin::HomesController < ApplicationController
  # adminの管理者権限
  before_action :authenticate_admin!

  def top
    @rankings = Ranking.page(params[:page]).per(8).order('created_at DESC')
  end
end
