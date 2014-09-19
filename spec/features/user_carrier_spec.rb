require 'rails_helper'

feature 'Logout' do
  before :each do
    User.create!(username:"Tester", password: "pass", email: "test@email.com")
  end

  scenario 'button does not exist for users that are not logged in' do
    visit root_url

    expect(page).to_not have_content("Log Out")
  end

  scenario 'button exists for logged users' do

    visit login_url

    fill_in 'username', with:'Tester'
    fill_in 'password', with:'pass'
    click_button 'login'

    visit user_path(1)

    expect(page).to have_content("Log Out")
  end
end


feature 'Send a parcel' do

  before :each do
    User.create!(username:"Tester", password: "pass", email: "test@email.com")
  end

  scenario 'The homepage has a link to all available deliveries' do
    visit root_url
    expect(page).to have_link('Send a Package', href: deliveries_path)
  end

  scenario 'clicking the link to send a package takes you to a page with list of deliveries' do
    visit login_url

    fill_in 'username', with:'Tester'
    fill_in 'password', with:'pass'
    click_button 'login'

    visit root_url
    click_link 'Send a Package'

    expect(page).to have_content("Deliveries")
  end
end
