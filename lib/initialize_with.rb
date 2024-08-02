require "initialize_with/version"

module InitializeWith
  def initialize *args
    self.class._validate_initialization_parameters! *args
    self.class._apply_initialization_parameters self, *args
  end

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def initialize_with *args, **kwargs
      @_initialize_with ||= []
      @_initialize_with += args
      args.each { |name| attr_reader name }

      @_initialize_with_optional ||= {}
      @_initialize_with_optional.merge! kwargs
      kwargs.each { |name, _default| attr_reader name }
    end

    def _validate_initialization_parameters! *args
      max_args = @_initialize_with.size + @_initialize_with_optional.size
      raise ArgumentError, "wrong number of arguments (given #{args.size}, expected #{@_initialize_with.size})" unless args.size >= @_initialize_with.size
      raise ArgumentError, "wrong number of arguments (given #{args.size}, expected #{@_initialize_with.size..(max_args)})" unless args.size <= max_args
    end

    def _apply_initialization_parameters instance, *args
      names = @_initialize_with + @_initialize_with_optional.keys
      values = args + @_initialize_with_optional.values
      names.zip(values).each do |name, val|
        instance.instance_variable_set("@#{name}", val)
      end
    end
  end
end
