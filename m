Return-Path: <russell@personaltelco.net>
Received: from mail.tdb.com (mail.tdb.com [216.99.214.4])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id CFD53E00723
	for <meta-ti@yoctoproject.org>; Thu,  5 Apr 2012 18:40:16 -0700 (PDT)
Received: (qmail 4401 invoked from network); 5 Apr 2012 18:40:16 -0700
Received: from unknown (HELO coulee.tdb.com) (216.99.214.7)
	by mail.tdb.com with SMTP; 5 Apr 2012 18:40:16 -0700
Received: (qmail 30892 invoked by uid 1001); 6 Apr 2012 01:40:15 -0000
To: Denys Dmytriyenko <denis@denix.org>, meta-ti@yoctoproject.org,
	angstrom-distro-devel@linuxtogo.org
References: <86pqbmm4oe.fsf@coulee.tdb.com> <20120405191501.GB5144@denix.org>
	<86bon5nc3h.fsf@coulee.tdb.com>
From: Russell Senior <russell@personaltelco.net>
Date: Thu, 05 Apr 2012 18:40:15 -0700
In-Reply-To: <86bon5nc3h.fsf@coulee.tdb.com> (Russell Senior's message of
	"Thu\, 05 Apr 2012 13\:43\:46 -0700")
Message-ID: <86zkapljsw.fsf@coulee.tdb.com>
User-Agent: Gnus/5.101 (Gnus v5.10.10) Emacs/21.4 (gnu/linux)
MIME-Version: 1.0
Subject: Re: building meta-ti + poky HOWTO?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Apr 2012 01:40:17 -0000
Content-Type: text/plain; charset=us-ascii

>>>>> "Russell" == Russell Senior <russell@personaltelco.net> writes:

Russell> [...] I have tried taking the pre-baked Angstrom image from here:

Russell>
Russell> http://www.angstrom-distribution.org/demo/beaglebone/Angstrom-Cloud9-IDE-eglibc-ipk-v2012.02-core-beaglebone-2012.02.14.img.xz

Russell> (which works for me), and replacing the uImage on the vfat
Russell> partition by copying over the existing one with one I built.
Russell> That boots, but the rootfs isn't aligned (different
Russell> kernel/module versions?).

Russell> If I then try dropping in my rootfs, by reformatting the
Russell> ext4fs and untarring the rootfs tarball I built, I get 0.6
Russell> seconds into the boot and then the boot stalls with some
Russell> udevd messages, like so: [...]

Let me start by saying that I'm an almost a complete newbie with
OpenEmbedded, so a certain amount of slack cutting is in order.  

