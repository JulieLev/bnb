require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  # has n, :spaces

  property :id, Serial
  property :name, String, required: true
  property :password_digest, String, length: 60
  property :email, String, required: true, format: :email_address, unique: true


  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(my_password)
    @password = my_password
    self.password_digest = BCrypt::Password.create(my_password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
