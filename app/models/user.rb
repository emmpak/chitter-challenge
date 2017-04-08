require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,               Serial
  property :first_name,       String, required: true
  property :last_name,        String, required: true
  property :email,            String, required: true, :format => :email_address, unique: true
  property :username,         String, required: true, unique: true
  property :password_digest,  Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
