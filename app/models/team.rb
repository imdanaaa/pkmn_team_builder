class Team < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, presence: true
  has_many :pokemon
  belongs_to :trainer
end
