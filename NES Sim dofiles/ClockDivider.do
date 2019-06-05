add wave *
force -freeze sim:/ClockDivider/clock_2MHz 1 0, 0 {0 ns} -r 1
force reset_n 0
run	
force reset_n 1
run -all
