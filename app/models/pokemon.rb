class Pokemon < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, presence: true
  belongs_to :team
end
