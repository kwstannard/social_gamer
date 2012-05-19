module Linker

  def create_link (instance_1, instance_2)
    links[instance_1][instance_2.class] << instance_2
    links[instance_2][instance_1.class] << instance_1
    nil
  end

  def delete_link(instance_1, instance_2)
    links[instance_1][instance_2.class].delete(instance_2)
    links[instance_2][instance_1.class].delete(instance_1)
    nil
  end

  def get_links(instance, klass)
    links[instance][klass].dup
  end

  private

  def links
    @links ||= Hash.new{|hash, key| hash[key] = Hash.new{|hash, key| hash[key] = []} }
  end

end

module InstanceHandler

  def load_instances
    dir = File.expand_path("../../app/instances/", __FILE__)
    Dir["#{dir}/*"].each do |file|
      require file
      create_methods(file)
    end
  end

  def create_methods(file)
    klass_name = file.scan(/\/([^\/]+)\.rb/).first.first
    klass = Module.const_get(klass_name.capitalize)
    make_class_getter(klass, klass_name)
    make_getter(klass, klass_name)
  end

  def make_class_getter(klass, klass_name)
    instance_eval <<-CODE
      def #{klass_name}s
        instances["#{klass}"].dup
      end
    CODE
  end

  def make_getter(klass, klass_name)
    instance_eval <<-CODE
      def get_#{klass_name}(id)
        instances["#{klass}"][id].dup
      end
    CODE
  end

  def absorb(instance)
    klass = instance.class
    instances[klass][instance.id] = instance
  end
  
  private

  def instances
    @instances ||= Hash.new{|hash, key| hash[key] = {}}
  end

  #TODO move this instance specific stuff after gemifying application file
#  def people
#    instances[Person] ||= {}
#  end
#
#  def get_person(id)
#    people[id]
#  end
#
#  def enroll_person(person)
#    people[person.id] = person
#  end
#
#  def unenroll_person(person)
#    people.delete(person.id)
#  end

#  def enter_a_game(person, game)
#    person.add_to_games(game)
#    game.add_to_players(person)
#  end
#
#  def leave_a_game(person, game)
#    person.remove_from_games(game)
#    game.remove_from_players(person)
#  end

end

class Application

  include Linker
  include InstanceHandler

end
