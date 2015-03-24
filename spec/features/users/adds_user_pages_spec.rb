require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    visit root_path
    click_on 'Register New Account'
    user = FactoryGirl.create(:user)
  end
end
