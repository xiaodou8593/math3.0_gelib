#math:line/test/render_async_main

execute at @s anchored eyes positioned ^ ^ ^ as 0-0-0-0-0 run function math:line/_from_anchor
function math:line/_model
data modify storage math:io list_line append from storage math:io result