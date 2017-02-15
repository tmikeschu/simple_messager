require 'rails_helper'

RSpec.describe ConversationMember, type: :model do
  context "associations" do
    it { should belong_to(:conversation) }
    it { should belong_to(:user) }
  end
end
