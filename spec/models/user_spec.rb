require 'rails_helper'

RSpec.describe User, type: :model do
  context "associations" do
    it { should have_many(:conversation_members) }
    it { should have_many(:conversations).through(:conversation_members) }
    it { should have_many(:messages) }
  end

  context "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_presence_of(:first_name) }
  end
end
