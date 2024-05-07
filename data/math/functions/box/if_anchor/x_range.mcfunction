#math:box/x_range
# math:box/_if_anchor调用

scoreboard players set sstemp int 0
execute if score sstemp_min int matches ..0 if score sstemp_max int matches 0.. run scoreboard players set sstemp int 1

scoreboard players set sstemp_min int -2147483648
scoreboard players set sstemp_max int 2147483647

execute if score sstemp int matches 1 run return 0

scoreboard players set sstemp_max int -2147483648
scoreboard players set sstemp_min int 2147483647