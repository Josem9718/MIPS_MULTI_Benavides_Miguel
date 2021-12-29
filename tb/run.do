onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /data_path_tb/ALUres_tb
add wave -noupdate -radix hexadecimal /data_path_tb/GPIO_otb
add wave -noupdate /data_path_tb/ALUSControl_tb
add wave -noupdate /data_path_tb/ALUSrcA_tb
add wave -noupdate /data_path_tb/ALUSrcB_tb
add wave -noupdate /data_path_tb/clk_dp_tb
add wave -noupdate /data_path_tb/funct_tb
add wave -noupdate /data_path_tb/op_tb
add wave -noupdate /data_path_tb/IorD_tb
add wave -noupdate /data_path_tb/IRWrite_tb
add wave -noupdate /data_path_tb/MemtoReg_tb
add wave -noupdate /data_path_tb/MemWrite_tb
add wave -noupdate /data_path_tb/PCSrc_tb
add wave -noupdate /data_path_tb/PCWrite_tb
add wave -noupdate /data_path_tb/RegDst_tb
add wave -noupdate /data_path_tb/RegWrite_tb
add wave -noupdate /data_path_tb/rst_tb
add wave -noupdate /data_path_tb/zero_tb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {8 ps}
