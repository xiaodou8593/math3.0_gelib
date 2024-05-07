#math:line/render/loop
# math:line/_render调用

tp @s ~ ~ ~
$$(render_command)

scoreboard players operation ssloop int += sstemp_delta int
$execute if score ssloop int < sstemp_l int positioned ^ ^ ^$(delta) run function math:line/render/loop with storage math:io {}