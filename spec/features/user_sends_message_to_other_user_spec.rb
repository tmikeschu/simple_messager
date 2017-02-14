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

RSpec.describe do
  context "User" do
    before do
      @user1, @user2 = create_list(:user, 2)
    end

    scenario "starts a message" do
      visit dashboard_path
      click_on "New Message"
      click_on @user2.first_name, href: new_message_path(@user)

      expect(current_path).to eq messages_path(@user1.messages.first)
    end

    scenario "sends a message" do
      visit dashboard_path
      click_on "New Message"
      click_on @user2.first_name, href: new_message_path(@user)
      fill_in "message_form", with: "Hey!"
      click_on "Send"

      expect(page).to have_content "Hey!"
      expect(page).to have_content "Sent: #{@user1.messages.first.create_at}"
    end
  end
end
