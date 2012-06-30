require '/home/kelly/social_gamer/lib/handlers/instance_handler'
require '/home/kelly/social_gamer/lib/handlers/link_handler'
require 'bcrypt'

class Application

  include LinkHandler
  include InstanceHandler

  def initialize
    load_instances
  end

  def make_session(email, password)
    user = get_user_by_email(email)
    user if user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  end

end
