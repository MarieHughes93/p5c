class Persona
  attr_reader :name, :level, :arcana, :stats, :elements
  attr_accessor :formulas
  @@all = []
  def initialize(name, arcana, level,stats, elements)
    @name = name
    @arcana = arcana
    @level = level
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
  def formulas=(formulas)
    @formulas = formulas
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
  def display
    puts self.name
    puts self.arcana
    puts self.level
    puts self.stats.map{|k,v| "#{k}: #{v}"}.join(', ')
    puts self.elements.map{|k,v| "#{k}: #{v}"}.join(', ')
  end
end
