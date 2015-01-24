require "spec_helper"

describe Widgeo::Continent do

  CONTINENT_COUNT = 7
  INVALID_CONTINENT = { bad_field: "BAD FIELD" }
  CONTINENT_ALPHA = "EU"
  VALID_CONTINENT = { name: "Beatland", alpha_2: "BE" }
  CONTINENT_FIELDS = [:name, :alpha_2]

  subject { Widgeo::Continent.new VALID_CONTINENT }

  it { is_expected.to respond_to *CONTINENT_FIELDS }

  context "given an invalid dataset" do

    subject { -> { Widgeo::Continent.new INVALID_CONTINENT } }

    it { is_expected.to raise_error Widgeo::UndefinedFieldError }

  end

  describe ".find_by" do

    subject(:continent) { Widgeo::Continent.find_by :alpha_2, CONTINENT_ALPHA }

    it { expect(continent).to be_kind_of Widgeo::Continent }
    it { expect(continent.alpha_2).to eq CONTINENT_ALPHA }

  end

  describe ".all" do

    subject(:continents) { Widgeo::Continent.all }

    it { expect(continents).to be_kind_of Array }
    it { expect(continents.size).to be CONTINENT_COUNT }
    it { expect(continents.first).to be_kind_of Widgeo::Continent }

  end

end
