require './lib/character'

class Show
  attr_reader :name, :creator, :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    @characters.sum { |char| char.salary }
  end

  def highest_paid_character
    @characters.max_by { |char| char.salary }
  end

  def all_characters_with_salary
    @characters.map { |char|  [char.name, char.salary]}
  end

end
