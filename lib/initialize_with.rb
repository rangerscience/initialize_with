require "initialize_with/version"

module InitializeWith
  def self.included(base)
    base.extend ClassMethods
    base.prepend Initializer
  end

  module Initializer
    def initialize(...)
      super()
      self.class._validate_initialization_parameters!(...)
      self.class._apply_initialization_parameters(self, ...)
    end
  end

  module ClassMethods
    def initialize_with *args, **kwargs
      @_initialize_with ||= []
      @_initialize_with += args
      args.each { |name| attr_reader name }

      @_initialize_with_splat = kwargs.delete(:splat)
      attr_reader @_initialize_with_splat if @_initialize_with_splat

      @_initialize_with_optional ||= {}
      @_initialize_with_optional.merge! kwargs
      kwargs.each { |name, _default| attr_reader name }
    end

    def _validate_initialization_parameters! *args
      @_initialize_with ||= []
      @_initialize_with_optional ||= {}

      max_args = @_initialize_with.size + @_initialize_with_optional.size
      raise ArgumentError, "wrong number of arguments (given #{args.size}, expected #{@_initialize_with.size})" unless args.size >= @_initialize_with.size
      raise ArgumentError, "wrong number of arguments (given #{args.size}, expected #{@_initialize_with.size..(max_args)})" if @_initialize_with_splat.nil? && args.size > max_args
    end

    def _apply_initialization_parameters instance, *args
      names = @_initialize_with + @_initialize_with_optional.keys
      values = args + @_initialize_with_optional.values
      names.zip(values).each do |name, val|
        instance.instance_variable_set("@#{name}", val)
      end

      if @_initialize_with_splat
        instance.instance_variable_set("@#{@_initialize_with_splat}", values[names.size...-1])
      end
    end
  end
end
