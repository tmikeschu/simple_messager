class Conversation < ApplicationRecord
  belongs_to :user
  has_many :conversation_members
  has_many :members, through: :conversation_members, source: :user
  has_many :messages

  def add_members(current_user, params)
    user_ids = params["members"].reject(&:empty?) << current_user.id
    user_ids.each { |id| conversation_members.create(user_id: id) }
    save
  end
end
