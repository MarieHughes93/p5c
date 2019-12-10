# My CLI controller - responsible for business logic or user interactions
require_relative '../persona'
require_relative '../compendium'
require_relative '../scraper'
require 'pry'


class CLI
  def self.exit
    input = "exit"
  end
  def self.option_1
    print Compendium.all_persona_by_name
    puts "Please select a number 1 to 225!\n"
    answer = gets.strip
    choice = Persona.all[answer.to_i-1]
    choice.display
    puts "Would you like to see the possible combinations to create this persona? (y/n)"
    reply = gets.stripg
    if reply == "y"
      a = Compendium.combinations(choice)
      print a.join(', ')
      CLI.exit
    elsif reply == "n"
        CLI.exit
    else
      puts "Invalid input. You will returned to the selection options."
      CLI.exit
    end
  end
  def self.option_2
    puts "Please enter a Persona's name with a capital letter.(EX:Arson)\n"
    answer = gets.strip
    choice = Persona.find_by_name(answer)
    choice.display
    puts "Would you like to see the possible combinations to create this persona? (y/n)\n"
    reply = gets.strip
    if reply == "y"
      a = Compendium.combinations(choice)
      print a.join(', ')
      CLI.exit
    elsif reply == "n"
      CLI.exit
    end
  end
  def self.option_3
    puts "Please input the element.\n
    (Physical, Gun, Fire, Ice, Electric, Wind, Nuclear,Psychic, Bless, or Curse)\n"
    element = gets.strip
    puts "Please input the effect.\n
    (Weak, Absorb, Repel, or Null)\n"
    value = gets.strip
    stuff = Compendium.elements(element,value)
    print stuff.join(', ')
  end
  def self.option_4
    puts "Please input the Arcana.\n
    (Fool, Magician, Priestess, Empress, Emperor, Hierophant, Lovers, Chariot, Justice, Hermit, Fortune, Strength, Hanged Man, Death, Temperance, Devil, Tower, Star, Moon, Sun, Judgement, World)\n"
    tarot = gets.strip
    a = Compendium.arcana(tarot)
    print a.join(', ')
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
    input = ''
    while input != "exit"
      puts "\n What would be best in your search (1,2,3, or 4)?\n
      1. To list and pick a number for the Personas information.\n
      2. To enter the name to then  view the Personas information.\n
      3. Search for all persona by what elements effect them(Ex Arsene is weak against ice).\n
      4. Search by Arcana.\n
      5. Exit program\n"
      search = gets.strip
      if search == "1"
        CLI.option_1
      elsif search == "2"
        CLI.option_2
      elsif search == "3"
        CLI.option_3
      elsif search == "4"
        CLI.option_4
      elsif search == "5"
        input = "exit"
      end
    end
  end
end
