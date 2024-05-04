#math:sphere/test/render

function math:test/_coords
execute at @e[tag=test_coord,limit=1] positioned ~ ~2 ~ as 0-0-0-0-0 run function math:_toxyz

scoreboard players set r int 1800
scoreboard players set render_density int 5
data modify storage math:io render_command set from storage math:class particle_commands.red_dust
execute as 0-0-0-0-0 run function math:sphere/_render