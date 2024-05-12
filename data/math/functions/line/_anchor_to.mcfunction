#math:line/_anchor_to
# 执行方位转线段
# 输入执行坐标，执行朝向
# 需要传入世界实体为执行者

tp @s ~ ~ ~
data modify storage math:io xyz set from entity @s Pos
execute store result score x int run data get storage math:io xyz[0] 10000
execute store result score y int run data get storage math:io xyz[1] 10000
execute store result score z int run data get storage math:io xyz[2] 10000

execute positioned 0.0 0.0 0.0 run tp @s ^ ^ ^2.5
data modify storage math:io xyz set from entity @s Pos
execute store result score line_dx int run data get storage math:io xyz[0] 10000
execute store result score line_dy int run data get storage math:io xyz[1] 10000
execute store result score line_dz int run data get storage math:io xyz[2] 10000