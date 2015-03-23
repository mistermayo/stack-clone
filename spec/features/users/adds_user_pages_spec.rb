require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    visit root_path
    click_on 'Register New Account'
    fill_in 'Name', :with => 'Kathy'
    fill_in 'Email', :with => 'example@example.com'
    fill_in 'Password', :with => 'secrehrwhjretsecret'
    click_on 'Sign Up'
    expect(page).to have_content 'Accounts'
  end

  it "gives error when no name is entered" do
    visit root_path
    click_on 'Register New Account'
    fill_in 'Name', :with => ''
    fill_in 'Email', :with => ''
    fill_in 'Password', :with => 'secretsecret'
    click_on 'Sign Up'
    expect(page).to have_content 'errors'
  end
end
