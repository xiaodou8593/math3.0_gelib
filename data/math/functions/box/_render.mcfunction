#math:box/_render
# 渲染盒子
# 输入storage math:io render_command
# 输入<render_density,int>控制渲染精细度
# 需要以世界实体为执行者

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
function math:line/_render
scoreboard players operation line_dx int = 0 int
scoreboard players operation line_dy int = sstemph int
function math:line/_render
scoreboard players operation line_dy int = 0 int
scoreboard players operation line_dz int = sstempl int
scoreboard players operation line_dz int *= 2 int
function math:line/_render

# x+, y-, z-
scoreboard players operation y int += sstemph int
scoreboard players operation z int += sstempl int
scoreboard players operation z int += sstempl int
scoreboard players operation line_dz int *= -1 int
function math:line/_render
scoreboard players operation line_dz int = 0 int
scoreboard players operation line_dx int = sstempd int
scoreboard players operation line_dx int *= 2 int
function math:line/_render
scoreboard players operation line_dx int = 0 int
scoreboard players operation line_dy int -= sstemph int
function math:line/_render

# x-, y-, z+
scoreboard players operation z int -= sstempl int
scoreboard players operation z int -= sstempl int
scoreboard players operation x int += sstempd int
scoreboard players operation x int += sstempd int
function math:line/_render
scoreboard players operation line_dy int = 0 int
scoreboard players operation line_dz int = sstempl int
scoreboard players operation line_dz int *= 2 int
function math:line/_render
scoreboard players operation line_dz int = 0 int
scoreboard players operation line_dx int = sstempd int
scoreboard players operation line_dx int *= -2 int
function math:line/_render

# x-, y+, z-
scoreboard players operation y int -= sstemph int
scoreboard players operation z int += sstempl int
scoreboard players operation z int += sstempl int
function math:line/_render
scoreboard players operation line_dx int = 0 int
scoreboard players operation line_dy int = sstemph int
function math:line/_render
scoreboard players operation line_dy int = 0 int
scoreboard players operation line_dz int = sstempl int
scoreboard players operation line_dz int *= -2 int
function math:line/_render

# 盒子中心复原
scoreboard players operation x int -= sstempd int
scoreboard players operation z int -= sstempl int