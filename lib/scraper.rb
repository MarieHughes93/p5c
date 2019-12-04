require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
@@all_p = []
  def get_index_page
    doc = Nokogiri::HTML(open("http://mattkwock.com/persona/"))
    list = doc.css(".persona")
    list.each do |profile_page|
      stuff = profile_page.css("a").attr("href").value
      @@all_p << stuff

    end
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
      Peraon
    end
  end
  def combo_to_make
    @@all_p.each do |stuff|
      url = "http://mattkwock.com" + stuff
      doc = Nokogiri::HTML(open(url))
      fusion_table = doc.css(".combo-to tr.combo")
      fusion_table.each do |combo|
        persona1 = combo.css(".first-persona").text
        formula = persona1 + persona2
        binding.pry
      end
    end
  end
  def when_combined_with
    @@all_p.each do |stuff|
      url = "http://mattkwock.com" + stuff
      doc = Nokogiri::HTML(open(url))
    end
  end
end
scrap = Scraper.new
scrap.get_index_page
print scrap.combo_to_make
