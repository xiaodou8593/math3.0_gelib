#math:sphere/test/render_async
# 聊天栏调用

function math:test/_coords
execute at @e[tag=test_coord,limit=1] positioned ~ ~2 ~ as 0-0-0-0-0 run function math:_toxyz

scoreboard players set r int 1800
scoreboard players set render_density int 5
data modify storage math:io render_command set from storage math:class particle_commands.red_dust
execute as 0-0-0-0-0 run function math:sphere/_render_start
data modify storage math:io render_progress.rate set value 128

tag @e[tag=result] remove result
summon marker 0 0 0 {Tags:["entity_ticked","result"]}
execute as @e[tag=result,limit=1] run function marker_control:data/_get
data modify storage marker_control:io result.render_progress set from storage math:io render_progress
data modify storage marker_control:io result.tick_func set value "math:sphere/test/render_async_main"
execute as @e[tag=result,limit=1] run function marker_control:data/_store