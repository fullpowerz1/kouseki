class Public::RankingsController < ApplicationController

  def index
    @rankings = current_customer.rankings
    @ranking = Ranking.new
  end


  def new
    @ranking = Ranking.new
    @current_customer = current_customer
  end

  def confirm
    @ranking = Ranking.new(ranking_params)
    @ranking.rank = params[:ranking][:rank] ##順位付けを反映

    # 手持ちの鉱石から選択
    if params[:ranking][:select_material] == "0" ##どれを選択したのかをparamsから読み取る。
      @ranking.ore = current_customer.ore ##ランク付けする鉱石を反映
      @ranking.amount =current_customer.amount ##顧客がランク付けしたい鉱石の数
      render "confirm"

    # 装飾品を選択
    elsif params[:ranking][:select_material] == "1" ##どれを選択したのかをparamsから読み取る。
      @decoration = current_customer.decorations.new ##装飾品を新規登録
      @decoration.type = [:ranking][:type] #装飾品の種類を登録
      @decoration.customer_id = current_customer.id ##装飾品カスタマーIDをログインしているゲストIDに指定

      if @decoration.save
        @ranking.type = @decoration.type
      else
        render "new"
      end
    end
  end

  def complete
  end

  def create
    @ranking = Ranking.new(ranking_params)
    @ranking.customer_id = current_customer.id
    @ranking.save!
    redirect_to rankings_complete_path
  end


  def show
    @ranking = Ranking.find(params[:id])
  end

  private

  def ranking_params
    params.require(:ranking).permit(:customer_id, :ore, :type, :name, :amount, :rank, :status)
  end

end