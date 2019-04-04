module Accessor
  def attr_accessor_with_history(*names)
    names.each do |name|
      variable = "@#{name}".to_sym
      puts variable
      variable_history = "@#{name}_history".to_sym
      puts variable_history
      define_method(name) { instance_variable_get(variable) }
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(variable, value)
        instance_variable_set(variable_history, []) unless instance_variable_get(variable_history)
        instance_variable_get(variable_history) << value
      end
      define_method("#{name}_history".to_sym) { instance_variable_get(variable_history) }
    end
  end

  def strong_attr_acessor(variable, variable_type)
    variable = "@#{name}".to_sym
    define_method(names) { instance_variable_get(variable) }
    define_method("#{name}".to_sym) do |value|
      raise ArgumentError, "'#{value}' is not #{variable_type}" unless value.is_a?(variable_type)
      instance_variable_set(variable, value)
    end
  end
end