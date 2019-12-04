require 'pry'
require_relative 'persona'
class Compendium

  attr_accessor :formulas

  def combinations(name)
  persona  = Persona.all.filter do |p|
      p.name == name
    end
    return persona[0].formulas
  end
  def acrana(tarot)
  personas  = Persona.all.filter do |p|
      p.acrana == tarot
    end
    personas.collect do |p|
       p.name
    end
  end
  def elements(element, value)
    personas = Persona.all.filter do |p|
      p.elements[element] == value
    end
    personas.collect do |p|
      p.name
    end
  end
end
#
# Compendium has persona's
# Compendium has formulas for creating the persona
