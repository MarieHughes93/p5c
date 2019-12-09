class Persona
  attr_reader :name, :level, :acrana, :stats, :elements
  attr_accessor :formulas
  @@all = []
  def initialize(name, level, acrana,stats, elements)
    @name = name
    @level = level
    @acrana = acrana
    @stats = stats
    @elements = elements
    @formulas = []
    @@all << self
  end
  def stats=(stats)
    @stats = stats
  end
  def elements=(elements)
    @elements = elements
  end
  def self.all
    return @@all
  end
  def self.all_names
    persona = @@all.each_with_index.collect do |p, i|
      "#{i+1}. #{p.name}\n"
    end
    return persona
  end
  def self.find_by_name(name)
    persona = @@all.filter do |p|
      p.name == name
    end
    return persona[0]
  end
end
