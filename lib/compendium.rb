require 'pry'
require_relative 'persona'
class Compendium
  attr_accessor :formulas
  def self.all_persona_by_name
    persona = Persona.all_names.join(' ')
    print persona
  end
  def self.combinations(name)
  persona  = Persona.all.filter do |p|
      p.name == name
    end
    return persona[0].formulas
  end
  def self.arcana(tarot)
  personas  = Persona.all.filter do |p|
      p.arcana == tarot
    end
    personas.collect do |p|
       p.name
    end
  end
  def self.elements(element, value)
    personas = Persona.all.filter do |p|
      p.elements[element] == value
    end
    personas.collect do |p|
      p.name
    end
  end
end
