

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V16} [get_ports SD_1]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V17} [get_ports RD_1]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R18} [get_ports J1]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P18} [get_ports K1]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN N5} [get_ports CP1]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets SD_1_IBUF]


set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN U16} [get_ports SD_2]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN U17} [get_ports RD_2]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T18} [get_ports J2]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P17} [get_ports K2]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN H16} [get_ports CP2]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets SD_2_IBUF]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L3} [get_ports Q1]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L4} [get_ports Q_1]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M3} [get_ports Q2]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M4} [get_ports Q_2]

