class Seed
  attr_reader :sample_user

  def self.start
    seed = Seed.new
    seed.remove_all_existing_data
    seed.create_users
    seed.display_developer_info
  end

  def remove_all_existing_data
    puts "Clearing out the data currently in your database (Ctrl-C now if that's a bad thing...)"
    sleep(5)
    puts "Too late!"
    User.destroy_all
    ConversationMember.destroy_all
    Conversation.destroy_all
    Message.destroy_all
    puts "Creating fresh, new data"
  end

  def create_users
    number_of_users = 20

    number_of_users.times do
      FactoryGirl.create(:user)
    end

    # generate user for developer log-in
    @sample_user = FactoryGirl.create(:user, email: "user@example.com")

    puts "#{number_of_users} users created"
  end

  def display_developer_info
    puts "\nSample user created"
    puts "\tUser email: '#{@sample_user.email}'"
    puts "\tUser password: 'password'"
  end

  Seed.start
end
