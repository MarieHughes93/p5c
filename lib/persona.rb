class Persona
  attr_reader :name, :level, :acrana, :rarity, :stats, :elements
  def initialize(name, level, acrana, rarity = nil)
    @name = name
    @level = level
    @acrana = acrana
    @rarity = rarity
    @stats = {}
    @elements = {}
  end
  def stats=(stats)
    @stats = stats
  end
  def elements=(elements)
    @elements = elements
  end

end

# Arsene = Persona.new("Arsene", "1", "Fool")
# Arsene.stats = {"Strength"=> "2","Magic"=>	"2","Endurance"=>	"2","Agility"=>"3","Luck"=> "1"}
# Arsene.elements = {"Physical"=>	nil,"Gun"=>	nil,"Fire"=>	nil,"Ice"=>	"Weak","Electric"=>	nil,"Wind"=>	nil,"Psychic"=>	nil,"Nuclear"=>	nil,"Bless"=>	"Weak","Curse"=> "Resist"}
# print Arsene.name
# print Arsene.stats

#
# Persona has
# level
# rarity
# arcana

# Some have but not all!!
# stats
# Elemental effects
