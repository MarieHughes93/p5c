# My CLI controller - responsible for business logic or user interactions
require_relative '../persona'
require_relative '../compendium'
require_relative '../scraper'


class CLI
  def call
    puts "Welcome to The Person 5 Comdendium! Please allow a moment for the information to be gathered!"
    scrap = Scraper.new
    scrap.get_index_page
    scrap.personal_profile
    scrap.combo_to_make
    puts "Please select a number from the list of 225 Persona to get their level, acrana, stats, & elements!"
    compendium = Compendium.new
    print compendium.all_persona_by_name
    puts "Please select a number 1 to 225!"
  end
end