With that in mind, I discovered that uEnv.txt had "quiet", so I tried
booting without that and got some new information:

  U-Boot SPL 2011.09-00010-g81c8c79 (Feb 13 2012 - 14:48:03)
  Texas Instruments Revision detection unimplemented
  No AC power, disabling frequency switch
  OMAP SD/MMC: 0
  reading u-boot.img
  reading u-boot.img


  U-Boot 2011.09-00010-g81c8c79 (Feb 13 2012 - 14:48:03)

  I2C:   ready
  DRAM:  256 MiB
  No daughter card present
  NAND:  HW ECC Hamming Code selected
  nand_get_flash_type: unknown NAND device: Manufacturer ID: 0x10, Chip ID: 0x10
  No NAND device found!!!
  0 MiB
  MMC:   OMAP SD/MMC: 0
  *** Warning - readenv() failed, using default environment

  Net:   cpsw
  Hit any key to stop autoboot:  0 
  SD/MMC found on device 0
  reading uEnv.txt

  28 bytes read
  Loaded environment from uEnv.txt
  Importing environment from mmc ...
  reading uImage

  3141656 bytes read
  ## Booting kernel from Legacy Image at 80007fc0 ...
     Image Name:   Angstrom/3.2/beaglebone
     Image Type:   ARM Linux Kernel Image (uncompressed)
     Data Size:    3141592 Bytes = 3 MiB
     Load Address: 80008000
     Entry Point:  80008000
     Verifying Checksum ... OK
     XIP Kernel Image ... OK
  OK

  Starting kernel ...

  Uncompressing Linux... done, booting the kernel.
  [    0.000000] Initializing cgroup subsys cpuset
  [    0.000000] Initializing cgroup subsys cpu
  [    0.000000] Linux version 3.2.13 (russell@frieda) (gcc version 4.5.4 20120305 (prerelease) (GCC) ) #1 Tue Apr 3 11:52:23 PDT 2012
  [    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=50c53c7d
  [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
  [    0.000000] Machine: am335xevm
  [    0.000000] Memory policy: ECC disabled, Data cache writeback
  [    0.000000] AM335X ES1.0 (sgx neon )
  [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 65024
  [    0.000000] Kernel command line: console=ttyO0,115200n8 run_hardware_tests root=/dev/mmcblk0p2 ro rootfstype=ext4 rootwait ip=none
  [    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
  [    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
  [    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
  [    0.000000] allocated 1048576 bytes of page_cgroup
  [    0.000000] please try 'cgroup_disable=memory' option if you don't want memory cgroups
  [    0.000000] Memory: 256MB = 256MB total
  [    0.000000] Memory: 253776k/253776k available, 8368k reserved, 0K highmem
  [    0.000000] Virtual kernel memory layout:
  [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
  [    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
  [    0.000000]     vmalloc : 0xd0800000 - 0xff000000   ( 744 MB)
  [    0.000000]     lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
  [    0.000000]     modules : 0xbf800000 - 0xc0000000   (   8 MB)
  [    0.000000]       .text : 0xc0008000 - 0xc041f7e0   (4190 kB)
  [    0.000000]       .init : 0xc0420000 - 0xc0457000   ( 220 kB)
  [    0.000000]       .data : 0xc0458000 - 0xc04a8040   ( 321 kB)
  [    0.000000]        .bss : 0xc04a8064 - 0xc04ef2cc   ( 285 kB)
  [    0.000000] NR_IRQS:410 nr_irqs:410 410
  [    0.000000] IRQ: Found an INTC at 0xfa200000 (revision 5.0) with 128 interrupts
  [    0.000000] Total of 128 interrupts on 1 active controller
  [    0.000000] OMAP clockevent source: GPTIMER1 at 24000000 Hz
  [    0.000000] OMAP clocksource: GPTIMER2 at 24000000 Hz
  [    0.000000] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 178956ms
  [    0.000000] Console: colour dummy device 80x30
  [    0.000215] Calibrating delay loop... 498.89 BogoMIPS (lpj=2494464)
  [    0.058654] pid_max: default: 32768 minimum: 301
  [    0.058816] Security Framework initialized
  [    0.058890] Mount-cache hash table entries: 512
  [    0.059312] Initializing cgroup subsys cpuacct
  [    0.059358] Initializing cgroup subsys memory
  [    0.059403] Initializing cgroup subsys devices
  [    0.059419] Initializing cgroup subsys freezer
  [    0.059433] Initializing cgroup subsys blkio
  [    0.059460] Initializing cgroup subsys perf_event
  [    0.059552] CPU: Testing write buffer coherency: ok
  [    0.060620] devtmpfs: initialized
  [    0.064817] print_constraints: dummy: 
  [    0.065084] NET: Registered protocol family 16
  [    0.065199] GPMC revision 6.0
  [    0.066482] OMAP GPIO hardware version 0.1
  [    0.067788] omap_mux_init: Add partition: #1: core, flags: 0
  [    0.069341]  omap_i2c.1: alias fck already exists
  [    0.069748] failed to create an alias: icss_uart_gclk --> pruss
  [    0.069781] failed to create an alias: gfx_fclk --> sgx_ck
  [    0.069800] hw-breakpoint: debug architecture 0x4 unsupported.
  [    0.069980]  omap2_mcspi.1: alias fck already exists
  [    0.070111]  omap2_mcspi.2: alias fck already exists
  [    0.081295] bio: create slab <bio-0> at 0
  [    0.082771] SCSI subsystem initialized
  [    0.083762] usbcore: registered new interface driver usbfs
  [    0.083910] usbcore: registered new interface driver hub
  [    0.084091] usbcore: registered new device driver usb
  [    0.084462] registerd cppi-dma Intr @ IRQ 17
  [    0.084482] Cppi41 Init Done Qmgr-base(d083a000) dma-base(d0838000)
  [    0.084494] Cppi41 Init Done
  [    0.084526] musb-ti81xx musb-ti81xx: musb0, board_mode=0x13, plat_mode=0x3
  [    0.084691] musb-ti81xx musb-ti81xx: musb1, board_mode=0x13, plat_mode=0x1
  [    0.098713] omap_i2c omap_i2c.1: bus 1 rev2.4.0 at 100 kHz
  [    0.099971] Advanced Linux Sound Architecture Driver Version 1.0.24.
  [    0.100626] Switching to clocksource gp timer
  [    0.113537] musb-hdrc: version 6.0, ?dma?, otg (peripheral+host)
  [    0.113731] musb-hdrc musb-hdrc.0: dma type: dma-cppi41
  [    0.114774] musb-hdrc musb-hdrc.0: USB OTG mode controller at d081e000 using DMA, IRQ 18
  [    0.115086] musb-hdrc musb-hdrc.1: dma type: dma-cppi41
  [    0.115738] musb-hdrc musb-hdrc.1: MUSB HDRC host driver
  [    0.115849] musb-hdrc musb-hdrc.1: new USB bus registered, assigned bus number 1
  [    0.115978] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
  [    0.115999] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
  [    0.116018] usb usb1: Product: MUSB HDRC host driver
  [    0.116034] usb usb1: Manufacturer: Linux 3.2.13 musb-hcd
  [    0.116049] usb usb1: SerialNumber: musb-hdrc.1
  [    0.116757] hub 1-0:1.0: USB hub found
  [    0.116788] hub 1-0:1.0: 1 port detected
  [    0.117316] musb-hdrc musb-hdrc.1: USB Host mode controller at d0832800 using DMA, IRQ 19
  [    0.117743] NET: Registered protocol family 2
  [    0.117956] IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
  [    0.118432] TCP established hash table entries: 8192 (order: 4, 65536 bytes)
  [    0.118657] TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
  [    0.118794] TCP: Hash tables configured (established 8192 bind 8192)
  [    0.118810] TCP reno registered
  [    0.118828] UDP hash table entries: 256 (order: 0, 4096 bytes)
  [    0.118860] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
  [    0.119173] NET: Registered protocol family 1
  [    0.119522] RPC: Registered named UNIX socket transport module.
  [    0.119540] RPC: Registered udp transport module.
  [    0.119553] RPC: Registered tcp transport module.
  [    0.119565] RPC: Registered tcp NFSv4.1 backchannel transport module.
  [    0.120208] cpuidle-am33xx cpuidle-am33xx.0: failed to register driver
  [    0.132896] VFS: Disk quotas dquot_6.5.2
  [    0.132973] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
  [    0.134240] msgmni has been set to 495
  [    0.135343] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
  [    0.135466] io scheduler noop registered
  [    0.135482] io scheduler deadline registered
  [    0.135554] io scheduler cfq registered (default)
  [    0.137182] ecap: probe of ecap.2 failed with error -2
  [    0.138231] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
  [    0.139614] omap_uart.0: ttyO0 at MMIO 0x44e09000 (irq = 72) is a OMAP UART0
  [    0.762926] console [ttyO0] enabled
  [    0.767173] omap_uart.1: ttyO1 at MMIO 0x48022000 (irq = 73) is a OMAP UART1
  [    0.775064] omap_uart.2: ttyO2 at MMIO 0x48024000 (irq = 74) is a OMAP UART2
  [    0.782911] omap_uart.3: ttyO3 at MMIO 0x481a6000 (irq = 44) is a OMAP UART3
  [    0.790736] omap_uart.4: ttyO4 at MMIO 0x481a8000 (irq = 45) is a OMAP UART4
  [    0.798550] omap_uart.5: ttyO5 at MMIO 0x481aa000 (irq = 46) is a OMAP UART5
  [    0.807718] brd: module loaded
  [    0.815469] loop: module loaded
  [    0.818866] at24 1-0051: 32768 byte 24c256 EEPROM, writable, 64 bytes/write
  [    0.880679] No daughter card found
  [    0.884327] at24 1-0050: 32768 byte 24c256 EEPROM, writable, 64 bytes/write
  [    0.899624] Board name: A335BONE
  [    0.903045] Board version: 00A4
  [    0.906353] The board is a AM335x Beaglebone.
  [    0.911630] tps65217 1-0024: TPS65217 ID 0x7 version 1.0
  [    0.919124] print_constraints: DCDC1: 900 <--> 1800 mV at 1800 mV 
  [    0.927612] print_constraints: DCDC2: 900 <--> 3300 mV at 1275 mV 
  [    0.936066] print_constraints: DCDC3: 900 <--> 1500 mV at 1100 mV 
  [    0.944510] print_constraints: LDO1: 1000 <--> 3300 mV at 1800 mV 
  [    0.952951] print_constraints: LDO2: 900 <--> 3300 mV at 3300 mV 
  [    0.961293] print_constraints: LDO3: 1800 <--> 3300 mV at 3300 mV 
  [    0.969745] print_constraints: LDO4: 1800 <--> 3300 mV at 3300 mV 
  [    0.976704]  omap_i2c.3: alias fck already exists
  [    1.000738] omap_i2c omap_i2c.3: bus 3 rev2.4.0 at 100 kHz
  [    1.007353]  omap_hsmmc.0: alias fck already exists
  [    1.012909] _omap_mux_get_by_name: Could not find signal leds-gpio
  [    1.019709] w1-gpio connected to P8_6
  [    1.023964] at24 3-0054: 32768 byte 24c256 EEPROM, writable, 64 bytes/write
  [    1.110682] BeagleBone cape EEPROM: could not read eeprom at address 0x54
  [    1.117901] at24 3-0055: 32768 byte 24c256 EEPROM, writable, 64 bytes/write
  [    1.200679] BeagleBone cape EEPROM: could not read eeprom at address 0x55
  [    1.207881] at24 3-0056: 32768 byte 24c256 EEPROM, writable, 64 bytes/write
  [    1.290677] BeagleBone cape EEPROM: could not read eeprom at address 0x56
  [    1.297876] at24 3-0057: 32768 byte 24c256 EEPROM, writable, 64 bytes/write
  [    1.380678] BeagleBone cape EEPROM: could not read eeprom at address 0x57
  [    1.387834] BeagleBone cape: exporting ADC pins to sysfs
  [    1.394407] SCSI Media Changer driver v0.25 
  [    1.399311] CAN device driver interface
  [    1.403397] CAN bus driver for Bosch D_CAN controller 1.0
  [    1.450706] davinci_mdio davinci_mdio.0: davinci mdio revision 1.6
  [    1.457223] davinci_mdio davinci_mdio.0: detected phy mask fffffffe
  [    1.464837] davinci_mdio.0: probed
  [    1.468433] davinci_mdio davinci_mdio.0: phy[0]: device 0:00, driver SMSC LAN8710/LAN8720
  [    1.477277] usbcore: registered new interface driver catc
  [    1.482991] catc: v2.8:CATC EL1210A NetMate USB Ethernet driver
  [    1.489323] usbcore: registered new interface driver kaweth
  [    1.495221] pegasus: v0.6.14 (2006/09/27), Pegasus/Pegasus II USB Ethernet driver
  [    1.503205] usbcore: registered new interface driver pegasus
  [    1.509172] rtl8150: v0.6.2 (2004/08/27):rtl8150 based usb-ethernet driver
  [    1.516504] usbcore: registered new interface driver rtl8150
  [    1.522589] usbcore: registered new interface driver asix
  [    1.528349] usbcore: registered new interface driver cdc_ether
  [    1.534584] usbcore: registered new interface driver dm9601
  [    1.540524] usbcore: registered new interface driver cdc_subset
  [    1.546848] usbcore: registered new interface driver zaurus
  [    1.552783] cdc_ncm: 04-Aug-2011
  [    1.556253] usbcore: registered new interface driver cdc_ncm
  [    1.562360] usbcore: registered new interface driver cdc_acm
  [    1.568325] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
  [    1.576886] usbcore: registered new interface driver usblp
  [    1.582759] usbcore: registered new interface driver cdc_wdm
  [    1.588790] usbcore: registered new interface driver uas
  [    1.594405] Initializing USB Mass Storage driver...
  [    1.599682] usbcore: registered new interface driver usb-storage
  [    1.606032] USB Mass Storage support registered.
  [    1.611040] usbcore: registered new interface driver libusual
  [    1.617585] mousedev: PS/2 mouse device common for all mice
  [    1.624087] dev addr = c0478af0
  [    1.627402] pdev addr = c0478ae8
  [    1.631553] omap_rtc omap_rtc: rtc core: registered omap_rtc as rtc0
  [    1.638277] omap_rtc: already running
  [    1.642321] i2c /dev entries driver
  [    1.646468] Linux media interface: v0.10
  [    1.650811] lirc_dev: IR Remote Control driver registered, major 249 
  [    1.657600] IR NEC protocol handler initialized
  [    1.662392] IR RC5(x) protocol handler initialized
  [    1.667436] IR RC6 protocol handler initialized
  [    1.672224] IR JVC protocol handler initialized
  [    1.676999] IR Sony protocol handler initialized
  [    1.681875] IR RC5 (streamzap) protocol handler initialized
  [    1.687749] IR MCE Keyboard/mouse protocol handler initialized
  [    1.693911] IR LIRC bridge handler initialized
  [    1.698594] Linux video capture interface: v2.00
  [    1.703633] usbcore: registered new interface driver uvcvideo
  [    1.709691] USB Video Class driver (1.1.1)
  [    1.714103] Driver for 1-wire Dallas network protocol.
  [    1.720923] OMAP Watchdog Timer Rev 0x01: initial timeout 60 sec
  [    1.731561] usbcore: registered new interface driver usbhid
  [    1.737436] usbhid: USB HID core driver
  [    1.742548] usbcore: registered new interface driver snd-usb-audio
  [    1.749622] ALSA device list:
  [    1.752800]   No soundcards found.
  [    1.756782] TCP cubic registered
  [    1.760186] Initializing XFRM netlink socket
  [    1.764761] NET: Registered protocol family 17
  [    1.769501] NET: Registered protocol family 15
  [    1.774206] can: controller area network core (rev 20090105 abi 8)
  [    1.780843] NET: Registered protocol family 29
  [    1.785533] can: raw protocol (rev 20090105)
  [    1.790073] Registering the dns_resolver key type
  [    1.795124] VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 3
  [    1.803237] ThumbEE CPU extension supported.
  [    1.807807] mux: Failed to setup hwmod io irq -22
  [    1.813641] omap2_set_init_voltage: unable to get clk dpll1_ck
  [    1.819794] omap2_set_init_voltage: unable to set vdd_mpu_iva
  [    1.825896] omap2_set_init_voltage: unable to get clk l3_ick
  [    1.831878] omap2_set_init_voltage: unable to set vdd_core
  [    1.837661] Power Management for AM33XX family
  [    1.847044] registered taskstats version 1
  [    1.851753] Detected MACID=d4:94:a1:79:81:c7
  [    1.857437] omap_rtc omap_rtc: setting system clock to 2000-01-01 00:00:51 UTC (946684851)
  [    1.867025] Waiting for root device /dev/mmcblk0p2...
  [    1.912487] mmc0: host does not support reading read-only switch. assuming write-enable.
  [    1.923354] mmc0: new high speed SDHC card at address 0007
  [    1.929746] mmcblk0: mmc0:0007 SD8GB 7.43 GiB 
  [    1.938278]  mmcblk0: p1 p2
  [    2.012939] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)
  [    2.021593] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
  [    2.031519] devtmpfs: mounted
  [    2.035090] Freeing init memory: 220K

  Welcome to The Angstrom Distribution!

  [    2.529008] NET: Registered protocol family 10
  : Registered protocol family 10
  Started Security File System                                           [  OK  ]
  Starting POSIX Message Queue File System...                                    
  Started Huge Pages File System                                         [  OK  ]
  Starting Apply Kernel Variables...                                             
  Started Set Up Additional Binary Formats                               [  OK  ]
  Starting Debug File System...                                                  
  Starting Load Kernel Modules...                                                
  Starting Runtime Directory...                                                  
  Starting Lock Directory...                                                     
  Starting Remount API VFS...                                                    
  Starting File System Check on Root Device...                                   
  [    3.216235] Bluetooth: Core ver 2.16
  [    3.220114] NET: Registered protocol family 31
  [    3.224849] Bluetooth: HCI device and connection manager initialized
  [    3.231570] Bluetooth: HCI socket layer initialized
  [    3.236711] Bluetooth: L2CAP socket layer initialized
  [    3.242074] Bluetooth: SCO socket layer initialized
  [    3.260742] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
  Starting Media Directory...                                                    
  [    3.354048] NET: Registered protocol family 23
  Starting udev Coldplug all Devices...                                          
  Starting udev Kernel Device Manager...                                         
  Starting Journal Service...                                                    
  Started Journal Service                                                [  OK  ]
  Started POSIX Message Queue File System                                [  OK  ]
  Started Apply Kernel Variables                                         [  OK  ]
  Started Debug File System                                              [  OK  ]
  Started Runtime Directory                                              [  OK  ]
  Started Lock Directory                                                 [  OK  ]
  Started Media Directory                                                [  OK  ]
  [    3.473893] IrCOMM protocol (Dag Brattli)
  Started Remount API VFS                                                [  OK  ]
  [    3.593606] Bluetooth: RFCOMM TTY layer initialized
  [    3.599707] Bluetooth: RFCOMM socket layer initialized
  [    3.606514] Bluetooth: RFCOMM ver 1.11
  [    3.641075] udevd[67]: starting version 182
  Started udev Kernel Device Manager                                     [  OK  ]
  Started Load Kernel Modules                                            [  OK  ]
  Started FUSE Control File System                                       [  OK  ]
  Started Configuration File System                                      [  OK  ]
  Starting Journal Service...                                                    
  Started Journal Service                                                [  OK  ]
  Starting Journal Service...                                                    
  Started Journal Service                                                [  OK  ]
  Starting Journal Service...                                                    
  Started Journal Service                                                [  OK  ]
  Starting Journal Service...                                                    
  Started Journal Service                                                [  OK  ]
  Starting Journal Service...                                                   
  Started Journal Service                                                [  OK  ]
  Starting Journal Service...                                                    
  Failed to start Journal Service                                        [FAILED]
  See 'systemctl status systemd-journald.service' for details.                   
  Started udev Coldplug all Devices                                      [  OK  ]
  Started File System Check on Root Device                               [  OK  ]
  Starting Remount Root FS...                                                    
  Failed to start Remount Root FS                                        [FAILED]
  See 'systemctl status remount-rootfs.service' for details.                     
  Starting /tmp...                                                               
  Starting Machine ID first boot configure...                                    
  Starting Run pending postinsts...                                              
  Failed to start /tmp                                                   [FAILED]
  See 'systemctl status tmp.mount' for details.                                  
  Dependency failed. Aborted start of Serial Getty on ttyO0              [ABORT]
  Dependency failed. Aborted start of Getty on tty1                      [ABORT]
  udevd[67]: timeout, giving up waiting for workers to finish

This looks like the same problem as here: 

  http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2012-March/005762.html

That was a month ago.  Why hasn't this been fixed?  I'm running a stock/very-recent checkout.


-- 
Russell Senior, President
russell@personaltelco.net

