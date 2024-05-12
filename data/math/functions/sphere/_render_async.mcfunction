#math:sphere/_render_async
# 异步渲染球面
# 输入storage math:io render_progress
# 输出<res,int>表示渲染是否结束
# 会加载球面的临时对象
# 需要以世界实体为执行者

execute if data storage math:io render_progress.exit run return run scoreboard players set res int 1

data modify storage math:io render_command set from storage math:io render_progress.render_command

# 加载渲染进程
execute store result score sstemp_cur int run data get storage math:io render_progress.cur_t
execute store result score sstemp_len int run data get storage math:io render_progress.end_t
execute store result score ssloop int run data get storage math:io render_progress.rate

# 加载sphere临时对象
execute store result score x int run data get storage math:io render_progress.pos[0] 10000
execute store result score y int run data get storage math:io render_progress.pos[1] 10000
execute store result score z int run data get storage math:io render_progress.pos[2] 10000
execute store result score r int run data get storage math:io render_progress.radius 1000

# 异步渲染
execute if score ssloop int matches 1.. run function math:sphere/render/loop_async with storage math:io {}

# 渲染进程迭代
execute store result storage math:io render_progress.cur_t int 1 run scoreboard players get sstemp_cur int

# 已经渲染结束
execute store result score res int if score sstemp_cur int >= sstemp_len int
execute if score res int matches 1 run data modify storage math:io render_progress.exit set value 1b