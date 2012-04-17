class Instance
  def self.set_mtm_relations(*args)
    @@mtm_relations = args
    def self.mtm_relations; return @@mtm_relations; end

    args.each do |mtm_relation|
      make_getter_method(mtm_relation)
      make_create_relation_method(mtm_relation)
      make_remove_relation_method(mtm_relation)
    end
  end

  private

  def self.make_getter_method(relation)
    class_eval <<-METHOD
      def #{relation};    @#{relation} ||= [];    end
    METHOD
  end
  
  def self.make_create_relation_method(relation)
    class_eval <<-METHOD
      def add_to_#{relation} (rel)
        #{relation}.push(rel)
      end
    METHOD
  end

  def self.make_remove_relation_method(relation)
    class_eval <<-METHOD
      def remove_from_#{relation} (rel)
        #{relation}.delete(rel)
      end
    METHOD
  end

end
