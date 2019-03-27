require './lib/show'

class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def highest_paid_actor
    show = @shows.max_by { |show| show.highest_paid_character.salary }
    show.highest_paid_character.actor
  end

  def payroll
    all_chars = @shows.reduce({}) do |acc, show|
      show.all_characters_with_salary.each { |char| acc[char.first] = char.last}
      acc
    end
    all_chars
  end

end
