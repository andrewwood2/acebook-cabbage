require "rails_helper"
require "web_helper"

RSpec.feature "Delete Posts", type: :feature do
  scenario "user can delete post" do
    user_sign_up
    submit_test_post
    visit("/posts")
    click_link "Bob"
    click_link "Delete"
    visit("/posts")
    expect(page).not_to have_content("test post")
  end

  scenario "user cannot delete or edit someone else's post" do
    user_sign_up
    submit_test_post
    click_link "Sign out"
    user2_sign_up
    click_link "Bob"
    expect(page).not_to have_content("Edit")
    expect(page).not_to have_content("Delete")
  end
end
