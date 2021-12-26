require 'rails_helper'

RSpec.describe Cart, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'cart test' do; end
  # it 'has_many' do
  #   should have_many :items
  # end
  it { should have_many :items }
end
