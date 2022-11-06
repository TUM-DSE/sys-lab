open_hw_manager
connect_hw_server -allow_non_jtag
open_hw_target

set Device [lindex [get_hw_devices] 0]
current_hw_device $Device
refresh_hw_device -update_hw_probes false $Device
refresh_hw_device $Device
set_property PROBES.FILE {} $Device
set_property FULL_PROBES.FILE {} $Device
# Change this path to your location 
set_property PROGRAM.FILE {$env(HOME)/Coyote/hw/build/bitstreams/cyt_top.bit} $Device

program_hw_devices $Device
refresh_hw_device $Device
