module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(name, type, *params)
      @validations ||= []
      @validations << { name: name, type: type, params: params }
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandartError
      false
    end

    def validate!
      self.class.validations.each do |validation|
        validation_value = instanse_variable_get("@#{validation[:name]}")
        send validation[:validation_type], validation_value, validation[:params]
      end
    end

    def presence(name)
      raise 'Value can`t be nil or empty!' if name.nil? || name.empty?
    end

    def type(name, type)
      raise 'Wrong type!' unless name.is_a?(type)
    end

    def format(name, format)
      raise 'Wrong format!' if name !~ format
    end
  end
end
