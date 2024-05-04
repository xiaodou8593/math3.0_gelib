#math:box/y_range

scoreboard players set sstemp int 0
execute if score sstemp0 int matches ..0 if score sstemp1 int matches 0.. run scoreboard players set sstemp int 1

scoreboard players set sstemp0 int -2147483648
scoreboard players set sstemp1 int 2147483647

execute if score sstemp int matches 1 run return 0

scoreboard players set sstemp1 int -2147483648
scoreboard players set sstemp0 int 2147483647