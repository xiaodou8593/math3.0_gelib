#math:line/test/render_async

function math:test/_coords
execute at @e[tag=test_coord,limit=1] run function math:test/facing_tester/_new

execute as @e[tag=result,limit=1] run function marker_control:data/_get
data modify storage marker_control:io result.tick_func set value "math:line/test/render_async_main"
data modify storage marker_control:io result.del_func set value "math:line/test/render_async_end"
execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel