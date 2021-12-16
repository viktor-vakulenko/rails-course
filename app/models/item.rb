# frozen_string_literal: true
class Item < ApplicationRecord
  validates :amount, numericality: { greater_than: 0, allow_nil: true }
  validates :name, presence: true

  after_initialize { p 'initialized' }
  after_save { p 'saved' }
  after_create { p 'created' }
  after_update { p 'updated' }
  after_destroy { p 'destroy' } # Item.last.destroy
end
