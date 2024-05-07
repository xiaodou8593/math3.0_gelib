#math:box/_render_async
# 异步渲染盒子
# 输入storage math:io render_progress
# 输出<res,int>表示渲染是否结束
# 需要以世界实体为执行者

# 提前退出
execute if data storage math:io render_progress.exit run return run scoreboard players set res int 1

# 计算主进程
execute store result score sstemp_cur int run data get storage math:io render_progress.cur_t
execute store result score sstemp_len int run data get storage math:io render_progress.end_t
execute store result score sstemp_rate int run data get storage math:io render_progress.rate
execute store result score sstemp_delta int run data get storage math:io render_progress.delta_t
scoreboard players operation sstemp_rate int *= sstemp_delta int
execute store result storage math:io render_progress.cur_t int 1 run scoreboard players operation sstemp_cur int += sstemp_rate int

# 利用主进程计算各轴线段的rate

# x轴进程
execute store result score sstemp_d int run data get storage math:io render_progress.x_len
execute store result score sstemp_pre int run data get storage math:io render_progress.x_lines[0].cur_t -1
scoreboard players operation dec int = sstemp_cur int
scoreboard players operation idec int = sstemp_d int
scoreboard players operation jdec int = sstemp_len int
function math:dec/_factor
scoreboard players operation sstemp_pre int += dec int
scoreboard players operation sstemp_pre int /= sstemp_delta int
execute store result storage math:io render_progress.x_lines[].rate int 1 run scoreboard players operation sstemp_pre int > 0 int

# y轴进程
execute store result score sstemp_d int run data get storage math:io render_progress.y_len
execute store result score sstemp_pre int run data get storage math:io render_progress.y_lines[0].cur_t -1
scoreboard players operation dec int = sstemp_cur int
scoreboard players operation idec int = sstemp_d int
scoreboard players operation jdec int = sstemp_len int
function math:dec/_factor
scoreboard players operation sstemp_pre int += dec int
scoreboard players operation sstemp_pre int /= sstemp_delta int
execute store result storage math:io render_progress.y_lines[].rate int 1 run scoreboard players operation sstemp_pre int > 0 int

# z轴进程
execute store result score sstemp_d int run data get storage math:io render_progress.z_len
execute store result score sstemp_pre int run data get storage math:io render_progress.z_lines[0].cur_t -1
scoreboard players operation dec int = sstemp_cur int
scoreboard players operation idec int = sstemp_d int
scoreboard players operation jdec int = sstemp_len int
function math:dec/_factor
scoreboard players operation sstemp_pre int += dec int
scoreboard players operation sstemp_pre int /= sstemp_delta int
execute store result storage math:io render_progress.z_lines[].rate int 1 run scoreboard players operation sstemp_pre int > 0 int

scoreboard players set sres int 1
data modify storage math:io temp set from storage math:io render_progress

# 渲染各个线段

data modify storage math:io render_progress set from storage math:io temp.x_lines[0]
function math:line/_render_async
data modify storage math:io temp.x_lines[0] set from storage math:io render_progress
data modify storage math:io render_progress set from storage math:io temp.x_lines[1]
function math:line/_render_async
data modify storage math:io temp.x_lines[1] set from storage math:io render_progress
data modify storage math:io render_progress set from storage math:io temp.x_lines[2]
function math:line/_render_async
data modify storage math:io temp.x_lines[2] set from storage math:io render_progress
data modify storage math:io render_progress set from storage math:io temp.x_lines[3]
function math:line/_render_async
data modify storage math:io temp.x_lines[3] set from storage math:io render_progress
scoreboard players operation sres int < res int

data modify storage math:io render_progress set from storage math:io temp.y_lines[0]
function math:line/_render_async
data modify storage math:io temp.y_lines[0] set from storage math:io render_progress
data modify storage math:io render_progress set from storage math:io temp.y_lines[1]
function math:line/_render_async
data modify storage math:io temp.y_lines[1] set from storage math:io render_progress
data modify storage math:io render_progress set from storage math:io temp.y_lines[2]
function math:line/_render_async
data modify storage math:io temp.y_lines[2] set from storage math:io render_progress
data modify storage math:io render_progress set from storage math:io temp.y_lines[3]
function math:line/_render_async
data modify storage math:io temp.y_lines[3] set from storage math:io render_progress
scoreboard players operation sres int < res int

data modify storage math:io render_progress set from storage math:io temp.z_lines[0]
function math:line/_render_async
data modify storage math:io temp.z_lines[0] set from storage math:io render_progress
data modify storage math:io render_progress set from storage math:io temp.z_lines[1]
function math:line/_render_async
data modify storage math:io temp.z_lines[1] set from storage math:io render_progress
data modify storage math:io render_progress set from storage math:io temp.z_lines[2]
function math:line/_render_async
data modify storage math:io temp.z_lines[2] set from storage math:io render_progress
data modify storage math:io render_progress set from storage math:io temp.z_lines[3]
function math:line/_render_async
data modify storage math:io temp.z_lines[3] set from storage math:io render_progress
scoreboard players operation sres int < res int

scoreboard players operation res int = sres int
data modify storage math:io render_progress set from storage math:io temp
execute if score res int matches 1 run data modify storage math:io render_progress.exit set value 1b