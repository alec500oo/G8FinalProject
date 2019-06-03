onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /keyboardTestbench/clk
add wave -noupdate /keyboardTestbench/reset_n
add wave -noupdate /keyboardTestbench/data
add wave -noupdate /keyboardTestbench/out_code
add wave -noupdate /keyboardTestbench/dut/data
add wave -noupdate /keyboardTestbench/dut/code
add wave -noupdate /keyboardTestbench/dut/shiftRegData
add wave -noupdate -radix unsigned -childformat {{{/keyboardTestbench/dut/dataInCount[3]} -radix unsigned} {{/keyboardTestbench/dut/dataInCount[2]} -radix unsigned} {{/keyboardTestbench/dut/dataInCount[1]} -radix unsigned} {{/keyboardTestbench/dut/dataInCount[0]} -radix unsigned}} -subitemconfig {{/keyboardTestbench/dut/dataInCount[3]} {-height 15 -radix unsigned} {/keyboardTestbench/dut/dataInCount[2]} {-height 15 -radix unsigned} {/keyboardTestbench/dut/dataInCount[1]} {-height 15 -radix unsigned} {/keyboardTestbench/dut/dataInCount[0]} {-height 15 -radix unsigned}} /keyboardTestbench/dut/dataInCount
add wave -noupdate /keyboardTestbench/dut/countLatch
add wave -noupdate /keyboardTestbench/dut/latch
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {260 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 251
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {881 ps}
