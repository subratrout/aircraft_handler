require 'spec_helper'

describe 'Add aircraft' do
  it "should add an aircraft to the queue" do
    visit '/'
    expect(page).to have_content "Aircraft Queue"

    click_link 'Enqueue'
    expect(page).to have_content 'Add aircraft'

    select('large', :from => 'aircraft_size')
    select('cargo', :from => 'aircraft_type')
    click_button 'submit'

    expect(page).to have_content "aircraft was added to the queue."

  end

end
