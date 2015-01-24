require "widgeo/version"
require "widgeo/collection"
require "widgeo/model"
require "widgeo/continent"
require "widgeo/territory"

module Widgeo

  require "yaml"

  class UndefinedDatasetError < StandardError; end
  class UndefinedFieldError < StandardError; end

end
