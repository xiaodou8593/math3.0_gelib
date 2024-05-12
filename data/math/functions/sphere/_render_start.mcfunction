#math:sphere/_render_start
# 生成球面的render_progress对象
# 输入<render_density,int>
# 输入storage math:io render_command
# 输出storage math:io render_progress

# 计算粒子个数
scoreboard players operation dec int = r int
scoreboard players operation dec int *= render_density int
function math:dec/_sqr
scoreboard players set idec int 1420
scoreboard players set jdec int 113
function math:dec/_factor_single

# 生成render_progress
scoreboard players operation inp int = dec int
scoreboard players operation inp int /= 100 int
function math:sphere/_render_cnt_start