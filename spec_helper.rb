test_object_file_path = nil
caller.each do |line|
  correct_line = line.scan(/^.*\/spec\/[^:]*/)
  if !correct_line.empty?
    test_object_file_path = correct_line.first.gsub("/spec/", "/app/").gsub("_spec", "")
    break
  end
end
require test_object_file_path

require '~/social_gamer/rspec_extensions.rb'
