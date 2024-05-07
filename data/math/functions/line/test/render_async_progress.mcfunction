#math:line/test/render_async_progress
# math:line/test/render_async_loop调用

#function math:line/_print

scoreboard players set render_density int 100
data modify storage math:io render_command set from storage math:class particle_commands.red_dust
function math:line/_render_start
data modify storage math:io input.render_progress set from storage math:io render_progress

#tellraw @a ["render_progress: ", {"nbt":"render_progress","storage":"math:io"}]