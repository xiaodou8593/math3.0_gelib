#math:box/test/render_main
# math:box/test/render异步调用

execute at @s anchored eyes run tp @e[tag=math_marker,limit=1] ^2 ^1 ^2
execute at @s anchored eyes positioned ^ ^ ^ as @e[tag=math_marker,limit=1] run function math:box/_corner_to

# 渲染盒子
data modify storage math:io render_command set from storage math:class particle_commands.red_dust
scoreboard players set render_density int 20
execute as @e[tag=math_marker,limit=1] run function math:box/_render