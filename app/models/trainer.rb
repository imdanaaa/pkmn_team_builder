class Trainer < ActiveRecord::Base
  # users.password_hash in the database is a :string

  # validates_presence_of :first_name
  # validates_presence_of :last_name
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :gender
  has_many :teams

#don't need namespace if Bcrypt is required
  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  # can change params as needed
  # feel free to refactor this
  def self.authentication(email, password)
    @user = User.find_by(email: email) #or username
    if @user.password == password
      true
    else
      false
    end
  end
end
