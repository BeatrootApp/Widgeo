# Widgeo

Widgeo provides easy access to the worlds territories and their continents.

## Using Widgeo

Include Widgeo in your Gemfile, `gem "widgeo", require: true` and run `bundle install`.

#### .all

Provides a list of all items.

For a list of continents:

`continents = Widgeo::Continent.all`

and all territories:

`territories = Widgeo::Territory.all`

#### .filter_by

Allows for filtering a list of items.

For a filtered list of territories in the EU:

`territories = Widgeo::Territories.filter_by continent_alpha_2: "EU"`

#### .find_by

Provides a single item matching a specified property and value.

To find a continent by code:

`continent = Continent.find_by :alpha_2, "EU"`

To find a territory by name:

`continent = Territory.find_by :name, "France"`

#### Accessing Properties

All properties of an item are accessible via a getter.

Continents respond to `#name` and `#alpha_2`.

Territories respond to `#name`, `#long_name`, `#alpha_2`, `#continent_alpha_2`, `#continent`. Continent provides an instance of the parent Continent.

#### Tests

The gem is tested with Rspec. You can run the tests with `bundle exec rake spec`.
