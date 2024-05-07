#math:box/test/render_async_tick
# 命令方块高频调用

execute store result score loop int if data storage math:io list_box[]
execute if score loop int matches 1.. as 0-0-0-0-0 run function math:box/test/render_async_loop