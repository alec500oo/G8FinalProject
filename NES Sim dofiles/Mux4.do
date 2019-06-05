add wave *
force clockSelect 0
force zero 0
force one 0
force two 0
force three 0
run
force zero 1
run
force -freeze {sim:/Mux4/clockSelect[0]} 1'h1 0
force zero 0
force one 1
run
force -freeze {sim:/Mux4/clockSelect[1]} 1'h1 0
force -freeze {sim:/Mux4/clockSelect[0]} 1'h0 0
force -freeze sim:/Mux4/one 1'h0 0
force -freeze sim:/Mux4/two 1'h1 0
run
force -freeze {sim:/Mux4/clockSelect[0]} 1'h1 0
force -freeze sim:/Mux4/three 1'h1 0
force -freeze sim:/Mux4/two 1'h0 0
run
