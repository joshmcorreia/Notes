# How to Install OPENSTEP 4.2 in VMWare Workstation 16
A guide on how to install OPENSTEP 4.2, specifically in VMWare Workstation 16

# The files you'll need
- `Openstep-4.2-Intel-User.iso`
- `NEXTSTEP_VMWare_Tools.iso`
- `4.2_Install_Disk.img`
- `4.2_Custom_Driver_Disk.img`

---

# Where to download these files:
Note: these are multiple locations where you can download the above files. You don't need to download every file from each website.
1) https://mega.nz/file/xNVjADgR#417wddOATnAOf7ATvGfJU5qm7-0mU3aQ6lZKXzlDrVw
2) https://openstep.bfx.re/
3) https://winworldpc.com/product/nextstep/4x

---

# How to create the VM:
1) Open VMWare Workstation 16
2) File -> New Virtual Machine
3) Typical (recommended) -> Next
4) Installer disc image file (iso) -> Browse -> `Openstep-4.2-Intel-User.iso` -> Next
5) Guest operating system: `Other`. Version: `Other` -> Next
6) Name your VM (I chose "OPENSTEP 4.2") -> Next
7) Maximum disk size (GB): 4.0 GB. Store disk as a single file.
8) Customize Hardware... -> 512MB Memory -> Add... -> Floppy Drive -> Finish -> Use floppy image file: `4.2_Install_Disk.img` -> Close -> Finish

---

# How to install the OS:
1) Power on this virtual machine
2) Wait 10 seconds for the VM to boot, or press enter
3) Type 1 to use the English language
4) Type 1 to prepare to install OPENSTEP
5) Click the floppy disk icon in the bottom right of VMWare -> Settings -> `4.2_Custom_Driver_Disk.img` -> OK -> hit enter in the terminal
6) Type 7 to view a list of additional device drivers on this disk.
7) Type 7 to view a list of additional device drivers on this disk.
8) 5 (Primary/Secondary(Dual) EIDE/ATAPI Device Controller (v4.03)
9) Type 7 to view a list of additional device drivers on this disk.
10) Type 7 to view a list of additional device drivers on this disk.
11) 5 (Primary/Secondary(Dual) EIDE/ATAPI Device Controller (v4.03)
12) Type 1 to continue without loading additional device drivers.
13) Now you should see "NeXT Mach Operating System" at the top of the window once it's done loading
14) Type 1 to install OPENSTEP on this disk.
15) Type 1 to erase the entire disk and use all 4087 MB for OPENSTEP.
16) Type 1 to start installing OPENSTEP. **(This step will take a few minutes)**
17) Once the above step completes and says "Completed" on the screen, remove the floppy disk (click the floppy disk in the bottom right of VMWare and click "Disconnect"), then press enter in the terminal
18) Once the VM reboots, reconnect the floppy disk because the custom drivers are necessary to load up the VM.
19) Once you get to the "Summary of Devices" window, I recommend taking a snapshot because the mouse is very touchy and it's hard to apply settings.
20) Go to the Display Devices tab (looks like a monitor) and select "Default VGA Adapter (v4.00)" then click "Add"
21) Go back to the main tab (looks like a piece of paper) and select "Save"
22) Once the "Install NEXTSTEP" window pops up, deselect all of the additional languages (they're not necessary), then click "Install"
23) Disconnect the floppy drive again once the "Restart" prompt shows up, then click "Restart"
24) Set up the keyboard
25) Now you've successfully installed the OS!

---

# How to install the VMWare mouse driver:
[Source](https://www.youtube.com/watch?v=XAF0xdIiI20)
Note: I couldn't reliably use the mouse, so this includes instructions on how to install the drivers without using the mouse whenever possible.
1) Right click the current CD and click "Disconnect"
2) Right click the current CD and click "Settings"
3) Underneath "Use ISO image file:" click "Browse" and select "NEXTSTEP_VMWare_Tools.iso" -> Open -> OK
4) Right click the current CD and click "Connect"
5) Click back into the VM
6) Open NextApps -> Terminal.app (use right and left arrows to navigate)
7) Type the following commands:
```
cp /NEXTSTEP_TOOLS/NEXTSTEP/Drivers/VMMouse.tar /me
tar -xf VMMouse.tar
open /NextAdmin/Configure.app
```
11) Click on the Mouse tab once Configure.app opens
12) Remove the PS/2 Mouse
13) Click "Install Driver..." and select `/me/VMMouse/VMMouse.config` then click "OK"
14) Click "VMWare virtual mouse driver 1.1" and click "Add" (or press Enter)
15) Add the newly installed mouse driver
16) Click "Done" -> "Save" -> "Save Anyway"
17) Restart the computer (Log out -> Power off)
18) You should now have a working mouse

---

# How to install the VMWare display driver:
1) Open NextApps -> Terminal.app
2) Type the following commands:
```
cp /NEXTSTEP_TOOLS/NEXTSTEP/Drivers/VMWareFB.tar /me
tar -xf VMWareFB.tar
open /NextAdmin/Configure.app
```
3) Click on the Display tab once Configure.app opens
4) Click "Install Driver..." and select `/me/VMWareFB.config` then click "OK"
5) Scroll down to the bottom and select "VMWare Display Adapter by Atomic Object (v1.00)" and click "Add"
6) Click "Done" then "Save"
7) Restart the computer (Log out -> Power off)
8) You should now have a working video driver

---

# How to set up the network:
http://www.nextcomputers.org/NeXTfiles/Docs/TjLs_Cable_Modem_Guide.pdf

---

# Special Thanks:
Special thanks to [Paul Ward on YouTube](https://www.youtube.com/watch?v=uVCxfoG8bv4) for making videos covering how to install this OS in VMWare. Even though the video is 11 years old at the time of writing this, it still proved useful.
