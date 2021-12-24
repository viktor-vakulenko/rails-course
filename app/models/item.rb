# frozen_string_literal: true
class Item < ApplicationRecord
  validates :amount, numericality: { greater_than: 0 }
  validates :name, presence: true

  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable

  # after_initialize { p 'initialized' }
  after_save { p '****____saved____****' }
  after_create { p '----****____created____****------' }
  after_update { p '****____updated____****' }
  after_destroy { p '****____destroy____****' } # Item.last.destroy

  # TODO:  for carts_items
  # has_and_belongs_to_many :carts

end
