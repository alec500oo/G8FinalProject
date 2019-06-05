add wave *
force -freeze sim:/Counter4/clk 1 0, 0 {50 ns} -r 100
force reset_n 0
run
force reset_n 1
run 900
