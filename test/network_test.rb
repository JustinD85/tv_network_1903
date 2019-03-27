require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'
require './lib/network'

class NetworkTest < MiniTest::Test
  attr_reader :network, :nbc, :knight_rider, :parks_and_rec
              :michael_knight, :kitt, :leslie_knope, :ron_swanson

  def setup
    @network = Network.new("NBC")
    @nbc = Network.new("NBC")
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

  end

  def test_it_should_exist
    assert_instance_of Network, network
  end

  def test_it_should_have_default_values
    assert_equal "NBC", network.name
    assert_equal [], network.shows
  end

  def test_it_can_add_shows

    assert_equal [knight_rider, parks_and_rec], nbc.shows

  end

  def test_it_can_return_highest_paid_actor
    assert_equal "Amy Poehler", nbc.highest_paid_actor
  end

  def test_it_should_return_all_actors_on_payroll
    assert_equal 
  end
end
