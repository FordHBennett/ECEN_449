##Switches

set_property PACKAGE_PIN G15 [get_ports {SWITCHES[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SWITCHES[0]}]

set_property PACKAGE_PIN P15 [get_ports {SWITCHES[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SWITCHES[1]}]

set_property PACKAGE_PIN W13 [get_ports {SWITCHES[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SWITCHES[2]}]

set_property PACKAGE_PIN T16 [get_ports {SWITCHES[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SWITCHES[3]}]

##LEDs

set_property PACKAGE_PIN M14 [get_ports {LEDS[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[0]}]

set_property PACKAGE_PIN M15 [get_ports {LEDS[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[1]}]

set_property PACKAGE_PIN G14 [get_ports {LEDS[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[2]}]

set_property PACKAGE_PIN D18 [get_ports {LEDS[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[3]}]

##BUTTONS
set_property PACKAGE_PIN Y16 [get_ports {BUTTONS[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BUTTONS[0]}]

set_property PACKAGE_PIN V16 [get_ports {BUTTONS[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BUTTONS[1]}]

set_property PACKAGE_PIN P16 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property PACKAGE_PIN L16 [get_ports CLOCK]
set_property IOSTANDARD LVCMOS33 [get_ports CLOCK]

##Clock signal
##IO_L11P_T1_SRCC_35
set_property PACKAGE_PIN K17 [ get_ports FastClk]
set_property IOSTANDARD LVCMOS33 [ get_ports FastClk]
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports FastClk]

##Buttons
##IO_L20P_T3_34
set_property PACKAGE_PIN K18 [ get_ports {BTNs[0]}]
set_property IOSTANDARD LVCMOS33 [ get_ports {BTNs[0]}]
set_property PACKAGE_PIN P16 [ get_ports {BTNs[1]}]
set_property IOSTANDARD LVCMOS33 [ get_ports {BTNs[1]}]