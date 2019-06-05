Add wave *
force -freeze sim:/Counter14/clock 1 0, 0 {50 ns} -r 100
force reset_n 0
force upDown 1
run
force reset_n 1
run 400
force upDown 0
run 500
