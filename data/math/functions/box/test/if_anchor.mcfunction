#math:box/test/if_anchor
# 聊天栏调用

# 生成旋转测试
function math:test/_coords
data modify storage math:io input set value {states:["horizontal_60","vertical_60"],invisible:1b,facing_rate:1}
execute at @e[tag=test_coord,limit=1] run function math:test/facing_tester/_new

# 生成盒子
execute at @e[tag=test_coord,limit=1] run tp @e[tag=math_marker,limit=1] ~-1.5 ~ ~3
execute at @e[tag=test_coord,limit=1] positioned ~1.5 ~3.0 ~6 as @e[tag=math_marker,limit=1] run function math:box/_corner_to
function math:box/_model

# 储存盒子数据
execute as @e[tag=result,limit=1] run function marker_control:data/_get
data modify storage marker_control:io result.box_model set from storage math:io result
data modify storage marker_control:io result.tick_func set value "math:box/test/if_anchor_main"
execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked