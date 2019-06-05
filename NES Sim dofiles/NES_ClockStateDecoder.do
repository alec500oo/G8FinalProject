add wave *
force controllerState 0
run
force -freeze {sim:/NesClockStateDecoder/controllerState[1]} 1'h1 0
run
force -freeze {sim:/NesClockStateDecoder/controllerState[0]} 1'h1 0
run
force -freeze {sim:/NesClockStateDecoder/controllerState[2]} 1'h1 0
force -freeze {sim:/NesClockStateDecoder/controllerState[0]} 1'h0 0
force -freeze {sim:/NesClockStateDecoder/controllerState[1]} 1'h0 0
run
force -freeze {sim:/NesClockStateDecoder/controllerState[1]} 1'h1 0
run
force -freeze {sim:/NesClockStateDecoder/controllerState[3]} 1'h1 0
force -freeze {sim:/NesClockStateDecoder/controllerState[1]} 1'h0 0
force -freeze {sim:/NesClockStateDecoder/controllerState[2]} 1'h0 0
run
