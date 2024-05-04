#math:line/_length
# 计算线的长度
# 输出<res,int>
# 需要以世界实体为执行者

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get line_dx int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get line_dy int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get line_dz int
data modify entity @s Pos set from storage math:io xyz
execute positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^1.0 ~ ~
data modify storage math:io xyz set from entity @s Pos
execute store result score sstempf0 int run data get storage math:io xyz[0] 10000
execute store result score sstempf1 int run data get storage math:io xyz[1] 10000
execute store result score sstempf2 int run data get storage math:io xyz[2] 10000

scoreboard players operation res int = line_dx int
execute if score line_dx int matches ..-1 run scoreboard players operation res int *= -1 int
execute if score line_dy int matches 1.. run scoreboard players operation res int += line_dy int
execute if score line_dy int matches ..-1 run scoreboard players operation res int -= line_dy int
execute if score line_dz int matches 1.. run scoreboard players operation res int += line_dz int
execute if score line_dz int matches ..-1 run scoreboard players operation res int -= line_dz int

execute if score sstempf0 int matches ..-1 run scoreboard players operation sstempf0 int *= -1 int
execute if score sstempf1 int matches 1.. run scoreboard players operation sstempf0 int += sstempf1 int
execute if score sstempf1 int matches ..-1 run scoreboard players operation sstempf0 int -= sstempf1 int
execute if score sstempf2 int matches 1.. run scoreboard players operation sstempf0 int += sstempf2 int
execute if score sstempf2 int matches ..-1 run scoreboard players operation sstempf0 int -= sstempf2 int

scoreboard players operation res int *= 1000 int
scoreboard players operation res int /= sstempf0 int