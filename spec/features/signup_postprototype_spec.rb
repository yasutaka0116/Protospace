require 'rails_helper'

feature "Sign up", type: :feature do
  scenario 'sign up' do
    visit root_path
    click_on "Get Started"
    click_on "Sign up now"
    sign_up_with
    expect(page).to have_selector '.alert-notice', text: "Welcome! You have signed up successfully."
  end
end

feature "Post prototype", type: :feature do
  before do
    User.create!(name: "taro", email: "aaa@gmail.com", password:"00000000")
  end
  scenario "Post prototype", js: true do

    visit root_path
    click_on "Get Started"
    fill_in "Email address", with: "aaa@gmail.com"
    fill_in "Password", with: "00000000"
    click_on "Sign in"
    visit new_prototype_path
    page.save_screenshot 'test.png'
    post_prototype
    expect(page).to have_selector '.alert-success', text: "prototype successfully"
  end
end
