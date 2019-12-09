# My CLI controller - responsible for business logic or user interactions
require_relative '../persona'
require_relative '../compendium'
require_relative '../scraper'


class CLI
  def option_1
    print compendium.all_persona_by_name
    puts "Please select a number 1 to 225!\n"
    answer = get.strip
    Persona.all.
  end
  def option_2
    puts "Please enter a Persona's name. If incorrect you will be taken to the list of persona's"
    answer = get.strip
    Persona.find_by_name(answer)
  end
  def option_3
    puts "Please input the element."
    element = gets.strip
    puts "Please input the effect"
    effect = gets.strip
    print Compendium.elements(element,effect)
  end
  def option_4
    puts "Please input the Acrana."
    tarot = gets.strip
    Compendium.acrana(tarot)
  end

  def call
    puts "Welcome to The Person 5 Comdendium! Please allow a moment for the information to be gathered!\n"
    scrap = Scraper.new
    scrap.get_index_page
    scrap.personal_profile
    scrap.combo_to_make
    compendium = Compendium.new
  end
  def opening
    puts "What would be best in your search (1,2,3, or 4)?\n 1. To list and pick a number for the Personas information.\n 2. To enter the name to then  view the Personas information.\n 3. Search for all persona by what elements effect them(Ex Arsene is weak against ice).\n 4. Search by acana."
    search = get.strip
    if search == "1"

    elsif search == "2"

    elsif search == "3"

    elsif search == "4"

  end
end
