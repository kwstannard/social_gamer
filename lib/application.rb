require '/home/kelly/social_gamer/lib/handlers/instance_handler'
require '/home/kelly/social_gamer/lib/handlers/link_handler'
require '/home/kelly/social_gamer/lib/interfaces/session_interface'

class Application

  include LinkHandler
  include InstanceHandler
  include SessionInterface

  attr_accessor :name

  def initialize(options = {})
    load_instances
    @name = options[:name]
  end

end
