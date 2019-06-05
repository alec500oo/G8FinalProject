add wave *	
force -freeze sim:/Counter4/clk 1 0, 0 {50 ns} -r 100
force dataYellow 0 @ 100, 1 @ 200, 1 @ 300, 1 @ 400, 1 @ 500, 1 @ 600, 1 @ 700, 1 @ 800
force reset_n 1
run
