#math:line/_render
# 渲染线
# 输入storage math:io render_command
# 输入<render_density,int>控制渲染精细度
# 需要以世界实体为执行者

# 计算渲染总进程
function math:line/_length
scoreboard players operation res int *= 10 int

# 计算初始位置
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get z int
data modify entity @s Pos set from storage math:io xyz

# 计算渲染精细度
scoreboard players set sstemp_delta int 10000
scoreboard players operation sstemp_delta int /= render_density int
execute store result storage math:io delta double 0.0001 run scoreboard players operation sstemp_delta int > 1 int

# 进入渲染循环
scoreboard players operation sstemp_l int = res int
scoreboard players set ssloop int 0
execute if score ssloop int < sstemp_l int at @s run function math:line/render/loop with storage math:io {}

tp @s 0 0 0