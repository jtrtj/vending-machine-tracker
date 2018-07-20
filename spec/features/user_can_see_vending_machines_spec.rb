require 'rails_helper'

feature "When a user visits the vending machine index" do
  scenario "they see a list of vending machine locations" do
    sam = Owner.create(name: "Sam's Snacks")
    dons = Location.create(location: "Don's Mixed Drinks")
    turing = Location.create(location: "Turing Basement")
    sam.machines.create(location_id: dons.id)
    sam.machines.create(location_id: turing.id)

    visit owner_machines_path(sam)

    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Turing Basement")
  end
end
