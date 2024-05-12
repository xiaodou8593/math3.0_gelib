#math:box/test/if_anchor_main
# math:box/test/if_anchor异步调用

# 加载盒子数据
function marker_control:data/_get
data modify storage math:io input set from storage marker_control:io result.box_model
function math:box/_proj

# 碰撞算法
execute at @s anchored eyes positioned ^ ^ ^ as 0-0-0-0-0 run function math:box/_if_anchor
execute if score sstemp_max int < 0 int run scoreboard players set res int 0
scoreboard players operation min int = sstemp_min int
scoreboard players operation max int = sstemp_max int

# 渲染盒子
scoreboard players set render_density int 20
execute if score res int matches 0 run data modify storage math:io render_command set from storage math:class particle_commands.blue_dust
execute if score res int matches 1 run data modify storage math:io render_command set from storage math:class particle_commands.red_dust
execute as 0-0-0-0-0 run function math:box/_render

# 渲染射线
execute at @s anchored eyes positioned ^ ^ ^ as 0-0-0-0-0 run function math:line/_anchor_to
scoreboard players operation line_dx int *= 3 int
scoreboard players operation line_dy int *= 3 int
scoreboard players operation line_dz int *= 3 int
data modify storage math:io render_command set from storage math:class particle_commands.red_dust
execute as 0-0-0-0-0 run function math:line/_render

# 渲染交点

scoreboard players operation inp int = min int
execute as 0-0-0-0-0 run function math:line/_dis_to_pos
data modify storage math:io test_command set from storage math:class particle_commands.flame
execute at 0-0-0-0-0 run function math:test/_run

scoreboard players operation inp int = max int
execute as 0-0-0-0-0 run function math:line/_dis_to_pos
data modify storage math:io test_command set from storage math:class particle_commands.soul_fire_flame
execute at 0-0-0-0-0 run function math:test/_run