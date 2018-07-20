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
    snack_1 = dons.snacks.create(title: 'gfdas', price: 12.50)
    snack_2 = dons.snacks.create(title: 'hgfd', price: 65.50)

    visit machine_path(dons)

    expect(page).to have_content("#{snack_1.title}: $#{snack_1.price}")
    expect(page).to have_content("#{snack_2.title}: $#{snack_2.price}")
  end

  scenario 'they see the average price for the machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(title: 'gfdas', price: 12.50)
    snack_2 = dons.snacks.create(title: 'hgfd', price: 65.50)

    visit machine_path(dons)

    expect(page).to have_content("Average Price: $#{dons.average_snack_price}")
  end
end