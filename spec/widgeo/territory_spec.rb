require "spec_helper"

describe Widgeo::Territory do

  TERRITORY_COUNT = 254
  INVALID_TERRITORY = { bad_field: "BAD FIELD" }
  TERRITORY_ALPHA = "GB"
  EU_TERRITORY_COUNT = 50
  PARENT_CONTINENT_ALPHA = "EU"

  VALID_TERRITORY = {
    name: "Beatland", long_name: "Peoples republic of Beatland",
    alpha_2: "BE", continent_alpha_2: "EU"
  }

  TERRITORY_FIELDS = [:name, :long_name, :alpha_2, :continent_alpha_2]

  subject { Widgeo::Territory.new VALID_TERRITORY }

  it { is_expected.to respond_to *TERRITORY_FIELDS }

  context "given an invalid dataset" do

    subject { -> { Widgeo::Territory.new INVALID_TERRITORY } }

    it { is_expected.to raise_error Widgeo::UndefinedFieldError }

  end

  describe "#continent" do

    subject (:continent) {
      Widgeo::Territory.find_by(:alpha_2, TERRITORY_ALPHA).continent
    }

    it { expect(continent).to be_kind_of Widgeo::Continent }
    it { expect(continent.alpha_2).to eq PARENT_CONTINENT_ALPHA }

  end

  describe ".find_by" do

    subject(:territory) { Widgeo::Territory.find_by :alpha_2, TERRITORY_ALPHA }

    it { expect(territory).to be_kind_of Widgeo::Territory }
    it { expect(territory.alpha_2).to eq TERRITORY_ALPHA }

  end

  describe ".filter_by" do

    subject(:territories) {
      Widgeo::Territory.filter_by continent_alpha_2: PARENT_CONTINENT_ALPHA
    }

    it { expect(territories).to be_kind_of Array }
    it { expect(territories.size).to be EU_TERRITORY_COUNT }
    it { expect(territories.first).to be_kind_of Widgeo::Territory }

  end

  describe ".all" do

    subject(:territories) { Widgeo::Territory.all }

    it { expect(territories).to be_kind_of Array }
    it { expect(territories.size).to be TERRITORY_COUNT }
    it { expect(territories.first).to be_kind_of Widgeo::Territory }

  end

end
