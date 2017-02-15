require 'rails_helper'

RSpec.describe Conversation, type: :model do
  context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:conversation_members) }
    it { should have_many(:members).through(:conversation_members) }
    it { should have_many(:messages) }
  end
end
