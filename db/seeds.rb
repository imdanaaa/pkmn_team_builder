trainers = 20.times.map do
  Trainer.create!( :username  => Faker::Internet.trainer_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end
