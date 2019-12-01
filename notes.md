Build a cli gem outline
1. Plan gem, imagine the interface
2. Start with the project structure - google
3. Start with the entry point - the file run
4. Force that to build the CLI interface
5. Stub out the interface
6. Start making things real
7. Discover objects
8. Program


- A command line interface that allows a user to select a listed monster from the game persona5
When selected it will give the stats and elements effects
User can then chose to go back to the list of monsters or see possible combination for fusion of monster

Users selects Arsene
Gets:
LVL 1
Arcana: Fool
Strength/Magic/Endurance/Agility/Luck
2/2/2/3/1
Physical	Gun	Fire	Ice	Electric	Wind	Psychic	Nuclear	Bless	Curse
-/-/-/wk/-/-/-/-/wk/rs
EX2:
Would you like to see possible combinations to create this persona? (Y/N) If not you will be returned to the list of monsters.
If user puts Y
They get:
Regent +	Obariyon
Pixie + Obariyon
Stone of Scone + Obariyon
Orlov + Obariyon
Emperor's Amulet +	Obariyon
