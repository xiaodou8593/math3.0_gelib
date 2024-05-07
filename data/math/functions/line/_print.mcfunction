#math:line/_print
# 输出线

tellraw @a "math:line{"
tellraw @a ["    xyz: ",{"score":{"name":"x","objective":"int"}},", ",{"score":{"name":"y","objective":"int"}},", ",{"score":{"name":"z","objective":"int"}}]
tellraw @a ["    delta: ",{"score":{"name":"line_dx","objective":"int"}},", ",{"score":{"name":"line_dy","objective":"int"}},", ",{"score":{"name":"line_dz","objective":"int"}}]
tellraw @a "}"