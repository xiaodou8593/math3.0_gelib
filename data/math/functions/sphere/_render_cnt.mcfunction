#math:sphere/_render_cnt
# 控制粒子数量渲染球面
# 输入<inp,int>
# 输入storage math:io render_command
# 需要以世界实体为执行者

scoreboard players operation sstemp_cnt int = inp int
scoreboard players set ssloop int 1

tp @s 0.0 0.0 0.0 0.0 0.0

execute if score ssloop int <= sstemp_cnt int run function math:sphere/render/loop with storage math:io {}

tp @s 0 0 0