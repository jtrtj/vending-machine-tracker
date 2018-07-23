=begin
As a user
When I visit a specific snack page
I see the name of that snack
I see the price for that snack
I see a list of locations with vending machines that carry that snack
I see the average price for snacks in those vending machines
And I see a count of the different kinds of items in that vending machine.

ex.
Flaming Hot Cheetos
Price: $2.50
Locations
* Don's Mixed Drinks (3 kinds of snacks, average price of $2.50)
* Turing Basement (2 kinds of snacks, average price of $3.00)
=end

require 'rails_helper'

describe 'a user' do
  context 'visiting a snack show page' do
    it 'will see see the snack attributes' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      turing  = owner.machines.create(location: "Turing Basement")
      snack_1 = Snack.create(title: 'Flamin Hot Cheetos', price: 2.00)
      snack_2 = Snack.create(title: 'Starbursts', price: 4.00)
      MachineSnack.create(snack: snack_1, machine: dons)
      MachineSnack.create(snack: snack_1, machine: turing)
      MachineSnack.create(snack: snack_2, machine: turing)
      
      visit snack_path(snack_1)
     
      expect(page).to have_content(snack_1.title)
      expect(page).to have_content("Price: $#{snack_1.price}")
      expect(page).to have_content("#{dons.location}")
      expect(page).to have_content("#{turing.location}")
      expect(page).to have_content("#{turing.average_snack_price}")
      expect(page).to have_content("#{dons.average_snack_price}")
      
    end
  end
end
