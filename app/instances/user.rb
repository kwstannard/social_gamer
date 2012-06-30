require '~/social_gamer/lib/instance.rb'
require 'bcrypt'

class User < Instance
  attr_accessor :password, :password_confirmation, :password_hash, :password_salt
  instance_indices :email

  def password=(val)
    @password = val
    encrypt_password unless val.nil? || val.empty?
  end

  def encrypt_password
    @password_salt = BCrypt::Engine.generate_salt
    @password_hash = BCrypt::Engine.hash_secret(@password, @password_salt)
  end

end
