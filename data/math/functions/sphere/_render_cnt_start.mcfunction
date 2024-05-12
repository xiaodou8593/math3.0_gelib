#math:sphere/_render_cnt_start
# 控制粒子数量生成球面的render_progress对象
# 输入<inp,int>
# 输入storage math:io render_command
# 输出storage math:io render_progress

data modify storage math:io render_progress set value {pos:[0.0d, 0.0d, 0.0d], radius:0.0d, cur_t:0, end_t:0, rate:10}

execute store result storage math:io render_progress.end_t int 1 run scoreboard players get inp int
execute store result storage math:io render_progress.radius double 0.001 run scoreboard players get r int
execute store result storage math:io render_progress.pos[0] double 0.0001 run scoreboard players get x int
execute store result storage math:io render_progress.pos[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io render_progress.pos[2] double 0.0001 run scoreboard players get z int

data modify storage math:io render_progress.render_command set from storage math:io render_command