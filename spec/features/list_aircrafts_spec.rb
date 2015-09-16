require 'spec_helper'

describe "view index" do
  it "person should see the aircrafts queued" do
    aircraft1 = Aircraft.create(aircraft_size: 'large', aircraft_type: 'passenger')
    aircraft2 = Aircraft.create(aircraft_size: 'small', aircraft_type: 'cargo')

    visit '/'

    expect(page).to have_content 'Aircraft Queue'
    expect(page).to have_content 'passenger'
  end
end
