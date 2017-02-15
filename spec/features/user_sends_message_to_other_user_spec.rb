=begin
As a user
when I visit my homepage
and I click "New Message"
and I click a user to send a message
then I should be on a message page

and if I fill in a message
and I click "Send"
then I should see that message on the page with a timestamp
=end
require "rails_helper"
include Warden::Test::Helpers

RSpec.describe do
  context "User" do
    before do
      @user1, @user2 = create_list(:user, 2)
      visit root_path
      fill_in "user[email]", with: @user1.email
      fill_in "user[password]", with: @user1.password
      click_on "Log in"
    end

    scenario "starts a message" do
      click_on "New Conversation"
      page.check @user2.first_name
      click_on "Create Conversation"

      expect(current_path).to eq conversation_path(@user1.conversations.first)
    end

    scenario "sends a message" do
      click_on "New Conversation"
      page.check @user2.first_name
      click_on "Create Conversation"

      fill_in "message_body", with: "Hey!"
      click_on "Send"

      expect(page).to have_content "Hey!"
      expect(page).to have_content "Sent: #{@user1.messages.first.created_at}"
      expect(page).to have_content @user1.first_name
      byebug
    end
  end
end
