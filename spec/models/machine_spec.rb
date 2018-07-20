require 'rails_helper'

describe Machine do
  context 'instance methods' do
    it '#average_snack_price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      dons.snacks.create(title: 'gfdas', price: 3.50)
      dons.snacks.create(title: 'hgfd', price: 2.50)
      dons.snacks.create(title: 'gfds', price: 1.50)

      expect(dons.average_snack_price).to eq(2.50)
    end
  end
end