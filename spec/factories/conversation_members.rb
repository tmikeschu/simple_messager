FactoryGirl.define do
  factory :conversation_member do
    conversation
    user
  end
end
