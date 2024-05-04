#math:line/_render_start
# 生成线的render_progress对象
# 输入storage math:io render_command
# 输入<render_density,int>控制渲染精细度
# 输出storage math:io render_progress
# 需要以世界实体为执行者

data modify storage math:io render_progress set value {cur_t:0, end_t:0, delta_t:0, rate:10, pos:[0.0d,0.0d,0.0d], rotation:[0.0f,0.0f], command:""}

# 计算渲染总进程
function math:line/_length
execute store result storage math:io render_progress.end_t int 1 run scoreboard players operation res int *= 10 int

# 计算朝向和初始位置
execute store result storage math:io render_progress.pos[0] double 0.0001 run scoreboard players get x int
execute store result storage math:io render_progress.pos[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io render_progress.pos[2] double 0.0001 run scoreboard players get z int
data modify storage math:io render_progress.rotation set from entity @s Rotation

# 计算渲染精细度
scoreboard players set sstemp_delta int 10000
scoreboard players operation sstemp_delta int /= render_density int
execute store result storage math:io render_progress.delta_t int 1 run scoreboard players operation sstemp_delta int > 1 int

data modify storage math:io render_progress.command set from storage math:io render_command