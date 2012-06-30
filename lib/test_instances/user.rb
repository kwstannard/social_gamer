require '~/social_gamer/lib/instance.rb'

class User < Instance
  attr_accessor :password
  instance_indices :email
end
