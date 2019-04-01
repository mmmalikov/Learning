module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      @count_of_instances
    end

    def init_instances
      @count_of_instances ||= 0
      @count_of_instances += 1
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.init_instances
    end
  end
end