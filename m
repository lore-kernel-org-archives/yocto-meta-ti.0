Return-Path: <ml@communistcode.co.uk>
Received: from tinyArch.localdomain (unknown [78.110.170.148])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D2A3E0030B
	for <meta-ti@yoctoproject.org>; Tue, 22 May 2012 08:47:15 -0700 (PDT)
Received: from [192.168.0.18] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 0F87948C52
	for <meta-ti@yoctoproject.org>; Tue, 22 May 2012 16:32:01 +0100 (BST)
Message-ID: <4FBBB531.8020401@communistcode.co.uk>
Date: Tue, 22 May 2012 16:48:01 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: Beaglebone + Poky
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
X-List-Received-Date: Tue, 22 May 2012 15:47:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am currently trying to boot my beagleboard with a mix of 
Poky/Meta-ti/meta-oe, I can build the image without error however when I 
start booting the board the kernel gets to 'freeing init memory' and 
seems to hang, although the beaglebone light is still flashing and it 
will still accept keystrokes. Could anyone shed any light on the situation?

I am on the denzil branch for all three repositories.

I have tried with USB only and USB + AC Adapter.

Regards,
Jack.

U-Boot SPL 2011.09-dirty (May 22 2012 - 15:05:03)
Texas Instruments Revision detection unimplemented
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.09-dirty (May 22 2012 - 15:05:03)

I2C:   ready
DRAM:  256 MiB
No daughter card present
NAND:  HW ECC Hamming Code selected
No NAND device found!!!
0 MiB
MMC:   OMAP SD/MMC: 0
*** Warning - readenv() failed, using default environment

Net:   cpsw
Hit any key to stop autoboot:  0
SD/MMC found on device 0
reading uEnv.txt

