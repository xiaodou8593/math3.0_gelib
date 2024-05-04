#math:line/test/render_main

execute at @s anchored eyes positioned ^ ^ ^ as 0-0-0-0-0 run function math:line/_from_anchor

data modify storage math:io render_command set from storage math:class particle_commands.red_dust
scoreboard players set render_density int 100
execute as 0-0-0-0-0 run function math:line/_render