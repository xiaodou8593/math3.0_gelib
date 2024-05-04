#math:box/z_range

scoreboard players set sstemp int 0
execute if score sstemp2 int matches ..0 if score sstemp3 int matches 0.. run scoreboard players set sstemp int 1

scoreboard players set sstemp2 int -2147483648
scoreboard players set sstemp3 int 2147483647

execute if score sstemp int matches 1 run return 0

scoreboard players set sstemp3 int -2147483648
scoreboard players set sstemp2 int 2147483647