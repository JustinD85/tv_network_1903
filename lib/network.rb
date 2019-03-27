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
end
