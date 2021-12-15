# frozen_string_literal: true
class Item < ApplicationRecord
  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true

  after_initialize { p 'initialize' }
  after_save { p 'save' }
  after_create { p 'created' }
  after_update { p 'updated' }
  after_destroy { p 'Item was destroyed.' }
end
