#math:box/test/render_async_loop
# math:box/test/render_async_tick调用

# 异步渲染盒子
data modify storage math:io render_progress set from storage math:io list_box[0]
function math:box/_render_async
data modify storage math:io list_box[0] set from storage math:io render_progress

# 迭代渲染列表
execute if score res int matches 0 run data modify storage math:io list_box append from storage math:io list_box[0]
data remove storage math:io list_box[0]
scoreboard players remove loop int 1
execute if score loop int matches 1.. run function math:box/test/render_async_loop