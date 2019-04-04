module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(variable, type, options = nil)
      @validations ||= []
      @validations << { name: variable, type: type, options: options }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        send "validation_#{validation[:type]}", validation[:name], validation[:options]
      end
    end

    def valid?
      validate!
      true
    rescue
      false
    end

    private

    def validation_presence(value, _options = nil)
      raise ArgumentError, 'Empty or nil value' if send(value).to_s.empty?
    end

    def validation_format(value, format_value)
      raise ArgumentError, 'Wrong format' if send(value) !~ format_value
    end

    def validation_type(value, type)
      raise ArgumentError, 'Wrong type' unless send(value).is_a?(type)
    end
  end
end