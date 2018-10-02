require "rails_helper"

RSpec.feature "Add and remove friends", type: :feature do
  scenario "user can add friend" do
    user_sign_up
    submit_test_post
    click_link "Sign out"
    user2_sign_up
    click_link "Bob"
    click_link "Add Friend"
    expect(page).to have_content("Added friend")
  end

  scenario "user cannot add friend if already friends" do
    user_sign_up
    submit_test_post
    click_link "Sign out"
    user2_sign_up
    click_link "Bob"
    click_link "Add Friend"
    expect(page).not_to have_content("Add friend")
  end

  scenario "user can remove friend" do
    user_sign_up
    submit_test_post
    click_link "Sign out"
    user2_sign_up
    click_link "Bob"
    click_link "Add Friend"
    click_link "Unfriend"
    expect(page).to have_content("Unfriended")
  end
end
