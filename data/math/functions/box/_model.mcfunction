#math:box/_model
# 临时对象构建数据模板
# 输出storage math:io result

data modify storage math:io result set value {pos:[0.0d, 0.0d, 0.0d], d:0, h:0, l:0}
execute store result storage math:io result.pos[0] double 0.0001 run scoreboard players get x int
execute store result storage math:io result.pos[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io result.pos[2] double 0.0001 run scoreboard players get z int
execute store result storage math:io result.d int 1 run scoreboard players get d int
execute store result storage math:io result.h int 1 run scoreboard players get h int
execute store result storage math:io result.l int 1 run scoreboard players get l int