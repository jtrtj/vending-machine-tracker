=begin
As a user
When I visit a specific snack page
I see the name of that snack
I see the price for that snack
I see a list of locations with vending machines that carry that snack
I see the average price for snacks in those vending machines
And I see a count of the different kinds of items in that vending machine.
=end

require 'rails_helper'

describe 'a user' do
  context 'visiting a snack show page' do
    it 'will see see the snack attributes' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_1 = dons.snacks.create(title: 'gfdas', price: 12.50)

      visit snack_path(snack_1)

      expect(page).to have_content(snack_1.title)
      expect(page).to have_content("Price: $#{snack_1.price}")
    end
  end
end
