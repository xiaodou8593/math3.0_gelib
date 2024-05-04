#math:sphere/test/render_cnt

function math:test/_coords
execute as @e[tag=test_coord,limit=1] run function math:_posto

scoreboard players set r int 5000
scoreboard players set inp int 180
data modify storage math:io render_command set from storage math:class particle_commands.end_rod
execute as 0-0-0-0-0 run function math:sphere/_render_cnt