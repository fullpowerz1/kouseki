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

  def create
    @ore = Ore.new(ore_params)
    tag_list = params[:ore][:tag_name].split(nil)
    @ore.image.attach(params[:ore][:image])
    @ore.customer_id = current_customer.id
    if @ore.save
       @ore.save_ores(tag_list)
       redirect_to ores_path
    else
      @genres = Genre.all
      @ore = Ore.find(params[:id])
      @current_customer = current_customer
      flash.now[:alert] = '投稿に失敗しました。'
      render 'show'
    end
  end

  def show
    @genres = Genre.all
    @ore = Ore.find(params[:id])
    @current_customer = current_customer
  end

  private

  def ore_params
    params.require(:ore).permit(:genre_id, :stone, :introduction, :is_deleted, :image, :tag_name)
  end
end
