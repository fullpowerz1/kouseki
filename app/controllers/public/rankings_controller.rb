class Public::RankingsController < ApplicationController

  def index
    @rankings = current_customer.rankings
    # @rankings = @rankings.filter { |ranking| ranking.favorites.present? }
    @ranking = Ranking.new
  end

  def bookmark
    @rankings = current_customer.rankings
    @rankings = @rankings.filter { |ranking| ranking.favorites.present? }
  end

  def new
    @rankings = current_customer.rankings
    @ranking = Ranking.new
    @current_customer = current_customer
    @ore = Ore.find_by(id: params[:ore_id])
  end

  def confirm
    @ranking = Ranking.new(ranking_params)
    #byebug
    # @ranking.rank = params[:ranking][:rank] #newの所で渡しているからいらない。
    @ranking.customer_id = current_customer.id
    #@ranking.amount = 1
    @ore = Ore.find(ranking_params[:ore_id])
    # if @ranking.save!
     #  redirect_to rankings_complete_path
    # 手持ちの鉱石から選択
    # if params[:ranking][:select_material] == "0" ##どれを選択したのかをparamsから読み取る。
    #   @ranking.ore_id = current_customer.ore ##ランク付けする鉱石を反映
    #   @ranking.amount =current_customer.amount ##顧客がランク付けしたい鉱石の数
    # render "confirm"
    # else
      # render :new
    # end
    # # 装飾品を選択

    if params[:ranking][:select_material] == "1" ##どれを選択したのかをparamsから読み取る。
      @decoration = current_customer.decorations.new ##装飾品を新規登録
      @decoration.amulet = params[:ranking][:amulet] #装飾品の種類を登録
      @decoration.save# if @decoration.save
      #   @ranking.type = @decoration.type
    #   else
    #     render "new"
    #   end
    end
  end

  def complete
  end

  def create
    @ranking = Ranking.new(ranking_params)
    #byebug
    @ranking.customer_id = current_customer.id
    @ranking.save!
    redirect_to rankings_complete_path
  end


  def show
    @ranking = Ranking.find(params[:id])
    #byebug
    @stone_comment = StoneComment.new
  end

  private

  def ranking_params
    params.require(:ranking).permit(:customer_id, :ore_id, :stone, :amulet, :name, :amount, :rank, :status)
  end

end