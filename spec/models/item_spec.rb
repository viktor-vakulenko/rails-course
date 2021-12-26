# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'validate name' do
    should validate_presence_of :name
  end

  it 'validate amount' do
    should validate_numericality_of :amount
  end


  # it 'has_many' do
  #   should have_many :positions
  #   should have_many :comments
  #   should have_many :carts
  # end
  it { should have_many :positions }
  it { should have_many :comments }
  it { should have_many :carts }
end
