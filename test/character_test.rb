require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'

class CharacterTest < MiniTest::Test
  attr_reader :character, :character_2
  def setup
    @character = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
  end

  def test_it_should_exist
    assert_instance_of Character, character
  end

  def test_it_should_have_default_values
    assert_equal "KITT", character.name
    assert_equal "William Daniels", character.actor
    assert_equal 1_000_000, character.salary
  end
end
