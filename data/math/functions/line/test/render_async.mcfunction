#math:line/test/render_async
# 聊天栏调用

function math:test/_coords
execute at @e[tag=test_coord,limit=1] run function math:test/facing_tester/_new

execute as @e[tag=result,limit=1] run function marker_control:data/_get
data modify storage marker_control:io result.tick_func set value "math:line/test/render_async_main"
execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
#scoreboard players set @e[tag=result,limit=1] killtime 2

data modify storage math:io list_line set value []