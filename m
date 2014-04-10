Return-Path: <jeremy@rhtech.co.nz>
Received: from linuxplesk9.openhost.net.nz (linuxplesk9.openhost.net.nz
	[119.47.118.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7104E00CAA
	for <meta-ti@yoctoproject.org>; Thu, 10 Apr 2014 15:46:55 -0700 (PDT)
Received: (qmail 11938 invoked from network); 11 Apr 2014 10:46:54 +1200
Received: from 122-61-40-229.jetstream.xtra.co.nz (HELO ?192.168.1.98?)
	(122.61.40.229)
	by linuxplesk9.openhost.net.nz with (DHE-RSA-AES128-SHA encrypted) SMTP;
	11 Apr 2014 10:46:54 +1200
Message-ID: <53471F5F.20507@rhtech.co.nz>
Date: Fri, 11 Apr 2014 10:46:55 +1200
From: Jeremy Cole-Baker <jeremy@rhtech.co.nz>
Organization: Riverhead Technology
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: No USB devices on BeagleBoard?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: jeremy@rhtech.co.nz
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Apr 2014 22:46:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I've built a minimal Linux for my BeagleBoard xM (Rev C) using the Yocto 
project build appliance, and installed it on a uSD card. I used the 
"Beagleboard" machine and "core-image-base".

It works (Yay!), has a small footprint and boots really fast which is 
what I want. I used a pretty minimal build recipe with this in mind.

It gives lots of encouraging messages about loading drivers for the USB 
devices. However, when I log in, there is no ethernet interface, and 
nothing else on the USB seems to work. I've tried plugging in a USB 
memory stick but it's not recognized (nothing new appears in log shown 
by "dmesg"). I don't get anything on the display, either - I am 
interacting over the serial port console.

I'm using the u-boot binary built by Yocto, and loading the device table 
(dtb file) and kernel image from the same source. However, I noticed 
that the (working) Debian image I have also includes an "initrd" image. 
Borrowing from the Debian boot environment, I was able to load that 
initrd (actually "uInitrd", the uboot image version?) but I still don't 
see the USB devices.

Am I missing something? Do I need to put something in my Yocto build, or 
should it already know about the hardware? Given that I picked the 
"beagleboard" option, I assumed it knew what to put in. Do I even need 
an "initrd"? According to the docs I read, this is a ramdisk which tells 
the kernel which driver modules to load, but I don't really understand it.

Here is the (Entire!!) boot up output copied from the serial console. I 
ran the uBoot commands manually to boot the kernel. For the project, I 
just need the onboard ethernet to work, and support for a couple of 
additional USB-Ethernet adaptors. Everything is working well in the 
BeagleBoard Debian distribution I have, but I am trying to make my own 
(preferably lighter and faster to boot).

Thanks for any suggestions!

---------- UBOOT: -------------------------------------

     U-Boot 2013.07 (Apr 02 2014 - 09:17:04)

     OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
     OMAP3 Beagle board + LPDDR/NAND
     I2C:   ready
     DRAM:  512 MiB
     NAND:  0 MiB
     MMC:   OMAP SD/MMC: 0
     *** Warning - readenv() failed, using default environment

     In:    serial
     Out:   serial
     Err:   serial
     Beagle xM Rev C
     No EEPROM on expansion board
     Die ID #2ed800029ff80000016849a906016009
     musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, bulk combine, bulk split, HB-ISO Rx, HB-ISO Tx, SoftConn)
     musb-hdrc: MHDRC RTL version 1.800
     musb-hdrc: setup fifo_mode 4
     musb-hdrc: 28/31 max ep, 16384/16384 memory
     USB Peripheral mode controller at 480ab000 using PIO, IRQ 0
     Net:   usb_ether
     Hit any key to stop autoboot:  0
     OMAP3 beagleboard.org #

---------- UBOOT COMMANDS: ------------------------------------------------------

     OMAP3 beagleboard.org # setenv bootargs 'console=ttyO2,115200n8 root=/dev/mmcblk0p2 rootwait rootfstype=ext4 rw'
     OMAP3 beagleboard.org # fatload mmc 0:1 0x80300000 zImage
     reading zImage
     4641688 bytes read in 296 ms (15 MiB/s)
     OMAP3 beagleboard.org # fatload mmc 0:1 0x81600000 uInitrd;setenv initrd_size ${filesize}
     reading uInitrd
     3160554 bytes read in 205 ms (14.7 MiB/s)
     OMAP3 beagleboard.org # fatload mmc 0:1 0x815f0000 beagle-xm.dtb
     reading beagle-xm.dtb
     11444 bytes read in 8 ms (1.4 MiB/s)
     OMAP3 beagleboard.org # bootz 0x80300000 0x81600000:${initrd_size} 0x815f0000

---------- LINUX BOOT: ------------------------------------------------------

     Kernel image @ 0x80300000 [ 0x000000 - 0x46d398 ]
     ## Loading init Ramdisk from Legacy Image at 81600000 ...
        Image Name:   initramfs
        Image Type:   ARM Linux RAMDisk Image (uncompressed)
        Data Size:    3160490 Bytes = 3 MiB
        Load Address: 00000000
        Entry Point:  00000000
        Verifying Checksum ... OK
     ## Flattened Device Tree blob at 815f0000
        Booting using the fdt blob at 0x815f0000
        Loading Ramdisk to 8fcfc000, end 8ffff9aa ... OK
        Loading Device Tree to 8fcf6000, end 8fcfbcb3 ... OK

     Starting kernel ...

     Booting Linux on physical CPU 0x0
     Initializing cgroup subsys cpuset
     Initializing cgroup subsys cpu
     Initializing cgroup subsys cpuacct
     Linux version 3.10.11-yocto-standard (builder@qemux86-64) (gcc version 4.8.1 (GCC) ) #1 Tue Apr 1 22:45:53 UTC 2014
     CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=10c53c7d
     CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
     Machine: Generic OMAP3 (Flattened Device Tree), model: TI OMAP3 BeagleBoard xM
     Memory policy: ECC disabled, Data cache writeback
     DT missing boot CPU MPIDR[23:0], fall back to default cpu_logical_map
     CPU: All CPU(s) started in SVC mode.
     OMAP3630 ES1.2 (l2cache iva sgx neon isp 192mhz_clk )
     Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 129792
     Kernel command line: console=ttyO2,115200n8 root=/dev/mmcblk0p2 rootwait rootfstype=ext4 rw
     PID hash table entries: 2048 (order: 1, 8192 bytes)
     Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
     Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
     allocated 1048576 bytes of page_cgroup
     please try 'cgroup_disable=memory' option if you don't want memory cgroups
     Memory: 511MB = 511MB total
     Memory: 503688k/503688k available, 20600k reserved, 0K highmem
     Virtual kernel memory layout:
         vector  : 0xffff0000 - 0xffff1000   (   4 kB)
         fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
         vmalloc : 0xe0800000 - 0xff000000   ( 488 MB)
         lowmem  : 0xc0000000 - 0xe0000000   ( 512 MB)
         pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
         modules : 0xbf000000 - 0xbfe00000   (  14 MB)
           .text : 0xc0008000 - 0xc08ce880   (8987 kB)
           .init : 0xc08cf000 - 0xc09512b4   ( 521 kB)
           .data : 0xc0952000 - 0xc09e6fa0   ( 596 kB)
            .bss : 0xc09e6fa0 - 0xc0aa0360   ( 741 kB)
     SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
     NR_IRQS:16 nr_irqs:16 16
     IRQ: Found an INTC at 0xfa200000 (revision 4.0) with 96 interrupts
     Total of 96 interrupts on 1 active controller
     Clocking rate (Crystal/Core/MPU): 26.0/400/600 MHz
     OMAP clockevent source: timer1 at 32768 Hz
     sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps every 131071999ms
     OMAP clocksource: 32k_counter at 32768 Hz
     Console: colour dummy device 80x30
     Calibrating delay loop... 398.13 BogoMIPS (lpj=1990656)
     pid_max: default: 32768 minimum: 301
     Security Framework initialized
     Mount-cache hash table entries: 512
     Initializing cgroup subsys debug
     Initializing cgroup subsys memory
     Initializing cgroup subsys devices
     Initializing cgroup subsys freezer
     Initializing cgroup subsys net_cls
     Initializing cgroup subsys blkio
     CPU: Testing write buffer coherency: ok
     ftrace: allocating 24224 entries in 72 pages
     Setting up static identity map for 0xc060bdd0 - 0xc060be28
     devtmpfs: initialized
     xor: measuring software checksum speed
        arm4regs  :   745.200 MB/sec
        8regs     :   549.200 MB/sec
        32regs    :   716.000 MB/sec
     xor: using function: arm4regs (745.200 MB/sec)
     pinctrl core: initialized pinctrl subsystem
     regulator-dummy: no parameters
     NET: Registered protocol family 16
     DMA: preallocated 256 KiB pool for atomic coherent allocations
     Reprogramming SDRC clock to 400000000 Hz
     OMAP GPIO hardware version 2.5
     platform 49022000.mcbsp: alias fck already exists
     platform 49024000.mcbsp: alias fck already exists
     omap-gpmc 6e000000.gpmc: GPMC revision 5.0
     hw-breakpoint: debug architecture 0x4 unsupported.
     OMAP DMA hardware revision 5.0
     bio: create slab <bio-0> at 0
     raid6: int32x1     97 MB/s
     raid6: int32x2    117 MB/s
     raid6: int32x4     98 MB/s
     raid6: int32x8    101 MB/s
     raid6: using algorithm int32x2 (117 MB/s)
     raid6: using intx1 recovery algorithm
     omap-dma-engine 48056000.dma-controller: OMAP DMA engine driver
     SCSI subsystem initialized
     usbcore: registered new interface driver usbfs
     usbcore: registered new interface driver hub
     usbcore: registered new device driver usb
     omap_i2c i2c.8: did not get pins for i2c error: -19
     omap_i2c i2c.8: bus 0 rev4.4 at 2600 kHz
     twl 0-0048: PIH (irq 23) chaining IRQs 338..346
     twl 0-0048: power (irq 343) chaining IRQs 346..353
     VDD1: 600 <--> 1450 mV at 1200 mV
     VDAC: 1800 mV
     VPLL2: 1800 mV
     VMMC1: 1850 <--> 3150 mV at 3150 mV
     VUSB1V5: 1500 mV
     VUSB1V8: 1800 mV
     VUSB3V1: 3100 mV
     VSIM: 1800 <--> 3000 mV at 1800 mV
     twl4030_gpio gpio.32: gpio (irq 338) chaining IRQs 354..371
     omap_i2c i2c.9: did not get pins for i2c error: -19
     omap_i2c i2c.9: bus 1 rev4.4 at 400 kHz
     omap_i2c i2c.10: did not get pins for i2c error: -19
     omap_i2c i2c.10: bus 2 rev4.4 at 100 kHz
     Advanced Linux Sound Architecture Driver Initialized.
     cfg80211: Calling CRDA to update world regulatory domain
     Switching to clocksource 32k_counter
     NET: Registered protocol family 2
     TCP established hash table entries: 4096 (order: 3, 32768 bytes)
     TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
     TCP: Hash tables configured (established 4096 bind 4096)
     TCP: reno registered
     UDP hash table entries: 256 (order: 0, 4096 bytes)
     UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
     NET: Registered protocol family 1
     RPC: Registered named UNIX socket transport module.
     RPC: Registered udp transport module.
     RPC: Registered tcp transport module.
     RPC: Registered tcp NFSv4.1 backchannel transport module.
     Trying to unpack rootfs image as initramfs...
     Freeing initrd memory: 3084K (cfcfc000 - cffff000)
     hw perfevents: enabled with ARMv7 Cortex-A8 PMU driver, 5 counters available
     NFS: Registering the id_resolver key type
     Key type id_resolver registered
     Key type id_legacy registered
     bio: create slab <bio-1> at 1
     Btrfs loaded
     aufs 3.10-20130819
     msgmni has been set to 989
     Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
     io scheduler noop registered
     io scheduler deadline registered
     io scheduler cfq registered (default)
     platform omapfb: Driver omapfb requests probe deferral
     omap_uart serial.5: did not get pins for uart0 error: -19
     serial.5: ttyO0 at MMIO 0x4806a000 (irq = 88) is a OMAP UART0
     omap_uart serial.6: did not get pins for uart1 error: -19
     serial.6: ttyO1 at MMIO 0x4806c000 (irq = 89) is a OMAP UART1
     omap_uart serial.7: did not get pins for uart2 error: -19
     serial.7: ttyO2 at MMIO 0x49020000 (irq = 90) is a OMAP UART2
     console [ttyO2] enabled
     omap_uart serial.17: did not get pins for uart3 error: -19
     serial.17: ttyO3 at MMIO 0x49042000 (irq = 96) is a OMAP UART3
     brd: module loaded
     omap2_mcspi spi.11: pins are not configured from the driver
     omap2_mcspi spi.12: pins are not configured from the driver
     omap2_mcspi spi.13: pins are not configured from the driver
     omap2_mcspi spi.14: pins are not configured from the driver
     usbcore: registered new interface driver kaweth
     pegasus: v0.9.3 (2013/04/25), Pegasus/Pegasus II USB Ethernet driver
     usbcore: registered new interface driver pegasus
     usbcore: registered new interface driver rtl8150
     usbcore: registered new interface driver asix
     usbcore: registered new interface driver ax88179_178a
     usbcore: registered new interface driver cdc_ether
     usbcore: registered new interface driver dm9601
     usbcore: registered new interface driver smsc75xx
     usbcore: registered new interface driver smsc95xx
     usbcore: registered new interface driver net1080
     usbcore: registered new interface driver cdc_subset
     usbcore: registered new interface driver zaurus
     usbcore: registered new interface driver MOSCHIP usb-ethernet driver
     usbcore: registered new interface driver int51x1
     usbcore: registered new interface driver cdc_ncm
     ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
     ehci-omap: OMAP-EHCI Host Controller driver
     ehci-omap 48064800.ehci: EHCI Host Controller
     ehci-omap 48064800.ehci: new USB bus registered, assigned bus number 1
     ehci-omap 48064800.ehci: irq 93, io mem 0x48064800
     ehci-omap 48064800.ehci: USB 2.0 started, EHCI 1.00
     hub 1-0:1.0: USB hub found
     hub 1-0:1.0: 3 ports detected
     usbcore: registered new interface driver usb-storage
     musb-hdrc musb-hdrc.0.auto: musb_init_controller failed with status -6
     mousedev: PS/2 mouse device common for all mice
     twl_rtc rtc.22: Power up reset detected.
     twl_rtc rtc.22: Enabling TWL-RTC
     twl_rtc rtc.22: rtc core: registered rtc.22 as rtc0
     omap_wdt: OMAP Watchdog Timer Rev 0x31: initial timeout 60 sec
     cpuidle: using governor ladder
     cpuidle: using governor menu
     omap-dma-engine 48056000.dma-controller: allocating channel for 62
     omap-dma-engine 48056000.dma-controller: allocating channel for 61
     omap_hsmmc mmc.15: pins are not configured from the driver
     usbcore: registered new interface driver usbhid
     usbhid: USB HID core driver
     mmc0: host does not support reading read-only switch. assuming write-enable.
     mmc0: new high speed SD card at address 0002
     mmcblk0: mmc0:0002 00000 1.86 GiB
      mmcblk0: p1 p2
     omap-twl4030 sound.20:  twl4030-hifi <-> 49022000.mcbsp mapping ok
     oprofile: using arm/armv7
     u32 classifier
         Actions configured
     TCP: cubic registered
     NET: Registered protocol family 10
     sit: IPv6 over IPv4 tunneling driver
     NET: Registered protocol family 17
     Key type dns_resolver registered
     VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 3
     ThumbEE CPU extension supported.
     VUSB3V1: disabling
     VPLL2: disabling
     VDAC: disabling
     platform omapfb: Driver omapfb requests probe deferral
     console [netcon0] enabled
     netconsole: network logging started
     twl_rtc rtc.22: setting system clock to 2000-01-01 00:00:00 UTC (946684800)
     ALSA device list:
       #0: omap3beagle
     Freeing unused kernel memory: 520K (c08cf000 - c0951000)
     Loading, please wait...
     udevd[71]: starting version 175
     modprobe: chdir(3.10.11-yocto-standard): No such file or directory
     Begin: Loading essential drivers ... done.
     Begin: Running /scripts/init-premount ... done.
     Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
     Begin: Running /scripts/local-premount ... done.
     modprobe: chdir(3.10.11-yocto-standard): No such file or directory
     EXT4-fs (mmcblk0p2): recovery complete
     EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)
     Begin: Running /scripts/local-bottom ... done.
     done.
     Begin: Running /scripts/init-bottom ... done.
     INIT: version 2.88 booting
     Error opening /dev/fb0: No such file or directory
     Starting Bootlog daemon: bootlogd.
     EXT4-fs (mmcblk0p2): re-mounted. Opts: data=ordered
     Configuring network interfaces... ifconfig: SIOCGIFFLAGS: No such device
     ifconfig: SIOCGIFFLAGS: No such device
     Wed Apr  2 09:19:00 UTC 2014
     INIT: Entering runlevel: 5
     Starting system message bus: dbus.
     Starting Dropbear SSH server: dropbear.
     Starting syslogd/klogd: done
     Stopping Bootlog daemon: bootlogd.

     Poky (Yocto Project Reference Distro) 1.5 beagleboard /dev/ttyO2

     beagleboard login: root
     root@beagleboard:~# ifconfig -a
     lo        Link encap:Local Loopback
               inet addr:127.0.0.1  Mask:255.0.0.0
               inet6 addr: ::1/128 Scope:Host
               UP LOOPBACK RUNNING  MTU:65536  Metric:1
               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
               TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:0
               RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

     sit0      Link encap:IPv6-in-IPv4
               NOARP  MTU:1480  Metric:1
               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
               TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:0
               RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

     root@beagleboard:~#




