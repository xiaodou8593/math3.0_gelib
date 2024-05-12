#math:line/_to_anchor
# line转方位
# 输入非玩家执行者实体
# 输出执行者坐标，朝向

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get line_dx int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get line_dy int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get line_dz int
data modify entity @s Pos set from storage math:io xyz
execute positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ~ ~ ~ ~ ~

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get z int
data modify entity @s Pos set from storage math:io xyz