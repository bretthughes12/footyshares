# Create an initial admin user so that the site can be administered
user = User.new(:login => 'admin',
                :name => 'Admin User',
                :password => 'secret',
                :password_confirmation => 'secret',
                :email => 'bretthughes12@gmail.com',
                :starting_shares => 50 )
user.admin = true
user.save

# Create each round
round_1 = Round.create(:name => 'Week 1')
round_2 = Round.create(:name => 'Week 2')
round_3 = Round.create(:name => 'Week 3')
round_4 = Round.create(:name => 'Week 4')

# Create each of the matches to be played
Match.create([{ :name => '1st Qualifying Final', :round_id => round_1.id },
              { :name => '2nd Qualifying Final', :round_id => round_1.id },
              { :name => '1st Elimination Final', :round_id => round_1.id },
              { :name => '2nd Elimination Final', :round_id => round_1.id },
              { :name => '1st Semi Final', :round_id => round_2.id },
              { :name => '2nd Semi Final', :round_id => round_2.id },
              { :name => '1st Preliminary Final', :round_id => round_3.id },
              { :name => '2nd Preliminary Final', :round_id => round_3.id },
              { :name => 'Grand Final', :round_id => round_4.id, :venue => 'MCG', :allow_only_one_team => true },])
