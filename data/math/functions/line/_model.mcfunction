#math:line/_model
# 临时对象构建数据模板
# 输出storage math:io result

data modify storage math:io result set value {pos:[0.0d,0.0d,0.0d], delta_vec:[0.0d,0.0d,0.0d]}
execute store result storage math:io result.pos[0] double 0.0001 run scoreboard players get x int
execute store result storage math:io result.pos[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io result.pos[2] double 0.0001 run scoreboard players get z int
execute store result storage math:io result.delta_vec[0] double 0.0001 run scoreboard players get line_dx int
execute store result storage math:io result.delta_vec[1] double 0.0001 run scoreboard players get line_dy int
execute store result storage math:io result.delta_vec[2] double 0.0001 run scoreboard players get line_dz int