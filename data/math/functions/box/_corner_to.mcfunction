#math:box/_corner_to
# 对角线确定盒子
# 输入执行坐标，世界实体坐标
# 需要以世界实体为执行者

data modify storage math:io xyz set from entity @s Pos
execute store result score x int run data get storage math:io xyz[0] 10000
execute store result score y int run data get storage math:io xyz[1] 10000
execute store result score z int run data get storage math:io xyz[2] 10000
tp @s ~ ~ ~
data modify storage math:io xyz set from entity @s Pos
execute store result score d int run data get storage math:io xyz[0] 10000
execute store result score h int run data get storage math:io xyz[1] 10000
execute store result score l int run data get storage math:io xyz[2] 10000

scoreboard players operation x int -= d int
scoreboard players operation x int /= 2 int
scoreboard players operation x int += d int
scoreboard players operation z int -= l int
scoreboard players operation z int /= 2 int
scoreboard players operation z int += l int

scoreboard players operation d int -= x int
execute if score d int matches ..-1 run scoreboard players operation d int *= -1 int
execute if score y int > h int run scoreboard players operation h int >< y int
scoreboard players operation h int -= y int
scoreboard players operation l int -= z int
execute if score l int matches ..-1 run scoreboard players operation l int *= -1 int

scoreboard players operation d int *= 100 int
scoreboard players operation h int *= 100 int
scoreboard players operation l int *= 100 int