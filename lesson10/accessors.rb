module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        var_name_history = "@#{name}_history".to_sym
        var_value_history = instance_variable_get(var_name_history)
        if var_value_history.nil?
          instance_variable_set(var_name_history, [])
        else
          old_value = instance_variable_get(var_name)
          var_value_history << old_value
        end
        instance_variable_set(var_name, value)
      end
      define_method("#{name}_history") { instance_variable_get("@#{name}_history.to_sym") }
    end
  end

  def strong_attr_accessor(name, type)
    var_name = "@#{name}.to_sym"
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise 'Classes are different' if value.class != type

      instanse_variable_set(var_name, value)
    end
  end
end
