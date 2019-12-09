require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative 'persona'
class Scraper
@@all_p = []
  def get_index_page
    print "We are gathering the info!\n"
    doc = Nokogiri::HTML(open("http://mattkwock.com/persona/"))
    list = doc.css(".persona")
    list[0..10].each do |profile_page|
      stuff = profile_page.css("a").attr("href").value
      @@all_p << stuff
    end
    print "We have the info... Give us a moment to get it all sorted out!\n"
  end
  def personal_profile
    @@all_p.each do |stuff|
      url = "http://mattkwock.com" + stuff
      doc = Nokogiri::HTML(open(url))
      name = doc.css("h1.display-4").text
      acrana = doc.css(".arcana span").text
      level = doc.css(".level span").text
      strength = doc.css(".Strength").text
      magic = doc.css(".Magic").text
      endurance = doc.css(".Endurance").text
      agility = doc.css(".Agility").text
      luck = doc.css(".Luck").text
      physical = doc.css(".Physical").text
      gun = doc.css(".Gun").text
      fire = doc.css(".Fire").text
      ice = doc.css(".Ice").text
      electric = doc.css(".Electric").text
      wind = doc.css(".Wind").text
      psychic = doc.css(".Psychic").text
      nuclear = doc.css(".Nuclear").text
      bless = doc.css(".Bless").text
      curse = doc.css(".Curse").text
      stats = {"Strength"=> strength, "Magic"=> magic,"Endurance"=> endurance, "Agility" => agility, "Luck"=> luck}
      elements = {"Physical"=> physical, "Gun"=> gun, "Fire"=> fire, "Ice"=> ice, "Electric"=> electric, "Wind"=> wind, "Psychic"=> psychic, "Nuclear"=> nuclear, "Bless"=> bless,"Curse"=>curse}
      Persona.new(name, acrana, level, stats, elements)
    end
    print "We have the Persona!\n"
  end
  def combo_to_make
    @@all_p.each do |stuff|
      url = "http://mattkwock.com" + stuff
      doc = Nokogiri::HTML(open(url))
      name = doc.css("h1.display-4").text
      persona = Persona.find_by_name(name)
      fusion_table = doc.css(".combo-to tr.combo")
      fusion_table.each do |combo|
        persona1 = combo.css(".first-persona").text
        persona2 = combo.css(".last-persona").text
        formula = persona1 + "and" + persona2
        persona.formulas << formula
      end
    end
    print "All the combinations have been calculated.\n"
  end
end
