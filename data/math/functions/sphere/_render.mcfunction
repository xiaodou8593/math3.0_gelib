#math:sphere/_render
# 渲染球面
# 输入<render_density,int>
# 输入storage math:io render_command
# 需要以世界实体为执行者

# 计算粒子个数
scoreboard players operation dec int = r int
scoreboard players operation dec int *= render_density int
function math:dec/_sqr
scoreboard players set idec int 1420
scoreboard players set jdec int 113
function math:dec/_factor_single
#tellraw @a ["dec: ", {"score":{"name":"dec","objective":"int"}}]

# 渲染球面
scoreboard players operation inp int = dec int
scoreboard players operation inp int /= 100 int
function math:sphere/_render_cnt