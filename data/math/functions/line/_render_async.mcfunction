#math:line/_render_async
# 异步渲染线
# 输入storage math:io render_progress
# 输出<res,int>表示渲染是否结束
# 需要以世界实体为执行者

# 加载位置和朝向
data modify entity @s Pos set from storage math:io render_progress.pos
data modify entity @s Rotation set from storage math:io render_progress.rotation

# 加载渲染命令和精细度
data modify storage math:io render_command set from storage math:io render_progress.command
execute store result score sstemp_delta int run data get storage math:io render_progress.delta_t 1
execute store result storage math:io delta double 0.0001 run scoreboard players get sstemp_delta int

# 加载渲染进程
execute store result score sstemp_cur int run data get storage math:io render_progress.cur_t 1
execute store result score sstemp_l int run data get storage math:io render_progress.end_t 1
execute store result score ssloop int run data get storage math:io render_progress.rate 1

# 异步渲染
execute if score ssloop int matches 1.. at @s run function math:line/render/async_loop with storage math:io {}

# 迭代render_progress对象
data modify storage math:io render_progress.pos set from entity @s Pos
execute store result storage math:io render_progress.cur_t int 1 run scoreboard players get sstemp_cur int

# 渲染已经结束
execute store result score res int if score sstemp_cur int >= sstemp_l int

tp @s 0 0 0