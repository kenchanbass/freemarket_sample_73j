class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :item_imgs, dependent: :destroy
  accepts_nested_attributes_for :item_imgs, allow_destroy: true
  has_one :user_evaluation

  belongs_to :category
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :brand
  belongs_to_active_hash :prefecture
end
