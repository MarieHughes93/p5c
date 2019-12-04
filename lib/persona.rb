class Persona
  attr_reader :name, :level, :acrana, :stats, :elements
  attr_accessor :formulas
  # formulas will be a list stating this plus this equals this
  #
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
  def self.find_by_name(name)
    persona = @@all.filter do |p|
      p.name == name
    end
    return persona[0]
  end
end


# Arsene = Persona.new("Arsene", "1", "Fool")
# Arsene.stats = {"Strength"=> "2","Magic"=>	"2","Endurance"=>	"2","Agility"=>"3","Luck"=> "1"}
# Arsene.elements = {"Physical"=>	nil,"Gun"=>	nil,"Fire"=>	nil,"Ice"=>	"Weak","Electric"=>	nil,"Wind"=>	nil,"Psychic"=>	nil,"Nuclear"=>	nil,"Bless"=>	"Weak","Curse"=> "Resist"}
# print Arsene.name
# print Arsene.stats
# Arsene.formulas= ["Obariyon and	High Pixie",
# "Obariyon and	Izanagi",
# "Obariyon and	Izanagi Picaro",
# "Obariyon and	Orpheus",
# "Obariyon and	Orpheus Picaro",
# "Obariyon and	Decarabia"]
#
# Persona has
# level
# rarity
# arcana

# Some have but not all!!
# stats
# Elemental effects
