# frozen_string_literal: true
class Item < ApplicationRecord
<<<<<<< HEAD
  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true

  after_initialize { p 'initialize' }
  after_save { p 'save' }
  after_create { p 'created' }
  after_update { p 'updated' }
  after_destroy { p 'Item was destroyed.' }
=======
  validates :amount, numericality: { greater_than: 0, allow_nil: true }
  validates :name, presence: true

  after_initialize { p 'initialized' }
  after_save { p 'saved' }
  after_create { p 'created' }
  after_update { p 'updated' }
  after_destroy { p 'destroy' } # Item.last.destroy
>>>>>>> Course
end
