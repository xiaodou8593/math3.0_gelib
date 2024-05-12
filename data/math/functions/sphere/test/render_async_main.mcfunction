#math:sphere/test/render_async_main
# math:sphere/test/render异步调用

function marker_control:data/_get
data modify storage math:io render_progress set from storage marker_control:io result.render_progress
execute as 0-0-0-0-0 run function math:sphere/_render_async
data modify storage marker_control:io result.render_progress set from storage math:io render_progress
function marker_control:data/_store

execute if score res int matches 1 run kill @s