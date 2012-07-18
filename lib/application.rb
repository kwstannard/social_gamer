require 'the_blob'
require File.expand_path('../interfaces/session_interface', __FILE__)

class Application

  include TheBlob
  include SessionInterface

  attr_accessor :name

  def initialize(options = {})
    @name = options[:name]
  end

end
