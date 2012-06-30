module InstanceHandler

  def load_instances
    dir = File.expand_path("../../../app/instances/", __FILE__)
    Dir["#{dir}/*"].each do |file|
      require file
      create_methods(file)
    end
  end

  def absorb(instance)
    klass = instance.class
    instance_lists[klass.to_s] << instance
    klass.get_instance_indices.each do |index|
      instances[klass.to_s]["__#{index}"][instance.send(index)] = instance
    end
  end
  
  private

  def instances
    hash = proc{|a| Hash.new{|hash, key| hash[key] = a} }
    @instances ||= hash.call( hash.call( hash.call( nil ) ) )
  end

  def instance_lists
    @instance_lists ||= Hash.new{|hash, key| hash[key] = Array.new }
  end

  def create_methods(file)
    klass = file.scan(/\/([^\/]+)\.rb/).first.first
    make_class_getter(klass)
    make_index_getters(klass)
  end

  def make_class_getter(klass)
    instance_eval <<-CODE
      def #{klass}s
        instance_lists["#{klass.capitalize}"]
      end
    CODE
  end

  def make_index_getters(klass)
    Module.const_get(klass.capitalize).get_instance_indices.each do |index|
      instance_eval <<-CODE
        def get_#{klass}_by_#{index}(id)
          instances["#{klass.capitalize}"]["__#{index}"][id]
        end
      CODE
    end
  end

end
