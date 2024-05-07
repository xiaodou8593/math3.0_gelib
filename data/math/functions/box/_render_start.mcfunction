#math:box/_render_start
# 生成盒子的render_progress对象
# 输入storage math:io render_command
# 输入<render_density,int>控制渲染精细度
# 输出storage math:io render_progress
# 需要以世界实体为执行者


data modify storage math:io x_lines set value []
data modify storage math:io y_lines set value []
data modify storage math:io z_lines set value []

# 计算盒子尺寸
scoreboard players operation sstempd int = d int
scoreboard players operation sstempd int /= 100 int
scoreboard players operation sstemph int = h int
scoreboard players operation sstemph int /= 100 int
scoreboard players operation sstempl int = l int
scoreboard players operation sstempl int /= 100 int

# x+, y+, z+
scoreboard players operation x int -= sstempd int
scoreboard players operation z int -= sstempl int
scoreboard players operation line_dx int = sstempd int
scoreboard players operation line_dx int *= 2 int
scoreboard players operation line_dy int = 0 int
scoreboard players operation line_dz int = 0 int
function math:line/_render_start
data modify storage math:io x_lines append from storage math:io render_progress
scoreboard players operation line_dx int = 0 int
scoreboard players operation line_dy int = sstemph int
function math:line/_render_start
data modify storage math:io y_lines append from storage math:io render_progress
scoreboard players operation line_dy int = 0 int
scoreboard players operation line_dz int = sstempl int
scoreboard players operation line_dz int *= 2 int
function math:line/_render_start
data modify storage math:io z_lines append from storage math:io render_progress

# x+, y-, z-
scoreboard players operation y int += sstemph int
scoreboard players operation z int += sstempl int
scoreboard players operation z int += sstempl int
scoreboard players operation line_dz int *= -1 int
function math:line/_render_start
data modify storage math:io z_lines append from storage math:io render_progress
scoreboard players operation line_dz int = 0 int
scoreboard players operation line_dx int = sstempd int
scoreboard players operation line_dx int *= 2 int
function math:line/_render_start
data modify storage math:io x_lines append from storage math:io render_progress
scoreboard players operation line_dx int = 0 int
scoreboard players operation line_dy int -= sstemph int
function math:line/_render_start
data modify storage math:io y_lines append from storage math:io render_progress

# x-, y-, z+
scoreboard players operation z int -= sstempl int
scoreboard players operation z int -= sstempl int
scoreboard players operation x int += sstempd int
scoreboard players operation x int += sstempd int
function math:line/_render_start
data modify storage math:io y_lines append from storage math:io render_progress
scoreboard players operation line_dy int = 0 int
scoreboard players operation line_dz int = sstempl int
scoreboard players operation line_dz int *= 2 int
function math:line/_render_start
data modify storage math:io z_lines append from storage math:io render_progress
scoreboard players operation line_dz int = 0 int
scoreboard players operation line_dx int = sstempd int
scoreboard players operation line_dx int *= -2 int
function math:line/_render_start
data modify storage math:io x_lines append from storage math:io render_progress

# x-, y+, z-
scoreboard players operation y int -= sstemph int
scoreboard players operation z int += sstempl int
scoreboard players operation z int += sstempl int
function math:line/_render_start
data modify storage math:io x_lines append from storage math:io render_progress
scoreboard players operation line_dx int = 0 int
scoreboard players operation line_dy int = sstemph int
function math:line/_render_start
data modify storage math:io y_lines append from storage math:io render_progress
scoreboard players operation line_dy int = 0 int
scoreboard players operation line_dz int = sstempl int
scoreboard players operation line_dz int *= -2 int
function math:line/_render_start
data modify storage math:io z_lines append from storage math:io render_progress

# 盒子中心复原
scoreboard players operation x int -= sstempd int
scoreboard players operation z int -= sstempl int

# 生成盒子的render_progress

data modify storage math:io render_progress set value {x_lines:[],y_lines:[],z_lines:[],x_len:0,y_len:0,z_len:0,cur_t:0,end_t:0,delta_t:0,rate:10}
execute store result storage math:io render_progress.delta_t int 1 run scoreboard players operation sstemp_delta int > 1 int

data modify storage math:io render_progress.x_lines set from storage math:io x_lines
data modify storage math:io render_progress.y_lines set from storage math:io y_lines
data modify storage math:io render_progress.z_lines set from storage math:io z_lines

execute store result storage math:io render_progress.y_len int 1 run scoreboard players operation sstemp_t int = sstemph int
scoreboard players operation sstemp_0 int = sstempd int
execute store result storage math:io render_progress.x_len int 1 run scoreboard players operation sstemp_0 int *= 2 int
scoreboard players operation sstemp_t int > sstemp_0 int
scoreboard players operation sstemp_0 int = sstempl int
execute store result storage math:io render_progress.z_len int 1 run scoreboard players operation sstemp_0 int *= 2 int
execute store result storage math:io render_progress.end_t int 1 run scoreboard players operation sstemp_t int > sstemp_0 int