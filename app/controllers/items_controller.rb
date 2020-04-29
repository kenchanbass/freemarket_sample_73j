class ItemsController < ApplicationController
  def index
  end

  def item_show
  end

  def new
    @item = Item.new
    @item.item_imgs.new
  end

  def create
    @item = Item.new(item_params)
    @item.seller_id = current_user.id
    @item.save
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :brand_id, :size_id, :postage_type_id, :item_condition_id, :postage_payer_id, :prefecture_code, :preparation_day_id, :price, :seller_id, :buyer_id, item_imgs_attributes: [:url])
  end
end
