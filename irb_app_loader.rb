['app/instances/'].each do |path|
  Dir["#{path}*.rb"].each {|file| require "#{Dir.pwd}/#{file}" }
end
