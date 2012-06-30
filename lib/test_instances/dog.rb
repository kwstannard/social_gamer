require '~/social_gamer/lib/instance.rb'

class Dog < Instance
  attr_accessor :name
  instance_indices :dog_tag
end
