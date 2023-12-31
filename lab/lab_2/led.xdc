#clock_rtl
set_property PACKAGE_PINK 17[ get_ports clk_100MHz]

set_property IOSTANDARD  LVCMOS33[ get_ports clk_100MHz]
create_clock −add −name sys_clk_pin −period 10.00 −waveform { 0 5 } [get_ports clk_100MHz]
#led_tr-_o
set_property PACKAGE_PIN M14 [ get_ports {led_tri_o[0]} ]
set_property IOSTANDARD LVCMOS33[get_ports { led_tri_o[0] } ]

set_property PACKAGE_PIN M15[get_ports { led_tri_o[1] } ]
set_property IOSTANDARD LVCMOS33[get_ports { led_tri_o[1] } ]
\
set_property PACKAGE_PIN G14[get_ports { led_tri_o[2] } ]
set_property IOSTANDARD LVCMOS33[get_ports { led_tri_o[2] } ]
\
set_property PACKAGE_PIN D18[get_ports { led_tri_o[3] } ]
set_property IOSTANDARD LVCMOS33[get_ports { led_tri_o[3] } ]