** Unable to read "uEnv.txt" from mmc 0:1 **
Loading file "/boot/uImage" from mmc device 0:2 xxa2
3158576 bytes read
## Booting kernel from Legacy Image at 80007fc0 ...
    Image Name:   Linux-3.2.16
    Image Type:   ARM Linux Kernel Image (uncompressed)
    Data Size:    3158512 Bytes = 3 MiB
    Load Address: 80008000
    Entry Point:  80008000
    Verifying Checksum ... OK
    XIP Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 3.2.16 (jack@archHP) (gcc version 4.6.4 
20120303 (prerelease) (GCC) ) #1 Tue May 22 14:53:09 BST 2012
[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), 
cr=50c53c7d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing 
instruction cache
[    0.000000] Machine: am335xevm
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] AM335X ES1.0 (sgx neon )
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  
Total pages: 65024
[    0.000000] Kernel command line: console=ttyO0,115200n8 
root=/dev/mmcblk0p2 ro rootfstype=ext4 rootwait ip=none
[    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 
bytes)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] allocated 1048576 bytes of page_cgroup
[    0.000000] please try 'cgroup_disable=memory' option if you don't 
want memory cgroups
[    0.000000] Memory: 256MB = 256MB total
[    0.000000] Memory: 253744k/253744k available, 8400k reserved, 0K highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xd0800000 - 0xff000000   ( 744 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
[    0.000000]     modules : 0xbf800000 - 0xc0000000   (   8 MB)
[    0.000000]       .text : 0xc0008000 - 0xc04279f0   (4223 kB)
[    0.000000]       .init : 0xc0428000 - 0xc045f000   ( 220 kB)
[    0.000000]       .data : 0xc0460000 - 0xc04b0ac0   ( 323 kB)
[    0.000000]        .bss : 0xc04b0ae4 - 0xc04f7f0c   ( 286 kB)
[    0.000000] NR_IRQS:410 nr_irqs:410 410
[    0.000000] IRQ: Found an INTC at 0xfa200000 (revision 5.0) with 128 
interrupts
[    0.000000] Total of 128 interrupts on 1 active controller
[    0.000000] OMAP clockevent source: GPTIMER2 at 24000000 Hz
[    0.000000] omap_dm_timer_switch_src: Switching to HW default 
clocksource(sys_clkin_ck) for timer1, this may impact timekeeping in low 
power state
[    0.000000] OMAP clocksource: GPTIMER1 at 24000000 Hz
[    0.000000] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps 
every 178956ms
[    0.000000] Console: colour dummy device 80x30
[    0.000178] Calibrating delay loop... 479.23 BogoMIPS (lpj=2396160)
[    0.056352] pid_max: default: 32768 minimum: 301
[    0.056475] Security Framework initialized
[    0.056531] Mount-cache hash table entries: 512
[    0.056876] Initializing cgroup subsys cpuacct
[    0.056914] Initializing cgroup subsys memory
[    0.056948] Initializing cgroup subsys devices
[    0.056959] Initializing cgroup subsys freezer
[    0.056969] Initializing cgroup subsys blkio
[    0.056989] Initializing cgroup subsys perf_event
[    0.057060] CPU: Testing write buffer coherency: ok
[    0.057915] devtmpfs: initialized
[    0.076953] omap_hwmod: gfx: failed to hardreset
[    0.092824] omap_hwmod: pruss: failed to hardreset
[    0.093292] print_constraints: dummy:
[    0.093511] NET: Registered protocol family 16
[    0.094475] OMAP GPIO hardware version 0.1
[    0.095426] omap_mux_init: Add partition: #1: core, flags: 0
[    0.096614]  omap_i2c.1: alias fck already exists
[    0.096934] hw-breakpoint: debug architecture 0x4 unsupported.
[    0.097075]  omap2_mcspi.1: alias fck already exists
[    0.097175]  omap2_mcspi.2: alias fck already exists
[    0.097314]  edma.0: alias fck already exists
[    0.097333]  edma.0: alias fck already exists
[    0.097349]  edma.0: alias fck already exists
[    0.105373] bio: create slab <bio-0> at 0
[    0.106431] SCSI subsystem initialized
[    0.107199] usbcore: registered new interface driver usbfs
[    0.107312] usbcore: registered new interface driver hub
[    0.107458] usbcore: registered new device driver usb
[    0.107569] musb-ti81xx musb-ti81xx: musb0, board_mode=0x13, 
plat_mode=0x3
[    0.107690] musb-ti81xx musb-ti81xx: musb1, board_mode=0x13, 
plat_mode=0x1
[    0.126404] omap_i2c omap_i2c.1: bus 1 rev2.4.0 at 100 kHz
[    0.127355] Advanced Linux Sound Architecture Driver Version 1.0.24.
[    0.127858] Switching to clocksource gp timer
[    0.137487] musb-hdrc: version 6.0, ?dma?, otg (peripheral+host)
[    0.137645] musb-hdrc musb-hdrc.0: dma type: pio
[    0.138227] musb-hdrc musb-hdrc.0: USB OTG mode controller at 
d081c000 using PIO, IRQ 18
[    0.138469] musb-hdrc musb-hdrc.1: dma type: pio
[    0.138694] musb-hdrc musb-hdrc.1: MUSB HDRC host driver
[    0.138757] musb-hdrc musb-hdrc.1: new USB bus registered, assigned 
bus number 1
[    0.138862] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    0.138878] usb usb1: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    0.138891] usb usb1: Product: MUSB HDRC host driver
[    0.138902] usb usb1: Manufacturer: Linux 3.2.16 musb-hcd
[    0.138912] usb usb1: SerialNumber: musb-hdrc.1
[    0.139481] hub 1-0:1.0: USB hub found
[    0.139507] hub 1-0:1.0: 1 port detected
[    0.139920] musb-hdrc musb-hdrc.1: USB Host mode controller at 
d081e800 using PIO, IRQ 19
[    0.140276] NET: Registered protocol family 2
[    0.140460] IP route cache hash table entries: 2048 (order: 1, 8192 
bytes)
[    0.140824] TCP established hash table entries: 8192 (order: 4, 65536 
bytes)
[    0.140980] TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
[    0.141075] TCP: Hash tables configured (established 8192 bind 8192)
[    0.141086] TCP reno registered
[    0.141101] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.141124] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.141357] NET: Registered protocol family 1
[    0.141654] RPC: Registered named UNIX socket transport module.
[    0.141667] RPC: Registered udp transport module.
[    0.141676] RPC: Registered tcp transport module.
[    0.141685] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.143218] audit: initializing netlink socket (disabled)
[    0.143271] type=2000 audit(0.130:1): initialized
[    0.153293] VFS: Disk quotas dquot_6.5.2
[    0.153353] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    0.154308] msgmni has been set to 495
[    0.155166] Block layer SCSI generic (bsg) driver version 0.4 loaded 
(major 252)
[    0.155252] io scheduler noop registered
[    0.155264] io scheduler deadline registered
[    0.155314] io scheduler cfq registered (default)
[    0.156173] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.157405] omap_uart.0: ttyO0 at MMIO 0x44e09000 (irq = 72) is a 
OMAP UART0
[    0.777300] console [ttyO0] enabled
[    0.781446] omap_uart.1: ttyO1 at MMIO 0x48022000 (irq = 73) is a 
OMAP UART1
[    0.789165] omap_uart.2: ttyO2 at MMIO 0x48024000 (irq = 74) is a 
OMAP UART2
[    0.796835] omap_uart.3: ttyO3 at MMIO 0x481a6000 (irq = 44) is a 
OMAP UART3
[    0.804528] omap_uart.4: ttyO4 at MMIO 0x481a8000 (irq = 45) is a 
OMAP UART4
[    0.812239] omap_uart.5: ttyO5 at MMIO 0x481aa000 (irq = 46) is a 
OMAP UART5
[    0.820912] brd: module loaded
[    0.827496] loop: module loaded
[    0.830892] at24 1-0051: 32768 byte 24c256 EEPROM, writable, 64 
bytes/write
[    0.897896] No daughter card found
[    0.901487] at24 1-0050: 32768 byte 24c256 EEPROM, writable, 64 
bytes/write
[    0.916670] Board name: A335BONE
[    0.920045] Board version: 00A5
[    0.923316] The board is a AM335x Beaglebone.
[    0.928500] tps65217 1-0024: TPS65217 ID 0x7 version 1.0
[    0.935814] print_constraints: DCDC1: 900 <--> 1800 mV at 1800 mV
[    0.944075] print_constraints: DCDC2: 900 <--> 3300 mV at 1275 mV
[    0.952311] print_constraints: DCDC3: 900 <--> 1500 mV at 1100 mV
[    0.960533] print_constraints: LDO1: 1000 <--> 3300 mV at 1800 mV
[    0.968775] print_constraints: LDO2: 900 <--> 3300 mV at 3300 mV
[    0.976905] print_constraints: LDO3: 1800 <--> 3300 mV at 3300 mV
[    0.985137] print_constraints: LDO4: 1800 <--> 3300 mV at 3300 mV
[    0.992380]  omap_i2c.3: alias fck already exists
[    1.007953] omap_i2c omap_i2c.3: bus 3 rev2.4.0 at 100 kHz
[    1.014293]  omap_hsmmc.0: alias fck already exists
[    1.019663] w1-gpio connected to P8_6
[    1.026210] at24 3-0054: 32768 byte 24c256 EEPROM, writable, 64 
bytes/write
[    1.087901] BeagleBone cape EEPROM: could not read eeprom at address 0x54
[    1.095018] at24 3-0055: 32768 byte 24c256 EEPROM, writable, 64 
bytes/write
[    1.157896] BeagleBone cape EEPROM: could not read eeprom at address 0x55
[    1.165010] at24 3-0056: 32768 byte 24c256 EEPROM, writable, 64 
bytes/write
[    1.227896] BeagleBone cape EEPROM: could not read eeprom at address 0x56
[    1.234999] at24 3-0057: 32768 byte 24c256 EEPROM, writable, 64 
bytes/write
[    1.297896] BeagleBone cape EEPROM: could not read eeprom at address 0x57
[    1.304970] BeagleBone cape: exporting ADC pins to sysfs
[    1.310942] BeagleBone cape: exporting SPI pins as spidev
[    1.317395] SCSI Media Changer driver v0.25
[    1.322171] CAN device driver interface
[    1.326167] CAN bus driver for Bosch D_CAN controller 1.0
[    1.377919] davinci_mdio davinci_mdio.0: davinci mdio revision 1.6
[    1.384364] davinci_mdio davinci_mdio.0: detected phy mask fffffffe
[    1.391760] davinci_mdio.0: probed
[    1.395312] davinci_mdio davinci_mdio.0: phy[0]: device 0:00, driver 
SMSC LAN8710/LAN8720
[    1.404010] usbcore: registered new interface driver catc
[    1.409653] catc: v2.8:CATC EL1210A NetMate USB Ethernet driver
[    1.415877] usbcore: registered new interface driver kaweth
[    1.421698] pegasus: v0.6.14 (2006/09/27), Pegasus/Pegasus II USB 
Ethernet driver
[    1.429575] usbcore: registered new interface driver pegasus
[    1.435472] rtl8150: v0.6.2 (2004/08/27):rtl8150 based usb-ethernet 
driver
[    1.442697] usbcore: registered new interface driver rtl8150
[    1.448676] usbcore: registered new interface driver asix
[    1.454352] usbcore: registered new interface driver cdc_ether
[    1.460494] usbcore: registered new interface driver dm9601
[    1.466351] usbcore: registered new interface driver cdc_subset
[    1.472584] usbcore: registered new interface driver zaurus
[    1.478439] cdc_ncm: 04-Aug-2011
[    1.481855] usbcore: registered new interface driver cdc_ncm
[    1.487861] usbcore: registered new interface driver cdc_acm
[    1.493775] cdc_acm: USB Abstract Control Model driver for USB modems 
and ISDN adapters
[    1.502202] usbcore: registered new interface driver usblp
[    1.507985] usbcore: registered new interface driver cdc_wdm
[    1.513940] usbcore: registered new interface driver uas
[    1.519487] Initializing USB Mass Storage driver...
[    1.524676] usbcore: registered new interface driver usb-storage
[    1.530949] USB Mass Storage support registered.
[    1.535847] usbcore: registered new interface driver libusual
[    1.542249] mousedev: PS/2 mouse device common for all mice
[    1.548570] dev addr = cf9cea08
[    1.551844] pdev addr = cf9cea00
[    1.555865] omap_rtc omap_rtc: rtc core: registered omap_rtc as rtc0
[    1.562667] i2c /dev entries driver
[    1.566678] Linux media interface: v0.10
[    1.570924] lirc_dev: IR Remote Control driver registered, major 249
[    1.577637] IR NEC protocol handler initialized
[    1.582371] IR RC5(x) protocol handler initialized
[    1.587361] IR RC6 protocol handler initialized
[    1.592089] IR JVC protocol handler initialized
[    1.596807] IR Sony protocol handler initialized
[    1.601625] IR RC5 (streamzap) protocol handler initialized
[    1.607430] IR MCE Keyboard/mouse protocol handler initialized
[    1.613516] IR LIRC bridge handler initialized
[    1.618153] Linux video capture interface: v2.00
[    1.623094] usbcore: registered new interface driver uvcvideo
[    1.629097] USB Video Class driver (1.1.1)
[    1.633431] Driver for 1-wire Dallas network protocol.
[    1.640004] OMAP Watchdog Timer Rev 0x01: initial timeout 60 sec
[    1.647659] cpuidle: using governor ladder
[    1.652101] cpuidle: using governor menu
[    1.658737] usbcore: registered new interface driver usbhid
[    1.664546] usbhid: USB HID core driver
[    1.669451] usbcore: registered new interface driver snd-usb-audio
[    1.676655] ALSA device list:
[    1.679793]   No soundcards found.
[    1.683657] TCP cubic registered
[    1.687020] Initializing XFRM netlink socket
[    1.691529] NET: Registered protocol family 17
[    1.696209] NET: Registered protocol family 15
[    1.700856] can: controller area network core (rev 20090105 abi 8)
[    1.707384] NET: Registered protocol family 29
[    1.712029] can: raw protocol (rev 20090105)
[    1.716515] Registering the dns_resolver key type
[    1.721490] VFP support v0.3: implementor 41 architecture 3 part 30 
variant c rev 3
[    1.729503] ThumbEE CPU extension supported.
[    1.734014] mux: Failed to setup hwmod io irq -22
[    1.739572] Power Management for AM33XX family
[    1.744376] Trying to load am335x-pm-firmware.bin (60 secs timeout)
[    1.751049] Copied the M3 firmware to UMEM
[    1.755330] omap_hwmod: wkup_m3: wkup_m3: hwmod data error: OMAP4 
does not support st_shift
[    1.768463] registered taskstats version 1
[    1.773017] Detected MACID=d4:94:a1:8b:b:68
[    1.778320] omap_rtc omap_rtc: setting system clock to 2000-01-01 
00:00:01 UTC (946684801)
[    1.787592] Waiting for root device /dev/mmcblk0p2...
[    1.828855] mmc0: host does not support reading read-only switch. 
assuming write-enable.
[    1.839796] mmc0: new high speed SDHC card at address 1234
[    1.846016] mmcblk0: mmc0:1234 SA04G 3.63 GiB
[    1.852877]  mmcblk0: p1 p2
[    1.911841] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data 
mode. Opts: (null)
[    1.920383] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
[    1.930940] devtmpfs: mounted
[    1.934373] Freeing init memory: 220K

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


