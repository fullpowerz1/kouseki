class Public::DecorationsController < ApplicationController
  def index
    @decorations = current_customer.decorations
    @decoration = Decoration.new
    @current_customer = current_customer
  end

  def edit
    @decoration = Decoration.find(params[:id])
    @current_customer = current_customer
  end

  def create
    @decoration = Decoration.new(decoration_params)
    if @decoration.save
      redirect_to request.referer
    else
      @decorations = Decoration.all
      @current_customer = current_customer
      render :index
    end
  end

  def update
    @decoration = Decoration.find(params[:id])
    if @decoration.update(decoration_params)
      redirect_to decorations_path(@decoration.id)
    else
      render :edit
    end
  end


  def destroy
    @decoration = Decoration.find(params[:id])
    @decoration.destroy
    redirect_to decorations_path
  end

  private

  def decoration_params
    params.require(:decoration).permit(:customer_id, :ore, :amulet, :nickname)
  end


end
