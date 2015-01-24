module Widgeo

  class Territory

    extend Widgeo::Collection
    include Widgeo::Model

    attr_reader :name, :long_name, :alpha_2, :continent_alpha_2

    dataset_file :territories

    # Load an instance of the continent
    def continent

      Continent.find_by :alpha_2, continent_alpha_2

    end

  end

end
