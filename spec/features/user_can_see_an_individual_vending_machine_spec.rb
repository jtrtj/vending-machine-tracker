require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see the name of all the name and price of snacks in the machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(title: 'gfdas', price: 12)
    snack_2 = dons.snacks.create(title: 'hgfd', price: 65)

    visit machine_path(dons)

    expect(page).to have_content(snack_1.title)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(snack_2.title)
    expect(page).to have_content(snack_2.price)
  end

  scenario 'they see the average price for the machine' do
    
  end
end


=begin
As a user
When I visit a specific vending machine page
I see the name of all of the snacks associated with that vending machine along with their price
=end

=begin
As a user
When I visit a specific vending machine page
I also see an average price for all of the snacks in that machine
=end