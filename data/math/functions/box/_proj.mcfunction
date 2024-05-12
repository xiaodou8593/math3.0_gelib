#math:box/_proj
# 数据模板投射临时对象
# 输入storage math:io input

execute store result score x int run data get storage math:io input.pos[0] 10000
execute store result score y int run data get storage math:io input.pos[1] 10000
execute store result score z int run data get storage math:io input.pos[2] 10000
execute store result score d int run data get storage math:io input.d
execute store result score h int run data get storage math:io input.h
execute store result score l int run data get storage math:io input.l