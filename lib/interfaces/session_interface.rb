require 'bcrypt'

class NoUserFound < RuntimeError; end
class WrongPassword < RuntimeError; end

module SessionInterface
  def fetch_user(email)
    emit_user_by_email(email)
  rescue InstanceHandler::InstanceNotFound
    raise NoUserFound
  end

  def password_matches?(user, password)
    given_password_hash = BCrypt::Engine.hash_secret(password, user.password_salt)
    (user.password_hash == given_password_hash) || (raise WrongPassword)
  end
end
