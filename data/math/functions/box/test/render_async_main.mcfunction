#math:box/test/render_async_main
# math:box/test/render_async异步调用

execute at @s anchored eyes run tp @e[tag=math_marker,limit=1] ^8 ^4 ^8
execute at @s anchored eyes positioned ^ ^ ^ as @e[tag=math_marker,limit=1] run function math:box/_corner_to

# 渲染盒子
data modify storage math:io render_command set from storage math:class particle_commands.end_rod
scoreboard players set render_density int 20
execute as @e[tag=math_marker,limit=1] run function math:box/_render_start
data modify storage math:io render_progress.rate set value 10
data modify storage math:io list_box append from storage math:io render_progress