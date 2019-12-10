# My CLI controller - responsible for business logic or user interactions
require_relative '../persona'
require_relative '../compendium'
require_relative '../scraper'
require 'pry'
require 'colorize'

class CLI
  def self.exit
    input = "exit"
  end
  def self.option_1
    print Compendium.all_persona_by_name
    puts "Ruji: Come on man, select a number 1 to 225. We have treasures to unlock!\n".yellow
    answer = gets.strip
    choice = Persona.all[answer.to_i-1]
    puts "I am thou...\n"
    sleep(1.5)
    puts "Thou art I...\n".red
    sleep(1.5)
    puts "Ryuji: I got the persona you asked for Joker!\n".blue
    sleep(1.5)
    print "#{choice.display}\n".green
    sleep(5.5)
    puts "Futaba: Would you like to see the possible combinations to create this persona? (y/n)\n".yellow
    reply = gets.strip
    if reply == "y"
      a = Compendium.combinations(choice.name)
      print a.join(', ').green
      sleep(5.5)
      CLI.exit
    elsif reply == "n"
      CLI.exit
    else
      puts "Futaba: Invalid input. You will returned to the selection options.".yellow
      CLI.exit
    end
  end
  def self.option_2
    puts "Yusuke: Please enter a Persona's name with a capital letter.(EX:Arson). To get your persona we must have nothing less than PERFECTION!!!\n".yellow
    answer = gets.strip
    choice = Persona.find_by_name(answer)
    puts "I am thou...\n"
    sleep(1.5)
    puts "Thou art I...\n".red
    sleep(1.5)
    puts "Yusuke: I found your persona. What?! Did you expect anything less?!\n".blue
    sleep(1.5)
    print "#{choice.display}\n".green
    sleep(5.5)
    puts "Futaba: Would you like to see the possible combinations to create this persona? (y/n)\n".yellow
    reply = gets.strip
    if reply == "y"
      a = Compendium.combinations(choice.name)
      print a.join(', ').green
      sleep(5.5)
      CLI.exit
    elsif reply == "n"
        CLI.exit
    else
      puts "Futaba: Invalid input. You will returned to the selection options.\n".yellow
      CLI.exit
    end
  end
  def self.option_3
    puts "Anna: Please input the element.\n
    Just in case you forgot them : Physical, Gun, Fire, Ice, Electric, Wind, Nuclear,Psychic, Bless, or Curse\n".yellow
    element = gets.strip
    puts "Please input the effect.\n
    Just in case you forgot them : Weak, Absorb, Repel, Null or - (for no effect)\n".yellow
    value = gets.strip
    results = Compendium.elements(element,value)
    perfect_results = results.join(', ')
    puts "I am thou...\n"
    sleep(1.5)
    puts "Thou art I...\n".red
    sleep(1.5)
    puts "Anna: This is what you were looking for right?\n".blue
    sleep(1.5)
    print "#{perfect_results}\n".green
    sleep(5.5)
  end
  def self.option_4
    puts "Haru: Please input the Arcana.\n
    Which are you wanting? Fool, Magician, Priestess, Empress, Emperor, Hierophant, Lovers, Chariot, Justice, Hermit, Fortune, Strength, Hanged Man, Death, Temperance, Devil, Tower, Star, Moon, Sun, or Judgement\n".yellow
    tarot = gets.strip
    results = Compendium.arcana(tarot)
    perfect_results = results.join(', ')
    puts "I am thou...\n"
    sleep(1.5)
    puts "Thou art I...\n".red
    sleep(1.5)
    puts "Haru: I got everything you need Joker!\n".blue
    sleep(1.5)
    print "#{perfect_results}\n".green
    sleep(5.5)
  end

  def call
    puts "Futaba: Hi there! Welcome to The Person 5 Comdendium! So glad to speak with you again, Joker! Gimme' a moment to get the team together to help get everything for you!\n".blue
    scrap = Scraper.new
    scrap.get_index_page
    scrap.personal_profile
    scrap.combo_to_make
    compendium = Compendium.new
  end
  def opening
    input = ''
    while input != "exit"
      puts "\n Futaba: Well, what can I help you out with boss? What would be the best way to search (1,2,3, or 4)?\n
      1. To list and pick a number for the Personas information.\n
      2. To enter the name to then  view the Personas information.\n
      3. Search for all persona by what elements effect them(Ex Arsene is weak against ice).\n
      4. Search by Arcana.\n
      5. Exit program\n".yellow
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
        print "Everyone: It's show time!\n".red
        sleep(1.5)
        print "Morgona: Everyone hop in!\n".red
        sleep(1.5)
        print "*car noises*\n".yellow
        sleep(1.5)
        input = "exit"
      end
    end
  end
end
