require 'spec_helper'

describe 'Dequeue aircraft' do
  it "should remove an aircraft to the queue" do
    aircraft1 = Aircraft.create(aircraft_size: 'large', aircraft_type: 'passenger')
    aircraft2 = Aircraft.create(aircraft_size: 'small', aircraft_type: 'cargo')
    aircraft3 = Aircraft.create(aircraft_size: 'large', aircraft_type: 'cargp')
    aircraft4 = Aircraft.create(aircraft_size: 'small', aircraft_type: 'passenger')

    visit 'root_path'
    expect(page).to have_content "Aircraft Queue"

    click_link 'Dequeue'
    expect(page).to_not have_content 'large_passenger'
    expect(page).to have_content 'small_passenger'
    expect(page).to have_content 'large_cargo'
    expect(page).to have_content 'small_cargo'

    click_link 'Dequeue'
    expect(page).to_not have_content 'small_passenger'
    expect(page).to have_content 'large_cargo'
    expect(page).to have_content 'small_cargo'

    click_link 'Dequeue'
    expect(page).to_not have_content 'large_cargo'
    expect(page).to have_content 'small_cargo'

    click_link 'Dequeue'
    expect(page).to_not have_content 'small_cargo'
    expect(page).to have_content 'Add aircraft'
  end
end
