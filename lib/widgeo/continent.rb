module Widgeo

  class Continent

    extend Widgeo::Collection
    include Widgeo::Model

    attr_reader :name, :alpha_2

    dataset_file :continents

  end

end
