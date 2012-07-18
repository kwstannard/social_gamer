require 'bcrypt'

class User < Instance
  attr_accessor :password_hash, :password_salt, :locale
  instance_indices :email

  def password=(pass)
    encrypt_password(pass) unless pass.nil? || pass.empty?
  end

  def encrypt_password(pass)
    @password_salt = BCrypt::Engine.generate_salt
    @password_hash = BCrypt::Engine.hash_secret(pass, @password_salt)
  end
end
