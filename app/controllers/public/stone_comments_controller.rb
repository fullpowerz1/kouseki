class Public::StoneCommentsController < ApplicationController

  def create
    @ranking = Ranking.find(params[:ranking_id])
    @stone_comment = current_customer.stone_comments.new(stone_comment_params)
    @stone_comment.ranking_id = @ranking.id
    if @stone_comment.save
      redirect_to rankings_path
    else
      @ranking = Ranking.find(params[:ranking_id])
      @customer = @ranking.customer
      @newranking = Ranking.new
      @stone_comment = StoneComment.new
      redirect_to ranking_path(@ranking.id)
    end
  end

  def destroy
    @stone_comment = StoneComment.find(params[:id])
    if @stone_comment.customer == current_customer
      StoneComment.find(params[:id]).destroy
      @ranking = Ranking.find(params[:ranking_id])
      redirect_to rankings_path
    end
  end

  private

  def stone_comment_params
    params.require(:stone_comment).permit(:comment)
  end

end
