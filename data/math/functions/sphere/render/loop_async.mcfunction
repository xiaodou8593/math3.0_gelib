#math:sphere/render/loop_async
# math:sphere/render/_render_async调用

# 计算单位球的z坐标
scoreboard players operation uvec_z int = sstemp_cur int
scoreboard players operation uvec_z int *= 20000 int
scoreboard players remove uvec_z int 10000
scoreboard players operation uvec_z int /= sstemp_len int
scoreboard players remove uvec_z int 10000

# 计算小圆半径
scoreboard players set inp int 100000000
scoreboard players operation sstemp_sqr int = uvec_z int
scoreboard players operation sstemp_sqr int *= sstemp_sqr int
scoreboard players operation inp int -= sstemp_sqr int
function math:_sqrt

# 计算单位球的xy坐标
execute store result entity @s Rotation[0] float 222.49223595 run scoreboard players get sstemp_cur int
execute at @s positioned 0.0 0.0 0.0 run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score uvec_x int run data get storage math:io xyz[2] 10000
execute store result score uvec_y int run data get storage math:io xyz[0] 10000
scoreboard players operation uvec_x int *= res int
scoreboard players operation uvec_x int /= 10000 int
scoreboard players operation uvec_y int *= res int
scoreboard players operation uvec_y int /= 10000 int

# 单位球伸缩
scoreboard players operation uvec_x int *= r int
scoreboard players operation uvec_x int /= 1000 int
scoreboard players operation uvec_y int *= r int
scoreboard players operation uvec_y int /= 1000 int
scoreboard players operation uvec_z int *= r int
scoreboard players operation uvec_z int /= 1000 int

# 访问坐标
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation uvec_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation uvec_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation uvec_z int += z int
data modify entity @s Pos set from storage math:io xyz
$execute at @s run $(render_command)

scoreboard players add sstemp_cur int 1
execute if score sstemp_cur int >= sstemp_len int run scoreboard players set ssloop int 1
scoreboard players remove ssloop int 1
execute if score ssloop int matches 1.. run function math:sphere/render/loop_async with storage math:io {}