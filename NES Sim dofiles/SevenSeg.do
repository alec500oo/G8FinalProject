Add wave *
force -freeze {sim:/SevenSeg/value[0]} 1'h1 0
run
force -freeze {sim:/SevenSeg/value[1]} 1'h1 0
force -freeze {sim:/SevenSeg/value[0]} 1'h0 0
run
force -freeze {sim:/SevenSeg/value[1]} 1'h1 0
force -freeze {sim:/SevenSeg/value[0]} 1'h1 0
run
force -freeze {sim:/SevenSeg/value[2]} 1'h1 0
force -freeze {sim:/SevenSeg/value[1]} 1'h0 0
force -freeze {sim:/SevenSeg/value[0]} 1'h0 0
run
force -freeze {sim:/SevenSeg/value[2]} 1'h1 0
force -freeze {sim:/SevenSeg/value[1]} 1'h0 0
force -freeze {sim:/SevenSeg/value[0]} 1'h1 0
run
force -freeze {sim:/SevenSeg/value[2]} 1'h1 0
force -freeze {sim:/SevenSeg/value[1]} 1'h1 0
force -freeze {sim:/SevenSeg/value[0]} 1'h0 0
run
force -freeze {sim:/SevenSeg/value[2]} 1'h1 0
force -freeze {sim:/SevenSeg/value[1]} 1'h1 0
force -freeze {sim:/SevenSeg/value[0]} 1'h1 0
run
force -freeze {sim:/SevenSeg/value[3]} 1'h1 0
force -freeze {sim:/SevenSeg/value[2]} 1'h0 0
force -freeze {sim:/SevenSeg/value[1]} 1'h0 0
force -freeze {sim:/SevenSeg/value[0]} 1'h0 0
