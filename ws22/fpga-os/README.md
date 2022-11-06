Here explains how to set up a development environment to build FPGA OS (Coyote). 

# Reference

- [Coyote github repo](https://github.com/fpgasystems/Coyote.git)

# GUI login

You can use xrdp to access our machine via remote desktop. Your username and password will be given by course instructors. 
You need to install any xrdp client app on your laptop. Please see http://xrdp.org/


# Shell setup

Open a terminal app and enter a nix-shell environment. You need [coyote.nix](coyote.nix) in this directory. The commands are as follows: 
```
xilinx-shell
nix-shell coyote.nix
```

Note: you will see the following message when you execute `xilinx-shell`, but you can ignore it.  
```
/share/xilinx/Vitis/2021.2/settings64.sh: line 5: /tools/Xilinx/DocNav/.settings64-DocNav.sh: No such file or directory
```

# Build HW (Coyote shell)

After cloning the repo, apply a patch [coyote-syslab-ws22.patch](coyote-syslab-ws22.patch) first. 

```
cd Coyote
git apply <your location>/coyote-syslab-ws22.patch 
```

We verified this patch works with the latest commit (commit hash: `cc181dd`). 

After applying the patch, you can follow [the original README.md][coyote_readme]. For example, the simplest configuration will be like this: 
```
cd Coyote/hw/
mkdir build && cd build
cmake .. -DFDEV_NAME=u50 -DEXAMPLE=perf_fpga
make shell
make compile
```

# Program FPGA
Unfortunately, [the original README.md][coyote_readme] does not explain this step well, but you can use Vivado to program FPGA with thegenerated bitstream, which is located in `Coyote/hw/build/bitstreams/cyt_top.bit`. 

You can use either GUI or CUI to program FPGA. If you prefer GUI, launch Vivado and open the Coyote project first.
```
vivado Coyote/hw/build/lynx/lynx.xpr 
```
Then, open the Hardware Manager according to [the instruction here](https://docs.xilinx.com/r/en-US/ug908-vivado-programming-debugging/Opening-the-Hardware-Manager). 

If you prefer CUI, a tcl script can be used to streamline this process. An example [program_fpga.tcl](program_fpga.tcl) is shown below. 
```
open_hw_manager
connect_hw_server -allow_non_jtag
open_hw_target

set Device [lindex [get_hw_devices] 0]
current_hw_device $Device
refresh_hw_device -update_hw_probes false $Device
refresh_hw_device $Device
set_property PROBES.FILE {} $Device
set_property FULL_PROBES.FILE {} $Device
set_property PROGRAM.FILE {$env(HOME)/Coyote/hw/build/bitstreams/cyt_top.bit} $Device

program_hw_devices $Device
refresh_hw_device $Device
```

Make sure to change the PROGRAM.FILE parameter for the target bitstream. Use `vivado -mode tcl -source program_fpga.tcl` to launch the script. This script should work on system with only one FPGA card. 


# Build driver

The build command is a bit different as NixOS is installed on our machine. 

```
cd Coyote/driver/
make -C $(nix-build -E '(import <nixpkgs> {}).linux.dev' --no-out-link)/lib/modules/*/build M=$(pwd)
```


# Install driver

Note: It is recommended to reboot the machine before installing the driver. As installing the driver immedeiately after programming the FPGA card might cause a kernel bug which can only be solved by hard reset the server. Installing driver before programming the FPGA does not report any errors but the user logic might not work properly as the driver will initialize some parameter in the FPGA shell. Rebooting the machine does not seem to affect bitstream written into the FPGA.


Unfortunately, `sudo` does not work with `nix-shell`. Therefore, you need to exit from `xilinx-shell` and `nix-shell coyote.nix` to reboot the machine & install the driver. 
```
exit # from `nix-shell coyote.nix`
exit # from `xilinx-shell`
sudo reboot
...
cd Coyote/driver
sudo insmod coyote_drv.ko
```

This step might stuck, in this case a hard reset is needed. 

One can also try this command before running the `insmod`:
```
sudo ./util/hot_reset.sh b3:00.0
```
where `b3:00.0` is the fpga device id from `lspci -v`.

# Build SW (Coyote APIs and example apps)

```
xilinx-shell
nix-shell coyote.nix
cd Coyote
mkdir build_perf_fpga_sw && cd build_perf_fpga_sw
cmake ../sw/ -DTARGET_DIR=../sw/examples/perf_fpga
make -j 8
```

# Run the example app

```
exit # from `nix-shell coyote.nix`
exit # from `xilinx-shell`
cd Coyote/build_perf_fpga_sw
sudo ./main
```

# Note 

Note that hardware compilation is much slower than sw compilation.`make compile` normally takes 1-2 hours to complete. 
To efficiently do experiments, it'd be better to execute it in the background, i.e., `nohup make compile &`. 

[coyote_readme]: https://github.com/fpgasystems/Coyote/blob/master/README.md "Coyote/README.md"


