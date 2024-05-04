#math:box/_if_anchor
# 判断视线是否穿过box
# 输入执行坐标，执行朝向
# 输出<res,int>
# 如果只取视线向前的部分，判断<sstemp_max,int>大于0即可
# 需要以世界实体为执行者

# 获取box的相对坐标
tp @s ~ ~ ~
data modify storage math:io xyz set from entity @s Pos
execute store result score sstemp_min int run data get storage math:io xyz[0] -10000
execute store result score sstemp0 int run data get storage math:io xyz[1] -10000
execute store result score sstemp2 int run data get storage math:io xyz[2] -10000
scoreboard players operation sstemp_min int += x int
scoreboard players operation sstemp0 int += y int
scoreboard players operation sstemp2 int += z int
scoreboard players operation sstemp_min int *= 100 int
scoreboard players operation sstemp0 int *= 100 int
scoreboard players operation sstemp2 int *= 100 int

# 获取视线单位向量
execute positioned 0.0 0.0 0.0 run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score sstempf0 int run data get storage math:io xyz[0] 1000
execute store result score sstempf1 int run data get storage math:io xyz[1] 1000
execute store result score sstempf2 int run data get storage math:io xyz[2] 1000

# x轴范围
scoreboard players operation sstemp_max int = sstemp_min int
scoreboard players operation sstemp_min int -= d int
scoreboard players operation sstemp_max int += d int
scoreboard players operation sstemp_min int /= sstempf0 int
scoreboard players operation sstemp_max int /= sstempf0 int
execute if score sstemp_min int > sstemp_max int run scoreboard players operation sstemp_min int >< sstemp_max int
execute if score sstempf0 int matches 0 run function math:box/if_anchor/x_range

# y轴范围
scoreboard players operation sstemp1 int = sstemp0 int
scoreboard players operation sstemp1 int += h int
scoreboard players operation sstemp0 int /= sstempf1 int
scoreboard players operation sstemp1 int /= sstempf1 int
execute if score sstemp0 int > sstemp1 int run scoreboard players operation sstemp0 int >< sstemp1 int
execute if score sstempf1 int matches 0 run function math:box/if_anchor/y_range
scoreboard players operation sstemp_min int > sstemp0 int
scoreboard players operation sstemp_max int < sstemp1 int

# z轴范围
scoreboard players operation sstemp3 int = sstemp2 int
scoreboard players operation sstemp2 int -= l int
scoreboard players operation sstemp3 int += l int
scoreboard players operation sstemp2 int /= sstempf2 int
scoreboard players operation sstemp3 int /= sstempf2 int
execute if score sstemp2 int > sstemp3 int run scoreboard players operation sstemp2 int >< sstemp3 int
execute if score sstempf2 int matches 0 run function math:box/if_anchor/z_range
scoreboard players operation sstemp_min int > sstemp2 int
scoreboard players operation sstemp_max int < sstemp3 int

execute store result score res int if score sstemp_min int <= sstemp_max int