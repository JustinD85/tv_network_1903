require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'

class ShowTest < MiniTest::Test
  attr_reader :knight_rider, :kitt, :michael_knight

  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
  end

  def test_it_should_exist
    assert_instance_of Show, knight_rider
  end

  def test_it_should_have_default_values
    assert_equal "Knight Rider", knight_rider.name
    assert_equal "Glen Larson", knight_rider.creator
    assert_equal [michael_knight, kitt], knight_rider.characters
    assert_equal 2600000, knight_rider.total_salary
  end
  
  def test_it_should_return_highest_paid_character
    assert_equal michael_knight, knight_rider.highest_paid_character
  end

  def test_it_should_return_all_actors_on_payroll
    assert_equal [{"Michael Knight" => 1600000},{"KITT"=> 1000000}], knight_rider.all_characters_with_salary
  end

end
