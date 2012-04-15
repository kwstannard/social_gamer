class Instance
  def self.set_mtm_relations(*args)
    @@mtm_relations = args
    def self.mtm_relations; return @@mtm_relations; end

    args.each do |mtm_relation|
      class_eval <<-MTM_METHODS

        def #{mtm_relation};    @#{mtm_relation} ||= [];    end

        def add_to_#{mtm_relation} (relation)
          #{mtm_relation}.push(relation)
        end

        def remove_from_#{mtm_relation} (relation)
          #{mtm_relation}.delete(relation)
        end
      MTM_METHODS
    end
  end
end
