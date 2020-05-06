class ItemsController < ApplicationController
  before_action :set_item, only:[:show,:destroy]

  def index
    @parents = Category.where(ancestry: nil)
    @items = Item.includes(:item_imgs).order("created_at DESC")
  end

  

  def new
    @item = Item.new
    @item.item_imgs.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end

  def create
    @item = Item.new(item_params)
    @item.seller_id = current_user.id
    if @item.save
      redirect_to items_path
    else
      flash[:errors] = @item.errors.full_messages
      @item.item_imgs.new
      render :new
    end
  end

  def show
    
  end

  def destroy
    if @item.seller_id == current_user.id && @item.destroy
      redirect_to root_path
    else
      render "items/show"
    end
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :brand_id, :size_id, :postage_type_id, :item_condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price, :seller_id, :buyer_id, item_imgs_attributes: [:url])
  end
  

  def set_item
    @item = Item.find(params[:id])
  end
  
end
