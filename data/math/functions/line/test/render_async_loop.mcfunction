#math:line/test/render_async_loop
# math:line/test/render_async调用

data modify storage math:io input set from storage math:io list_line[0]
function math:line/_proj
execute unless data storage math:io input.render_progress run function math:line/test/render_async_progress
data modify storage math:io render_progress set from storage math:io input.render_progress
function math:line/_render_async
#tellraw @a ["res: ", {"score":{"name":"res","objective":"int"}}]
#tellraw @a ["render_progress: ", {"nbt":"render_progress","storage":"math:io"}]
data modify storage math:io list_line[0].render_progress set from storage math:io render_progress

execute if score res int matches 0 run data modify storage math:io list_line append from storage math:io list_line[0]
data remove storage math:io list_line[0]
scoreboard players remove loop int 1
execute if score loop int matches 1.. run function math:line/test/render_async_loop