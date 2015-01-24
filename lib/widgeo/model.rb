module Widgeo

  module Model

    # Set attributes on the instance
    def initialize properties

      properties.each { |name, value|

        # Raise an exception if we don't have a getter for the property
        raise UndefinedFieldError unless respond_to? name

        instance_variable_set("@#{name}", value)

      }

    end

  end

end
