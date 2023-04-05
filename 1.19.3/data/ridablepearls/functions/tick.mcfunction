#ride all ridable pearls
execute as @e[type=minecraft:ender_pearl,tag=notriding] at @s if score @p RidingPearls matches 1 run ride @p mount @s
#dismount stasis chambers
execute if score AllowStasisChambers PearlConfig matches 1 PearlConfig as @e[type=minecraft:ender_pearl,tag=riding] at @s if block ~ ~ ~ minecraft:bubble_column run ride @p dismount
#option to ban stasis chambers
execute if score AllowStasisChambers PearlConfig matches 0 PearlConfig as @e[type=minecraft:ender_pearl] at @s if block ~ ~-1 ~ minecraft:bubble_column run kill @s
#option to break pearls in water
execute if score BreakInWater PearlConfig matches 1 PearlConfig as @e[type=minecraft:ender_pearl,tag=riding] at @s if block ~ ~ ~ minecraft:water run kill @s
#generate tags for a pearl to be ridden
execute as @e[type=minecraft:ender_pearl,tag=notriding] run data merge entity @s {Tags:["riding"]}
execute as @e[type=minecraft:ender_pearl] at @s unless data entity @s {Tags:["riding"]} unless data entity @s {Tags:["notriding"]} align xyz unless block ~ ~-1 ~ minecraft:bubble_column run data merge entity @s {Tags:["notriding"]}

#display config for creative mode players (trigger)
execute as @a[gamemode=creative] if score @s ConfigurePearls matches 1 if score @s Initialized matches 1 run tellraw @s ["",{"text":"#############################################","bold":true,"color":"gold"},"\n",{"text":"# ","bold":true,"color":"gold"},{"text":"Allow Pearl Stasis Chambers","underlined":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/execute as @s run scoreboard players set AllowStasisChambers PearlConfig 3"}},{"text":" # ","bold":true,"color":"gold"},{"text":"Ban Pearl Stasis Chambers","underlined":true,"color":"dark_red","clickEvent":{"action":"run_command","value":"/execute as @s run scoreboard players set AllowStasisChambers PearlConfig 2"}},{"text":" #","bold":true,"color":"gold"},"\n",{"text":"#############################################","bold":true,"color":"gold"},"\n",{"text":"# ","bold":true,"color":"gold"},{"text":"Break Ender Pearls In Water","underlined":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/execute as @s run scoreboard players set BreakInWater PearlConfig 3"}},{"text":" # ","bold":true,"color":"gold"},{"text":"Keep Ender Pearls In Water","underlined":true,"color":"dark_red","clickEvent":{"action":"run_command","value":"/execute as @s run scoreboard players set BreakInWater PearlConfig 2"}},{"text":" #","bold":true,"color":"gold"},"\n",{"text":"#############################################","bold":true,"color":"gold"}]
execute as @a[gamemode=creative] if score @s ConfigurePearls matches 1 if score AllowStasisChambers PearlConfig matches 2 run tellraw @s ["",{"text":"Pearl Stasis Chambers Are Banned!","color":"dark_red"}]
execute if score @s ConfigurePearls matches 1 if score AllowStasisChambers PearlConfig matches 2 run scoreboard players set AllowStasisChambers PearlConfig 0
execute as @a[gamemode=creative] if score @s ConfigurePearls matches 1 if score AllowStasisChambers PearlConfig matches 3 run tellraw @s ["",{"text":"Pearl Stasis Chambers Are Allowed!","color":"dark_green"}]
execute if score @s ConfigurePearls matches 1 if score AllowStasisChambers PearlConfig matches 3 run scoreboard players set AllowStasisChambers PearlConfig 1
execute as @a[gamemode=creative] if score @s ConfigurePearls matches 1 if score BreakInWater PearlConfig matches 2 run tellraw @s ["",{"text":"Ender Pearls Will Not Break In Water!","color":"dark_red"}]
execute if score @s ConfigurePearls matches 1 if score BreakInWater PearlConfig matches 2 run scoreboard players set BreakInWater PearlConfig 0
execute as @a[gamemode=creative] if score @s ConfigurePearls matches 1 if score BreakInWater PearlConfig matches 3 run tellraw @s ["",{"text":"Ender Pearls Will Break In Water!","color":"dark_green"}]
execute if score @s ConfigurePearls matches 1 if score BreakInWater PearlConfig matches 3 run scoreboard players set BreakInWater PearlConfig 1
#if not in creative mode
execute as @a[gamemode=!creative] if score @s ConfigurePearls matches 1 ConfigurePearls run tellraw @s ["",{"text":"You must be in creative mode to configure ender pearls!","color":"dark_red"}]
execute as @a if score @s ConfigurePearls matches 1 ConfigurePearls run scoreboard players set @s ConfigurePearls 0

#ride pearls (trigger)
execute as @a if score @s RidePearls matches 1 if score @s RidingPearls matches 1 run tellraw @s ["",{"text":"You can already ride ender pearls!","color":"dark_red"}]
execute as @a if score @s RidePearls matches 1 if score @s RidingPearls matches 0 run tellraw @s ["",{"text":"You can now ride ender pearls!","color":"dark_green"}]
execute as @a if score @s RidePearls matches 1 run scoreboard players set @s RidingPearls 1
execute as @a if score @s RidePearls matches 1 run scoreboard players set @s RidePearls 0

#stop riding pearls (trigger)
execute as @a if score @s StopRidingPearls matches 1 if score @s RidingPearls matches 1 run tellraw @s ["",{"text":"You are not riding ender pearls currently!","color":"dark_red"}]
execute as @a if score @s StopRidingPearls matches 1 if score @s RidingPearls matches 0 run tellraw @s ["",{"text":"You can now ride ender pearls!","color":"dark_green"}]
execute as @a if score @s StopRidingPearls matches 1 run scoreboard players set @s RidingPearls 0
execute as @a if score @s StopRidingPearls matches 1 run scoreboard players set @s StopRidingPearls 0

#display help menu (trigger)
execute as @a if score @s PearlHelp matches 1 if score @s Initialized matches 1 PearlConfig run tellraw @p ["",{"text":"############################","bold":true,"color":"gold"},"\n",{"text":"# ","bold":true,"color":"gold"},{"text":"Ride Pearls!","underlined":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s RidePearls 1"}},{"text":" # ","bold":true,"color":"gold"},{"text":"Stop Riding Pearls","underlined":true,"color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set @s StopRidingPearls 1"}},{"text":"  #","bold":true,"color":"gold"},"\n",{"text":"############################","bold":true,"color":"gold"},"\n",{"text":"#          ","bold":true,"color":"gold"},{"text":"Edit Configuration","underlined":true,"color":"dark_aqua","clickEvent":{"action":"run_command","value":"/scoreboard players set @s ConfigurePearls 1"}},"  ",{"text":"       #","bold":true,"color":"gold"},"\n",{"text":"############################","bold":true,"color":"gold"}]
execute as @a if score @s PearlHelp matches 1 run scoreboard players set @s PearlHelp 0

#resets all triggers
execute as @a run scoreboard players enable @s ConfigurePearls
execute as @a run scoreboard players enable @s RidePearls
execute as @a run scoreboard players enable @s StopRidingPearls
execute as @a run scoreboard players enable @s PearlHelp

#this stops config text from apprearing when you first join
execute as @a run scoreboard players set @s Initialized 1