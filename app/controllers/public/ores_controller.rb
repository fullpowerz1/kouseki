class Public::OresController < ApplicationController
  def index
    # ページネーション
    @ores = Ore.page(params[:page]).per(8).order('created_at DESC')
    @genres = Genre.all
    if params[:search].present?
      ores = Ore.ores_search(params[:search])
    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      ores = @tag.ores.order(created_at: :desc)
    else
      ores = Ore.all.order(created_at: :desc)
    end
    @tag_lists = Tag.all
    @ores = Kaminari.paginate_array(ores).page(params[:page]).per(10)
  end

  def edit
  end

  def show
    @genres = Genre.all
    @ore = Ore.find(params[:id])
    @current_customer = current_customer
  end

end
