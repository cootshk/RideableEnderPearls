#generate configs
scoreboard objectives add PearlConfig dummy
scoreboard players set AllowStasisChambers PearlConfig 1
scoreboard players set BreakInWater PearlConfig 0

#generate list of initialized players
scoreboard objectives add Initialized dummy

#generate list of players who are riding pearls
scoreboard objectives add RidingPearls dummy

#generate triggers
scoreboard objectives add RidePearls trigger
scoreboard objectives add StopRidingPearls trigger
scoreboard objectives add PearlHelp trigger
scoreboard objectives add ConfigurePearls trigger