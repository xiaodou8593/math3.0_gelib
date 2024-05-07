#math:line/_proj
# 数据模板投射临时对象
# 输入storage math:io input

execute store result score x int run data get storage math:io input.pos[0] 10000
execute store result score y int run data get storage math:io input.pos[1] 10000
execute store result score z int run data get storage math:io input.pos[2] 10000
execute store result score line_dx int run data get storage math:io input.delta_vec[0] 10000
execute store result score line_dy int run data get storage math:io input.delta_vec[1] 10000
execute store result score line_dz int run data get storage math:io input.delta_vec[2] 10000