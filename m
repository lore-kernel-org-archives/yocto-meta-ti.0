Return-Path: <dv@pseudoterminal.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23DA0E007FE; Mon, 18 Aug 2014 02:10:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 164D1E007F9
	for <meta-ti@yoctoproject.org>; Mon, 18 Aug 2014 02:10:17 -0700 (PDT)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id B12172336D
	for <meta-ti@yoctoproject.org>; Mon, 18 Aug 2014 11:10:15 +0200 (CEST)
Message-ID: <53F1C2F5.50209@pseudoterminal.org>
Date: Mon, 18 Aug 2014 11:10:13 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <53ED13BE.2090809@pseudoterminal.org>
	<20140814200450.GX23523@edge>	<53ED175D.2090502@pseudoterminal.org>
	<2948184.BeJYLBqp38@localhost.localdomain>
In-Reply-To: <2948184.BeJYLBqp38@localhost.localdomain>
Subject: Re: BeagleBone Black , u-boot, and zImage
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Aug 2014 09:10:29 -0000
Content-Type: multipart/alternative;
	boundary="------------020208080604050008030204"

--------------020208080604050008030204
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2014-08-14 22:20, Maciej Borzecki wrote:
> On Thursday 14 of August 2014 22:09:01 Carlos Rafael Giani wrote:
>> On 08/14/2014 10:04 PM, Denys Dmytriyenko wrote:
>>> On Thu, Aug 14, 2014 at 09:53:34PM +0200, Carlos Rafael Giani wrote:
>>>> Hello,
>>>>
>>>> after building a rootfs for the Beaglebone Black, I see the
>>>> following files in the deploy folder for the machine:
>>>>
>>>> MLO
>>>> u-boot.img
>>>> u-boot-spl.bin
>>>> zImage
>>>>
>>>> as well as other symlinks with "-beaglebone" attached to their filenames.
>>>>
>>>> What should I copy, the SPL bin, or the .img u-boot binary?
>>>> Also, u-boot tries to load a uImage, even though a zImage was built.
>>>> There is also no uEnv.txt file.
>>>> Do I have to write one to be able to let u-boot load the zImage, or
>>>> should it work out-of-the-box?
>>> Depends on the rootfs image you are building. Most images that are based
>>> on
>>> core-image-base will take care of deploying necessary pieces into the
>>> rootfs. But core-image-minimal is special and very bare-bone, so extra
>>> manual steps are required.
>>>
>>> Regardless of the rootfs image, you'd need MLO and u-boot.img to be
>>> located in the first FAT partition of your SD card or eMMC flash.
>>>
>>> Then, if your rootfs does not already have zImage and the necessary DTB
>>> files in the /boot directory, you have to place them there (i.e.
>>> core-image-minimal) and you are ready to boot. All the defaults will work
>>> for out-of-the-box in this case. No uEnv.txt is necessary, unless you
>>> need to do something extra special...
>> Oh, I just built core-image-base .
>>
>> So I should use the .img and not the SPL .bin? I was wondering if the
>> SPL bin is a newer binary that will eventually replace the .img one.
>>
>> But when I use the .img file, it turns out that it tries to load a
>> uImage, even though a zImage was built. Simply setting the bootfile env
>> var to "zImage" won't work, because the u-boot script will try to boot
>> with the incorrect command.
> Try setting bootfile=zImage in uEnv.txt in the first partition.
>
>> I am trying to rule out that something went wrong in my build, that
>> something is wrong in my setup. If I build core-image-base , the
>> resulting u-boot.img should automatically load a zImage, not a uImage,
>> correct?
> Can you post serial output from uboot?
>
> Your default environment should look similar to what is here:
> http://git.denx.de/?p=u-boot.git;a=blob;f=include/configs/am335x_evm.h;h=a48b386477167010c8e0d206423a3bdbe611cf83;hb=524123a70761110c5cf3ccc5f52f6d4da071b959#l78
>
>
>

I rebuilt the image, with the proper layers, but still I get an 
incorrect u-boot environment. Full u-boot serial output and boot log 
follow below.
uname -a prints:  Linux beaglebone 3.14.16 #1 Thu Aug 14 18:00:21 CEST 
2014 armv7l GNU/Linux
(the kernel was built by the linux-ti-staging recipe)

The u-boot problem bootfile is set to uImage, and mmcboot uses bootm 
instead of bootz.

Furthermore, once I correct these two values, it boots, but I see this 
eventually:

   Error opening /dev/fb0: No such file or directory

After a bit of investigation, it turned out that omaplfb wasn't loading 
due to missing symbols:

   root@beaglebone:~# modprobe omaplfb
   [   83.010309] omaplfb: Unknown symbol register_vsync_cb (err 0)
   [   83.016642] omaplfb: Unknown symbol unregister_vsync_cb (err 0)

Searching for this, I found 
https://groups.google.com/forum/#!topic/beagleboard/dcLtpK7ZsX0 . 
According to this, in the kernel log, I should set CONFIG_FB_DA8XX to 
"y". Is this still correct for linux-ti-staging 3.14.16 ?

Layer git configuration:
All layers are in their daisy branches.
poky: SRCREV 87671f72e7459d5d5ddb37691354fab970c557ee
meta-ti: SRCREV a817ad5826b1c35084a6abb093b89a3916ecb283
meta-oe: 9ee63edfd9c6e5c22ce707770955a5796cde2cfc
meta-qt5: a06222499ab602e7c67c1433dd0b559d51d3d744



The u-boot serial output:



U-Boot SPL 2013.04-rc1-14237-g90639fe-dirty (Apr 13 2013 - 13:57:11)
musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, HB-ISO Rx, HB-ISO Tx, 
SoftConn)
musb-hdrc: MHDRC RTL version 2.0
musb-hdrc: setup fifo_mode 4
musb-hdrc: 28/31 max ep, 16384/16384 memory
USB Peripheral mode controller at 47401000 using PIO, IRQ 0
musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, HB-ISO Rx, HB-ISO Tx, 
SoftConn)
musb-hdrc: MHDRC RTL version 2.0
musb-hdrc: setup fifo_mode 4
musb-hdrc: 28/31 max ep, 16384/16384 memory
USB Host mode controller at 47401800 using PIO, IRQ 0
OMAP SD/MMC: 0
mmc_send_cmd : timeout: No status update
reading u-boot.img
reading u-boot.img


U-Boot 2013.04-rc1-14237-g90639fe-dirty (Apr 13 2013 - 13:57:11)

I2C:   ready
DRAM:  256 MiB
WARNING: Caches not enabled
NAND:  No NAND device found!!!
0 MiB
MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
*** Warning - readenv() failed, using default environment

musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, HB-ISO Rx, HB-ISO Tx, 
SoftConn)
musb-hdrc: MHDRC RTL version 2.0
musb-hdrc: setup fifo_mode 4
musb-hdrc: 28/31 max ep, 16384/16384 memory
USB Peripheral mode controller at 47401000 using PIO, IRQ 0
musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, HB-ISO Rx, HB-ISO Tx, 
SoftConn)
musb-hdrc: MHDRC RTL version 2.0
musb-hdrc: setup fifo_mode 4
musb-hdrc: 28/31 max ep, 16384/16384 memory
USB Host mode controller at 47401800 using PIO, IRQ 0
Net:   <ethaddr> not set. Validating first E-fuse MAC
cpsw, usb_ether
Hit any key to stop autoboot:  0
U-Boot#
U-Boot#
U-Boot# printenv
arch=arm
baudrate=115200
board=am335x
board_name=A335BNLT
board_rev=0A5A
bootcmd=gpio set 53; i2c mw 0x24 1 0x3e; run findfdt; mmc dev 0; if mmc 
rescan ; then echo micro SD card found;setenv mmcdev 0;else echo No 
micro SD card found, setting mmcdev to 1;setenv mmcdev 1;fi;setenv 
bootpart ${mmcdev}:2;mmc dev ${mmcdev}; if mmc rescan; then gpi;
bootdelay=1
bootdir=/boot
bootenv=uEnv.txt
bootfile=uImage
bootpart=0:2
console=ttyO0,115200n8
cpu=armv7
ethact=cpsw
ethaddr=c8:a0:30:ac:e0:b9
fdt_high=0xffffffff
fdtaddr=0x80F80000
fdtfile=am335x-boneblack.dtb
findfdt=if test $board_name = A335BONE; then setenv fdtfile 
am335x-bone.dtb; fi; if test $board_name = A335BNLT; then setenv fdtfile 
am335x-boneblack.dtb; fi; if test $board_name = A33515BB; then setenv 
fdtfile am335x-evm.dtb; fi; if test $board_name = A335X_SK; then sei
importbootenv=echo Importing environment from mmc ...; env import -t 
$loadaddr $filesize
kloadaddr=0x80007fc0
loadaddr=0x80200000
loadbootenv=load mmc ${mmcdev} ${loadaddr} ${bootenv}
loadfdt=load mmc ${bootpart} ${fdtaddr} ${bootdir}/${fdtfile}
loadramdisk=load mmc ${mmcdev} ${rdaddr} ramdisk.gz
loaduimage=load mmc ${bootpart} ${kloadaddr} ${bootdir}/${bootfile}
mmcargs=setenv bootargs console=${console} ${optargs} root=${mmcroot} 
rootfstype=${mmcrootfstype}
mmcboot=echo Booting from mmc ...; run mmcargs; bootm ${kloadaddr} - 
${fdtaddr}
mmcdev=0
mmcroot=/dev/mmcblk0p2 ro
mmcrootfstype=ext4 rootwait
nandargs=setenv bootargs console=${console} ${optargs} root=${nandroot} 
rootfstype=${nandrootfstype}
nandboot=echo Booting from nand ...; run nandargs; nand read ${loadaddr} 
${nandsrcaddr} ${nandimgsize}; bootm ${loadaddr}
nandimgsize=0x500000
nandroot=ubi0:rootfs rw ubi.mtd=7,2048
nandrootfstype=ubifs rootwait=1
nandsrcaddr=0x280000
netargs=setenv bootargs console=${console} ${optargs} root=/dev/nfs 
nfsroot=${serverip}:${rootpath},${nfsopts} rw ip=dhcp
netboot=echo Booting from network ...; setenv autoload no; dhcp; tftp 
${loadaddr} ${bootfile}; tftp ${fdtaddr} ${fdtfile}; run netargs; bootm 
${loadaddr} - ${fdtaddr}
nfsopts=nolock
ramargs=setenv bootargs console=${console} ${optargs} root=${ramroot} 
rootfstype=${ramrootfstype}
ramboot=echo Booting from ramdisk ...; run ramargs; bootm ${loadaddr} 
${rdaddr} ${fdtaddr}
ramroot=/dev/ram0 rw ramdisk_size=65536 initrd=${rdaddr},64M
ramrootfstype=ext2
rdaddr=0x81000000
rootpath=/export/rootfs
soc=am33xx
spiargs=setenv bootargs console=${console} ${optargs} root=${spiroot} 
rootfstype=${spirootfstype}
spiboot=echo Booting from spi ...; run spiargs; sf probe ${spibusno}:0; 
sf read ${loadaddr} ${spisrcaddr} ${spiimgsize}; bootm ${loadaddr}
spibusno=0
spiimgsize=0x362000
spiroot=/dev/mtdblock4 rw
spirootfstype=jffs2
spisrcaddr=0xe0000
static_ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:${hostname}::off
stderr=serial
stdin=serial
stdout=serial
usbnet_devaddr=c8:a0:30:ac:e0:b9
vendor=ti
ver=U-Boot 2013.04-rc1-14237-g90639fe-dirty (Apr 13 2013 - 13:57:11)

Environment size: 3390/131068 bytes








And the full boot log:

gpio: pin 53 (gpio 53) value is 1
mmc0 is current device
micro SD card found
mmc0 is current device
gpio: pin 54 (gpio 54) value is 1
SD/MMC found on device 0
reading uEnv.txt
** Unable to read file uEnv.txt **
gpio: pin 55 (gpio 55) value is 1
4518456 bytes read in 782 ms (5.5 MiB/s)
gpio: pin 56 (gpio 56) value is 1
29723 bytes read in 42 ms (690.4 KiB/s)
Booting from mmc ...
## Flattened Device Tree blob at 80f80000
    Booting using the fdt blob at 0x80f80000
    Using Device Tree in place at 80f80000, end 80f8a41a

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 3.14.16 (carlos@soylentgreen) (gcc version 
4.8.2 (GCC) ) #1 Thu Aug 14 18:00:21 CEST 2014
[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), 
cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing 
instruction cache
[    0.000000] Machine model: TI AM335x BeagleBone
[    0.000000] cma: CMA: reserved 24 MiB at 8e000000
[    0.000000] Memory policy: Data cache writeback
[    0.000000] CPU: All CPU(s) started in SVC mode.
[    0.000000] AM335X ES2.0 (sgx neon )
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  
Total pages: 64512
[    0.000000] Kernel command line: console=ttyO0,115200n8 
root=/dev/mmcblk0p2 ro rootfstype=ext4 rootwait
[    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 
bytes)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Memory: 218236K/260096K available (5869K kernel code, 
716K rwdata, 2328K rodata, 383K init, 5505K bss, 41860K reserved, 0K 
highmem)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xd0800000 - 0xff000000   ( 744 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0809650   (8198 kB)
[    0.000000]       .init : 0xc080a000 - 0xc0869efc   ( 384 kB)
[    0.000000]       .data : 0xc086a000 - 0xc091d3d0   ( 717 kB)
[    0.000000]        .bss : 0xc091d3d0 - 0xc0e7da88   (5506 kB)
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] IRQ: Found an INTC at 0xfa200000 (revision 5.0) with 128 
interrupts
[    0.000000] Total of 128 interrupts on 1 active controller
[    0.000000] OMAP clockevent source: timer2 at 24000000 Hz
[    0.000016] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps 
every 178956969942ns
[    0.000076] OMAP clocksource: timer1 at 24000000 Hz
[    0.001114] Console: colour dummy device 80x30
[    0.001189] Lock dependency validator: Copyright (c) 2006 Red Hat, 
Inc., Ingo Molnar
[    0.001203] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.001215] ... MAX_LOCK_DEPTH:          48
[    0.001227] ... MAX_LOCKDEP_KEYS:        8191
[    0.001238] ... CLASSHASH_SIZE:          4096
[    0.001249] ... MAX_LOCKDEP_ENTRIES:     16384
[    0.001261] ... MAX_LOCKDEP_CHAINS:      32768
[    0.001272] ... CHAINHASH_SIZE:          16384
[    0.001284]  memory used by lock dependency info: 3695 kB
[    0.001296]  per task-struct memory footprint: 1152 bytes
[    0.001358] Calibrating delay loop... 545.99 BogoMIPS (lpj=2729984)
[    0.108646] pid_max: default: 32768 minimum: 301
[    0.108972] Security Framework initialized
[    0.109090] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.109109] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 
bytes)
[    0.138418] CPU: Testing write buffer coherency: ok
[    0.140210] Setting up static identity map for 0x80592220 - 0x80592290
[    0.146475] devtmpfs: initialized
[    0.152754] VFP support v0.3: implementor 41 architecture 3 part 30 
variant c rev 3
[    0.204020] omap_hwmod: tptc0 using broken dt data from edma
[    0.204555] omap_hwmod: tptc1 using broken dt data from edma
[    0.205071] omap_hwmod: tptc2 using broken dt data from edma
[    0.215056] omap_hwmod: debugss: _wait_target_disable failed
[    0.279267] pinctrl core: initialized pinctrl subsystem
[    0.285701] regulator-dummy: no parameters
[    0.290985] NET: Registered protocol family 16
[    0.299227] DMA: preallocated 256 KiB pool for atomic coherent 
allocations
[    0.307674] cpuidle: using governor ladder
[    0.307707] cpuidle: using governor menu
[    0.327069] platform 49000000.edma: alias fck already exists
[    0.327120] platform 49000000.edma: alias fck already exists
[    0.327150] platform 49000000.edma: alias fck already exists
[    0.333520] OMAP GPIO hardware version 0.1
[    0.374624] No ATAGs?
[    0.374655] hw-breakpoint: debug architecture 0x4 unsupported.
[    0.467736] bio: create slab <bio-0> at 0
[    0.526701] edma-dma-engine edma-dma-engine.0: TI EDMA DMA engine driver
[    0.529651] vmmcsd_fixed: 3300 mV
[    0.540958] SCSI subsystem initialized
[    0.546519] usbcore: registered new interface driver usbfs
[    0.547164] usbcore: registered new interface driver hub
[    0.548110] usbcore: registered new device driver usb
[    0.551564] omap_i2c 44e0b000.i2c: could not find pctldev for node 
/pinmux@44e10800/pinmux_i2c0_pins, deferring probe
[    0.551625] platform 44e0b000.i2c: Driver omap_i2c requests probe 
deferral
[    0.552926] pps_core: LinuxPPS API ver. 1 registered
[    0.552947] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 
Rodolfo Giometti <giometti@linux.it>
[    0.553443] PTP clock support registered
[    0.559472] omap-mailbox 480c8000.mailbox: omap mailbox rev 0x400
[    0.568564] Switched to clocksource timer1
[    0.801521] NET: Registered protocol family 2
[    0.803666] TCP established hash table entries: 2048 (order: 1, 8192 
bytes)
[    0.803916] TCP bind hash table entries: 2048 (order: 4, 73728 bytes)
[    0.805156] TCP: Hash tables configured (established 2048 bind 2048)
[    0.805406] TCP: reno registered
[    0.805444] UDP hash table entries: 256 (order: 2, 20480 bytes)
[    0.805782] UDP-Lite hash table entries: 256 (order: 2, 20480 bytes)
[    0.807383] NET: Registered protocol family 1
[    0.809407] RPC: Registered named UNIX socket transport module.
[    0.809437] RPC: Registered udp transport module.
[    0.809451] RPC: Registered tcp transport module.
[    0.809466] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.813044] hw perfevents: enabled with ARMv7 Cortex-A8 PMU driver, 5 
counters available
[    0.822788] futex hash table entries: 256 (order: 1, 11264 bytes)
[    1.077907] VFS: Disk quotas dquot_6.5.2
[    1.078025] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    1.080809] NFS: Registering the id_resolver key type
[    1.081398] Key type id_resolver registered
[    1.081424] Key type id_legacy registered
[    1.081587] jffs2: version 2.2. (NAND) (SUMMARY)  �© 2001-2006 Red 
Hat, Inc.
[    1.082186] msgmni has been set to 474
[    1.089550] io scheduler noop registered
[    1.089578] io scheduler deadline registered
[    1.089644] io scheduler cfq registered (default)
[    1.094790] pinctrl-single 44e10800.pinmux: 142 pins at pa f9e10800 
size 568
[    1.106151] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.117315] omap_uart 44e09000.serial: no wakeirq for uart0
[    1.118084] 44e09000.serial: ttyO0 at MMIO 0x44e09000 (irq = 88, 
base_baud = 3000000) is a OMAP UART0
[    1.766593] console [ttyO0] enabled
[    1.776195] omap_rng 48310000.rng: OMAP Random Number Generator ver. 20
[    1.825743] brd: module loaded
[    1.853106] loop: module loaded
[    1.857328] (hci_tty): inside hci_tty_init
[    1.863514] (hci_tty): allocated 249, 0
[    1.877736] mtdoops: mtd device (mtddev=name/number) must be supplied
[    1.899115] usbcore: registered new interface driver asix
[    1.905410] usbcore: registered new interface driver ax88179_178a
[    1.912474] usbcore: registered new interface driver cdc_ether
[    1.919295] usbcore: registered new interface driver smsc95xx
[    1.925894] usbcore: registered new interface driver net1080
[    1.932467] usbcore: registered new interface driver cdc_subset
[    1.939301] usbcore: registered new interface driver zaurus
[    1.945835] usbcore: registered new interface driver cdc_ncm
[    1.953920] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.960854] ehci-omap: OMAP-EHCI Host Controller driver
[    1.967904] usbcore: registered new interface driver cdc_wdm
[    1.974603] usbcore: registered new interface driver usb-storage
[    1.985397] mousedev: PS/2 mouse device common for all mice
[    2.001647] omap_rtc 44e3e000.rtc: rtc core: registered 44e3e000.rtc 
as rtc0
[    2.009270] 44e3e000.rtc: already running
[    2.016029] i2c /dev entries driver
[    2.020324] Driver for 1-wire Dallas network protocol.
[    2.033815] omap_wdt: OMAP Watchdog Timer Rev 0x01: initial timeout 
60 sec
[    2.139389] ledtrig-cpu: registered to indicate activity on CPUs
[    2.146507] omap-aes 53500000.aes: OMAP AES hw accel rev: 3.2
[    2.157638] omap-sham 53100000.sham: hw accel on OMAP rev 4.3
[    2.170523] usbcore: registered new interface driver usbhid
[    2.176447] usbhid: USB HID core driver
[    2.180946] mmc0: host does not support reading read-only switch. 
assuming write-enable.
[    2.191712]  remoteproc0: wkup_m3 is available
[    2.196495]  remoteproc0: Note: remoteproc is still under development 
and considered experimental.
[    2.206262]  remoteproc0: THE BINARY FORMAT IS NOT YET FINALIZED, and 
backward compatibility isn't yet guaranteed.
[    2.218233]  remoteproc0: Direct firmware load failed with error -2
[    2.224889]  remoteproc0: Falling back to user helper
[    2.232565] mmc0: new high speed SD card at address e624
[    2.242149] mmcblk0: mmc0:e624 SU02G 1.84 GiB
[    2.257747] oprofile: using arm/armv7
[    2.261948] nf_conntrack version 0.5.0 (3793 buckets, 15172 max)
[    2.270488] ip_tables: (C) 2000-2006 Netfilter Core Team
[    2.276612] TCP: cubic registered
[    2.280178] Initializing XFRM netlink socket
[    2.284821] NET: Registered protocol family 17
[    2.289619] NET: Registered protocol family 15
[    2.294757] Key type dns_resolver registered
[    2.300764]  mmcblk0: p1 p2
[    2.311477] cpu cpu0: of_pm_voltdm_notifier_register: Failed to get 
cpu0 regulator/voltdm: -517
[    2.320709] cpu cpu0: cpu0 clock notifier not ready, retry
[    2.326514] platform cpufreq-cpu0.0: Driver cpufreq-cpu0 requests 
probe deferral
[    2.336513] ThumbEE CPU extension supported.
[    2.341170] Registering SWP/SWPB emulation handler
[    2.346195] SmartReflex Class3 initialized
[    2.357439] regulator-dummy: disabling
[    2.384036] DCDC1: at 1500 mV
[    2.390264] vdd_mpu: 925 <--> 1375 mV at 950 mV
[    2.397869] vdd_core: 925 <--> 1150 mV at 1100 mV
[    2.405818] LDO1: at 1800 mV
[    2.412522] LDO2: at 3300 mV
[    2.418448] LDO3: 1800 mV
[    2.421539] mmc1: BKOPS_EN bit is not set
[    2.428755] LDO4: at 3300 mV
[    2.434183] mmc1: new high speed MMC card at address 0001
[    2.442998] tps65217 0-0024: TPS65217 ID 0xe version 1.2
[    2.448797] omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 kHz
[    2.456393] mmcblk1: mmc1:0001 MMC02G 1.78 GiB
[    2.461714] mmcblk1boot0: mmc1:0001 MMC02G partition 1 1.00 MiB
[    2.468372] mmcblk1boot1: mmc1:0001 MMC02G partition 2 1.00 MiB
[    2.475900] cpu cpu0: of_pm_voltdm_notifier_register: Fail 
calculating voltage latency[950000<->1260000]:-22
[    2.495900]  mmcblk1: p1 p2
[    2.522932]  mmcblk1boot1: unknown partition table
[    2.532026]  mmcblk1boot0: unknown partition table
[    2.568681] davinci_mdio 4a101000.mdio: davinci mdio revision 1.6
[    2.575050] davinci_mdio 4a101000.mdio: detected phy mask fffffffe
[    2.584451] libphy: 4a101000.mdio: probed
[    2.588751] davinci_mdio 4a101000.mdio: phy[0]: device 
4a101000.mdio:00, driver SMSC LAN8710/LAN8720
[    2.600127] cpsw 4a100000.ethernet: Detected MACID = c8:a0:30:ac:e0:b9
[    2.611864] omap_rtc 44e3e000.rtc: setting system clock to 2014-08-14 
19:55:19 UTC (1408046119)
[    2.621046] sr_init: No PMIC hook to init smartreflex
[    2.627239] sr_init: platform driver register failed for SR
[    2.673192] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data 
mode. Opts: (null)
[    2.681903] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
[    2.692285] devtmpfs: mounted
[    2.696096] Freeing unused kernel memory: 380K (c080a000 - c0869000)
INIT: version 2.88 booting
Error opening /dev/fb0: No such file or directory
Starting udev
[    3.480607] udevd[777]: starting version 182
[    4.381310]  remoteproc0: powering up wkup_m3
[    4.387004]  remoteproc0: Booting fw image am335x-pm-firmware.elf, 
size 149385
[    4.396164] PM: CM3 Firmware Version = 0x187
[    4.401447]  remoteproc0: remote processor wkup_m3 is now up
[    4.566499] EXT4-fs (mmcblk0p2): re-mounted. Opts: data=ordered
[    5.010189] random: nonblocking pool is initialized
Starting Bootlog daemon: bootlogd: cannot allocate pseudo tty: No such 
file or directory
bootlogd.
ALSA: Restoring mixer settings...
/usr/sbin/alsactl: load_state:1729: No soundcards found...
INIT: Entering runlevel: 5
Configuring network interfaces... [    7.168955] net eth0: initializing 
cpsw version 1.12 (0)
[    7.249635] net eth0: phy found : id is : 0x7c0f1
[    7.254723] libphy: PHY 4a101000.mdio:01 not found
[    7.259805] net eth0: phy 4a101000.mdio:01 not found on slave 1
udhcpc (v1.22.1) started
Sending discover...
[   10.329530] libphy: 4a101000.mdio:00 - Link is Up - 100/Full
Sending discover...
Sending select for 10.1.14.205...
Lease of 10.1.14.205 obtained, lease time 86400
/etc/udhcpc.d/50default: Adding DNS 10.1.14.1
done.
Starting system message bus: dbus.
Starting Dropbear SSH server: dropbear.
Starting rpcbind daemon...rpcbind: cannot create socket for udp6
rpcbind: cannot create socket for tcp6
done.
Starting advanced power management daemon: No APM support in kernel
(failed.)
Starting syslogd/klogd: done
  * Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon
    ...done.
Starting Telephony daemon
Starting Linux NFC daemon
[   12.228418] Bluetooth: Core ver 2.18
[   12.233035] NET: Registered protocol family 31
[   12.237684] Bluetooth: HCI device and connection manager initialized
[   12.244791] Bluetooth: HCI socket layer initialized
[   12.249979] Bluetooth: L2CAP socket layer initialized
[   12.255387] Bluetooth: SCO socket layer initialized
Stopping Bootlog daemon: bootlogd.

Poky (Yocto Project Reference Distro) 1.6.1 beaglebone /dev/ttyO0


--------------020208080604050008030204
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2014-08-14 22:20, Maciej Borzecki
      wrote:<br>
    </div>
    <blockquote cite="mid:2948184.BeJYLBqp38@localhost.localdomain"
      type="cite">
      <pre wrap="">On Thursday 14 of August 2014 22:09:01 Carlos Rafael Giani wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On 08/14/2014 10:04 PM, Denys Dmytriyenko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">On Thu, Aug 14, 2014 at 09:53:34PM +0200, Carlos Rafael Giani wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">Hello,

after building a rootfs for the Beaglebone Black, I see the
following files in the deploy folder for the machine:

MLO
u-boot.img
u-boot-spl.bin
zImage

as well as other symlinks with "-beaglebone" attached to their filenames.

What should I copy, the SPL bin, or the .img u-boot binary?
Also, u-boot tries to load a uImage, even though a zImage was built.
There is also no uEnv.txt file.
Do I have to write one to be able to let u-boot load the zImage, or
should it work out-of-the-box?
</pre>
          </blockquote>
          <pre wrap="">
Depends on the rootfs image you are building. Most images that are based
on
core-image-base will take care of deploying necessary pieces into the
rootfs. But core-image-minimal is special and very bare-bone, so extra
manual steps are required.

Regardless of the rootfs image, you'd need MLO and u-boot.img to be
located in the first FAT partition of your SD card or eMMC flash.

Then, if your rootfs does not already have zImage and the necessary DTB
files in the /boot directory, you have to place them there (i.e.
core-image-minimal) and you are ready to boot. All the defaults will work
for out-of-the-box in this case. No uEnv.txt is necessary, unless you
need to do something extra special...
</pre>
        </blockquote>
        <pre wrap="">
Oh, I just built core-image-base .

So I should use the .img and not the SPL .bin? I was wondering if the
SPL bin is a newer binary that will eventually replace the .img one.

But when I use the .img file, it turns out that it tries to load a
uImage, even though a zImage was built. Simply setting the bootfile env
var to "zImage" won't work, because the u-boot script will try to boot
with the incorrect command.
</pre>
      </blockquote>
      <pre wrap="">
Try setting bootfile=zImage in uEnv.txt in the first partition.

</pre>
      <blockquote type="cite">
        <pre wrap="">
I am trying to rule out that something went wrong in my build, that
something is wrong in my setup. If I build core-image-base , the
resulting u-boot.img should automatically load a zImage, not a uImage,
correct?
</pre>
      </blockquote>
      <pre wrap="">
Can you post serial output from uboot?

Your default environment should look similar to what is here:
<a class="moz-txt-link-freetext" href="http://git.denx.de/?p=u-boot.git;a=blob;f=include/configs/am335x_evm.h;h=a48b386477167010c8e0d206423a3bdbe611cf83;hb=524123a70761110c5cf3ccc5f52f6d4da071b959#l78">http://git.denx.de/?p=u-boot.git;a=blob;f=include/configs/am335x_evm.h;h=a48b386477167010c8e0d206423a3bdbe611cf83;hb=524123a70761110c5cf3ccc5f52f6d4da071b959#l78</a>



</pre>
    </blockquote>
    <br>
    I rebuilt the image, with the proper layers, but still I get an
    incorrect u-boot environment. Full u-boot serial output and boot log
    follow below.<br>
    uname -a prints:  Linux beaglebone 3.14.16 #1 Thu Aug 14 18:00:21
    CEST 2014 armv7l GNU/Linux<br>
    (the kernel was built by the linux-ti-staging recipe)<br>
    <br>
    The u-boot problem bootfile is set to uImage, and mmcboot uses bootm
    instead of bootz.<br>
    <br>
    Furthermore, once I correct these two values, it boots, but I see
    this eventually:<br>
    <br>
      Error opening /dev/fb0: No such file or directory<br>
    <br>
    After a bit of investigation, it turned out that omaplfb wasn't
    loading due to missing symbols:<br>
    <br>
      root@beaglebone:~# modprobe omaplfb<br>
      [   83.010309] omaplfb: Unknown symbol register_vsync_cb (err 0)<br>
      [   83.016642] omaplfb: Unknown symbol unregister_vsync_cb (err 0)<br>
    <br>
    Searching for this, I found
    <a class="moz-txt-link-freetext" href="https://groups.google.com/forum/#!topic/beagleboard/dcLtpK7ZsX0">https://groups.google.com/forum/#!topic/beagleboard/dcLtpK7ZsX0</a> .
    According to this, in the kernel log, I should set
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    CONFIG_FB_DA8XX to "y". Is this still correct for linux-ti-staging
    3.14.16 ?<br>
    <br>
    Layer git configuration:<br>
    All layers are in their daisy branches.<br>
    poky: SRCREV 87671f72e7459d5d5ddb37691354fab970c557ee<br>
    meta-ti: SRCREV a817ad5826b1c35084a6abb093b89a3916ecb283<br>
    meta-oe: 9ee63edfd9c6e5c22ce707770955a5796cde2cfc<br>
    meta-qt5: a06222499ab602e7c67c1433dd0b559d51d3d744<br>
    <br>
    <br>
    <br>
    The u-boot serial output:<br>
    <br>
    <br>
    <br>
    U-Boot SPL 2013.04-rc1-14237-g90639fe-dirty (Apr 13 2013 - 13:57:11)<br>
    musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, HB-ISO Rx, HB-ISO Tx,
    SoftConn)<br>
    musb-hdrc: MHDRC RTL version 2.0 <br>
    musb-hdrc: setup fifo_mode 4<br>
    musb-hdrc: 28/31 max ep, 16384/16384 memory<br>
    USB Peripheral mode controller at 47401000 using PIO, IRQ 0<br>
    musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, HB-ISO Rx, HB-ISO Tx,
    SoftConn)<br>
    musb-hdrc: MHDRC RTL version 2.0 <br>
    musb-hdrc: setup fifo_mode 4<br>
    musb-hdrc: 28/31 max ep, 16384/16384 memory<br>
    USB Host mode controller at 47401800 using PIO, IRQ 0<br>
    OMAP SD/MMC: 0<br>
    mmc_send_cmd : timeout: No status update<br>
    reading u-boot.img<br>
    reading u-boot.img<br>
    <br>
    <br>
    U-Boot 2013.04-rc1-14237-g90639fe-dirty (Apr 13 2013 - 13:57:11)<br>
    <br>
    I2C:   ready<br>
    DRAM:  256 MiB<br>
    WARNING: Caches not enabled<br>
    NAND:  No NAND device found!!!<br>
    0 MiB<br>
    MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1<br>
    *** Warning - readenv() failed, using default environment<br>
    <br>
    musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, HB-ISO Rx, HB-ISO Tx,
    SoftConn)<br>
    musb-hdrc: MHDRC RTL version 2.0 <br>
    musb-hdrc: setup fifo_mode 4<br>
    musb-hdrc: 28/31 max ep, 16384/16384 memory<br>
    USB Peripheral mode controller at 47401000 using PIO, IRQ 0<br>
    musb-hdrc: ConfigData=0xde (UTMI-8, dyn FIFOs, HB-ISO Rx, HB-ISO Tx,
    SoftConn)<br>
    musb-hdrc: MHDRC RTL version 2.0 <br>
    musb-hdrc: setup fifo_mode 4<br>
    musb-hdrc: 28/31 max ep, 16384/16384 memory<br>
    USB Host mode controller at 47401800 using PIO, IRQ 0<br>
    Net:   &lt;ethaddr&gt; not set. Validating first E-fuse MAC<br>
    cpsw, usb_ether<br>
    Hit any key to stop autoboot:  0 <br>
    U-Boot# <br>
    U-Boot# <br>
    U-Boot# printenv<br>
    arch=arm<br>
    baudrate=115200<br>
    board=am335x<br>
    board_name=A335BNLT<br>
    board_rev=0A5A<br>
    bootcmd=gpio set 53; i2c mw 0x24 1 0x3e; run findfdt; mmc dev 0; if
    mmc rescan ; then echo micro SD card found;setenv mmcdev 0;else echo
    No micro SD card found, setting mmcdev to 1;setenv mmcdev
    1;fi;setenv bootpart ${mmcdev}:2;mmc dev ${mmcdev}; if mmc rescan;
    then gpi;<br>
    bootdelay=1<br>
    bootdir=/boot<br>
    bootenv=uEnv.txt<br>
    bootfile=uImage<br>
    bootpart=0:2<br>
    console=ttyO0,115200n8<br>
    cpu=armv7<br>
    ethact=cpsw<br>
    ethaddr=c8:a0:30:ac:e0:b9<br>
    fdt_high=0xffffffff<br>
    fdtaddr=0x80F80000<br>
    fdtfile=am335x-boneblack.dtb<br>
    findfdt=if test $board_name = A335BONE; then setenv fdtfile
    am335x-bone.dtb; fi; if test $board_name = A335BNLT; then setenv
    fdtfile am335x-boneblack.dtb; fi; if test $board_name = A33515BB;
    then setenv fdtfile am335x-evm.dtb; fi; if test $board_name =
    A335X_SK; then sei<br>
    importbootenv=echo Importing environment from mmc ...; env import -t
    $loadaddr $filesize<br>
    kloadaddr=0x80007fc0<br>
    loadaddr=0x80200000<br>
    loadbootenv=load mmc ${mmcdev} ${loadaddr} ${bootenv}<br>
    loadfdt=load mmc ${bootpart} ${fdtaddr} ${bootdir}/${fdtfile}<br>
    loadramdisk=load mmc ${mmcdev} ${rdaddr} ramdisk.gz<br>
    loaduimage=load mmc ${bootpart} ${kloadaddr} ${bootdir}/${bootfile}<br>
    mmcargs=setenv bootargs console=${console} ${optargs}
    root=${mmcroot} rootfstype=${mmcrootfstype}<br>
    mmcboot=echo Booting from mmc ...; run mmcargs; bootm ${kloadaddr} -
    ${fdtaddr}<br>
    mmcdev=0<br>
    mmcroot=/dev/mmcblk0p2 ro<br>
    mmcrootfstype=ext4 rootwait<br>
    nandargs=setenv bootargs console=${console} ${optargs}
    root=${nandroot} rootfstype=${nandrootfstype}<br>
    nandboot=echo Booting from nand ...; run nandargs; nand read
    ${loadaddr} ${nandsrcaddr} ${nandimgsize}; bootm ${loadaddr}<br>
    nandimgsize=0x500000<br>
    nandroot=ubi0:rootfs rw ubi.mtd=7,2048<br>
    nandrootfstype=ubifs rootwait=1<br>
    nandsrcaddr=0x280000<br>
    netargs=setenv bootargs console=${console} ${optargs} root=/dev/nfs
    nfsroot=${serverip}:${rootpath},${nfsopts} rw ip=dhcp<br>
    netboot=echo Booting from network ...; setenv autoload no; dhcp;
    tftp ${loadaddr} ${bootfile}; tftp ${fdtaddr} ${fdtfile}; run
    netargs; bootm ${loadaddr} - ${fdtaddr}<br>
    nfsopts=nolock<br>
    ramargs=setenv bootargs console=${console} ${optargs}
    root=${ramroot} rootfstype=${ramrootfstype}<br>
    ramboot=echo Booting from ramdisk ...; run ramargs; bootm
    ${loadaddr} ${rdaddr} ${fdtaddr}<br>
    ramroot=/dev/ram0 rw ramdisk_size=65536 initrd=${rdaddr},64M<br>
    ramrootfstype=ext2<br>
    rdaddr=0x81000000<br>
    rootpath=/export/rootfs<br>
    soc=am33xx<br>
    spiargs=setenv bootargs console=${console} ${optargs}
    root=${spiroot} rootfstype=${spirootfstype}<br>
    spiboot=echo Booting from spi ...; run spiargs; sf probe
    ${spibusno}:0; sf read ${loadaddr} ${spisrcaddr} ${spiimgsize};
    bootm ${loadaddr}<br>
    spibusno=0<br>
    spiimgsize=0x362000<br>
    spiroot=/dev/mtdblock4 rw<br>
    spirootfstype=jffs2<br>
    spisrcaddr=0xe0000<br>
static_ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:${hostname}::off<br>
    stderr=serial<br>
    stdin=serial<br>
    stdout=serial<br>
    usbnet_devaddr=c8:a0:30:ac:e0:b9<br>
    vendor=ti<br>
    ver=U-Boot 2013.04-rc1-14237-g90639fe-dirty (Apr 13 2013 - 13:57:11)<br>
    <br>
    Environment size: 3390/131068 bytes<br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    And the full boot log:<br>
    <br>
    gpio: pin 53 (gpio 53) value is 1<br>
    mmc0 is current device<br>
    micro SD card found<br>
    mmc0 is current device<br>
    gpio: pin 54 (gpio 54) value is 1<br>
    SD/MMC found on device 0<br>
    reading uEnv.txt<br>
    ** Unable to read file uEnv.txt **<br>
    gpio: pin 55 (gpio 55) value is 1<br>
    4518456 bytes read in 782 ms (5.5 MiB/s)<br>
    gpio: pin 56 (gpio 56) value is 1<br>
    29723 bytes read in 42 ms (690.4 KiB/s)<br>
    Booting from mmc ...<br>
    ## Flattened Device Tree blob at 80f80000<br>
       Booting using the fdt blob at 0x80f80000<br>
       Using Device Tree in place at 80f80000, end 80f8a41a<br>
    <br>
    Starting kernel ...<br>
    <br>
    [    0.000000] Booting Linux on physical CPU 0x0<br>
    [    0.000000] Linux version 3.14.16 (carlos@soylentgreen) (gcc
    version 4.8.2 (GCC) ) #1 Thu Aug 14 18:00:21 CEST 2014<br>
    [    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7),
    cr=10c5387d<br>
    [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT
    aliasing instruction cache<br>
    [    0.000000] Machine model: TI AM335x BeagleBone<br>
    [    0.000000] cma: CMA: reserved 24 MiB at 8e000000<br>
    [    0.000000] Memory policy: Data cache writeback<br>
    [    0.000000] CPU: All CPU(s) started in SVC mode.<br>
    [    0.000000] AM335X ES2.0 (sgx neon )<br>
    [    0.000000] Built 1 zonelists in Zone order, mobility grouping
    on.  Total pages: 64512<br>
    [    0.000000] Kernel command line: console=ttyO0,115200n8
    root=/dev/mmcblk0p2 ro rootfstype=ext4 rootwait<br>
    [    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)<br>
    [    0.000000] Dentry cache hash table entries: 32768 (order: 5,
    131072 bytes)<br>
    [    0.000000] Inode-cache hash table entries: 16384 (order: 4,
    65536 bytes)<br>
    [    0.000000] Memory: 218236K/260096K available (5869K kernel code,
    716K rwdata, 2328K rodata, 383K init, 5505K bss, 41860K reserved, 0K
    highmem)<br>
    [    0.000000] Virtual kernel memory layout:<br>
    [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)<br>
    [    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)<br>
    [    0.000000]     vmalloc : 0xd0800000 - 0xff000000   ( 744 MB)<br>
    [    0.000000]     lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)<br>
    [    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)<br>
    [    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)<br>
    [    0.000000]       .text : 0xc0008000 - 0xc0809650   (8198 kB)<br>
    [    0.000000]       .init : 0xc080a000 - 0xc0869efc   ( 384 kB)<br>
    [    0.000000]       .data : 0xc086a000 - 0xc091d3d0   ( 717 kB)<br>
    [    0.000000]        .bss : 0xc091d3d0 - 0xc0e7da88   (5506 kB)<br>
    [    0.000000] NR_IRQS:16 nr_irqs:16 16<br>
    [    0.000000] IRQ: Found an INTC at 0xfa200000 (revision 5.0) with
    128 interrupts<br>
    [    0.000000] Total of 128 interrupts on 1 active controller<br>
    [    0.000000] OMAP clockevent source: timer2 at 24000000 Hz<br>
    [    0.000016] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps
    every 178956969942ns<br>
    [    0.000076] OMAP clocksource: timer1 at 24000000 Hz<br>
    [    0.001114] Console: colour dummy device 80x30<br>
    [    0.001189] Lock dependency validator: Copyright (c) 2006 Red
    Hat, Inc., Ingo Molnar<br>
    [    0.001203] ... MAX_LOCKDEP_SUBCLASSES:  8<br>
    [    0.001215] ... MAX_LOCK_DEPTH:          48<br>
    [    0.001227] ... MAX_LOCKDEP_KEYS:        8191<br>
    [    0.001238] ... CLASSHASH_SIZE:          4096<br>
    [    0.001249] ... MAX_LOCKDEP_ENTRIES:     16384<br>
    [    0.001261] ... MAX_LOCKDEP_CHAINS:      32768<br>
    [    0.001272] ... CHAINHASH_SIZE:          16384<br>
    [    0.001284]  memory used by lock dependency info: 3695 kB<br>
    [    0.001296]  per task-struct memory footprint: 1152 bytes<br>
    [    0.001358] Calibrating delay loop... 545.99 BogoMIPS
    (lpj=2729984)<br>
    [    0.108646] pid_max: default: 32768 minimum: 301<br>
    [    0.108972] Security Framework initialized<br>
    [    0.109090] Mount-cache hash table entries: 1024 (order: 0, 4096
    bytes)<br>
    [    0.109109] Mountpoint-cache hash table entries: 1024 (order: 0,
    4096 bytes)<br>
    [    0.138418] CPU: Testing write buffer coherency: ok<br>
    [    0.140210] Setting up static identity map for 0x80592220 -
    0x80592290<br>
    [    0.146475] devtmpfs: initialized<br>
    [    0.152754] VFP support v0.3: implementor 41 architecture 3 part
    30 variant c rev 3<br>
    [    0.204020] omap_hwmod: tptc0 using broken dt data from edma<br>
    [    0.204555] omap_hwmod: tptc1 using broken dt data from edma<br>
    [    0.205071] omap_hwmod: tptc2 using broken dt data from edma<br>
    [    0.215056] omap_hwmod: debugss: _wait_target_disable failed<br>
    [    0.279267] pinctrl core: initialized pinctrl subsystem<br>
    [    0.285701] regulator-dummy: no parameters<br>
    [    0.290985] NET: Registered protocol family 16<br>
    [    0.299227] DMA: preallocated 256 KiB pool for atomic coherent
    allocations<br>
    [    0.307674] cpuidle: using governor ladder<br>
    [    0.307707] cpuidle: using governor menu<br>
    [    0.327069] platform 49000000.edma: alias fck already exists<br>
    [    0.327120] platform 49000000.edma: alias fck already exists<br>
    [    0.327150] platform 49000000.edma: alias fck already exists<br>
    [    0.333520] OMAP GPIO hardware version 0.1<br>
    [    0.374624] No ATAGs?<br>
    [    0.374655] hw-breakpoint: debug architecture 0x4 unsupported.<br>
    [    0.467736] bio: create slab &lt;bio-0&gt; at 0<br>
    [    0.526701] edma-dma-engine edma-dma-engine.0: TI EDMA DMA engine
    driver<br>
    [    0.529651] vmmcsd_fixed: 3300 mV <br>
    [    0.540958] SCSI subsystem initialized<br>
    [    0.546519] usbcore: registered new interface driver usbfs<br>
    [    0.547164] usbcore: registered new interface driver hub<br>
    [    0.548110] usbcore: registered new device driver usb<br>
    [    0.551564] omap_i2c 44e0b000.i2c: could not find pctldev for
    node /pinmux@44e10800/pinmux_i2c0_pins, deferring probe<br>
    [    0.551625] platform 44e0b000.i2c: Driver omap_i2c requests probe
    deferral<br>
    [    0.552926] pps_core: LinuxPPS API ver. 1 registered<br>
    [    0.552947] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
    Rodolfo Giometti <a class="moz-txt-link-rfc2396E" href="mailto:giometti@linux.it">&lt;giometti@linux.it&gt;</a><br>
    [    0.553443] PTP clock support registered<br>
    [    0.559472] omap-mailbox 480c8000.mailbox: omap mailbox rev 0x400<br>
    [    0.568564] Switched to clocksource timer1<br>
    [    0.801521] NET: Registered protocol family 2<br>
    [    0.803666] TCP established hash table entries: 2048 (order: 1,
    8192 bytes)<br>
    [    0.803916] TCP bind hash table entries: 2048 (order: 4, 73728
    bytes)<br>
    [    0.805156] TCP: Hash tables configured (established 2048 bind
    2048)<br>
    [    0.805406] TCP: reno registered<br>
    [    0.805444] UDP hash table entries: 256 (order: 2, 20480 bytes)<br>
    [    0.805782] UDP-Lite hash table entries: 256 (order: 2, 20480
    bytes)<br>
    [    0.807383] NET: Registered protocol family 1<br>
    [    0.809407] RPC: Registered named UNIX socket transport module.<br>
    [    0.809437] RPC: Registered udp transport module.<br>
    [    0.809451] RPC: Registered tcp transport module.<br>
    [    0.809466] RPC: Registered tcp NFSv4.1 backchannel transport
    module.<br>
    [    0.813044] hw perfevents: enabled with ARMv7 Cortex-A8 PMU
    driver, 5 counters available<br>
    [    0.822788] futex hash table entries: 256 (order: 1, 11264 bytes)<br>
    [    1.077907] VFS: Disk quotas dquot_6.5.2<br>
    [    1.078025] Dquot-cache hash table entries: 1024 (order 0, 4096
    bytes)<br>
    [    1.080809] NFS: Registering the id_resolver key type<br>
    [    1.081398] Key type id_resolver registered<br>
    [    1.081424] Key type id_legacy registered<br>
    [    1.081587] jffs2: version 2.2. (NAND) (SUMMARY)  �© 2001-2006
    Red Hat, Inc.<br>
    [    1.082186] msgmni has been set to 474<br>
    [    1.089550] io scheduler noop registered<br>
    [    1.089578] io scheduler deadline registered<br>
    [    1.089644] io scheduler cfq registered (default)<br>
    [    1.094790] pinctrl-single 44e10800.pinmux: 142 pins at pa
    f9e10800 size 568<br>
    [    1.106151] Serial: 8250/16550 driver, 4 ports, IRQ sharing
    enabled<br>
    [    1.117315] omap_uart 44e09000.serial: no wakeirq for uart0<br>
    [    1.118084] 44e09000.serial: ttyO0 at MMIO 0x44e09000 (irq = 88,
    base_baud = 3000000) is a OMAP UART0<br>
    [    1.766593] console [ttyO0] enabled<br>
    [    1.776195] omap_rng 48310000.rng: OMAP Random Number Generator
    ver. 20<br>
    [    1.825743] brd: module loaded<br>
    [    1.853106] loop: module loaded<br>
    [    1.857328] (hci_tty): inside hci_tty_init<br>
    [    1.863514] (hci_tty): allocated 249, 0<br>
    [    1.877736] mtdoops: mtd device (mtddev=name/number) must be
    supplied<br>
    [    1.899115] usbcore: registered new interface driver asix<br>
    [    1.905410] usbcore: registered new interface driver ax88179_178a<br>
    [    1.912474] usbcore: registered new interface driver cdc_ether<br>
    [    1.919295] usbcore: registered new interface driver smsc95xx<br>
    [    1.925894] usbcore: registered new interface driver net1080<br>
    [    1.932467] usbcore: registered new interface driver cdc_subset<br>
    [    1.939301] usbcore: registered new interface driver zaurus<br>
    [    1.945835] usbcore: registered new interface driver cdc_ncm<br>
    [    1.953920] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI)
    Driver<br>
    [    1.960854] ehci-omap: OMAP-EHCI Host Controller driver<br>
    [    1.967904] usbcore: registered new interface driver cdc_wdm<br>
    [    1.974603] usbcore: registered new interface driver usb-storage<br>
    [    1.985397] mousedev: PS/2 mouse device common for all mice<br>
    [    2.001647] omap_rtc 44e3e000.rtc: rtc core: registered
    44e3e000.rtc as rtc0<br>
    [    2.009270] 44e3e000.rtc: already running<br>
    [    2.016029] i2c /dev entries driver<br>
    [    2.020324] Driver for 1-wire Dallas network protocol.<br>
    [    2.033815] omap_wdt: OMAP Watchdog Timer Rev 0x01: initial
    timeout 60 sec<br>
    [    2.139389] ledtrig-cpu: registered to indicate activity on CPUs<br>
    [    2.146507] omap-aes 53500000.aes: OMAP AES hw accel rev: 3.2<br>
    [    2.157638] omap-sham 53100000.sham: hw accel on OMAP rev 4.3<br>
    [    2.170523] usbcore: registered new interface driver usbhid<br>
    [    2.176447] usbhid: USB HID core driver<br>
    [    2.180946] mmc0: host does not support reading read-only switch.
    assuming write-enable.<br>
    [    2.191712]  remoteproc0: wkup_m3 is available<br>
    [    2.196495]  remoteproc0: Note: remoteproc is still under
    development and considered experimental.<br>
    [    2.206262]  remoteproc0: THE BINARY FORMAT IS NOT YET FINALIZED,
    and backward compatibility isn't yet guaranteed.<br>
    [    2.218233]  remoteproc0: Direct firmware load failed with error
    -2<br>
    [    2.224889]  remoteproc0: Falling back to user helper<br>
    [    2.232565] mmc0: new high speed SD card at address e624<br>
    [    2.242149] mmcblk0: mmc0:e624 SU02G 1.84 GiB <br>
    [    2.257747] oprofile: using arm/armv7<br>
    [    2.261948] nf_conntrack version 0.5.0 (3793 buckets, 15172 max)<br>
    [    2.270488] ip_tables: (C) 2000-2006 Netfilter Core Team<br>
    [    2.276612] TCP: cubic registered<br>
    [    2.280178] Initializing XFRM netlink socket<br>
    [    2.284821] NET: Registered protocol family 17<br>
    [    2.289619] NET: Registered protocol family 15<br>
    [    2.294757] Key type dns_resolver registered<br>
    [    2.300764]  mmcblk0: p1 p2<br>
    [    2.311477] cpu cpu0: of_pm_voltdm_notifier_register: Failed to
    get cpu0 regulator/voltdm: -517<br>
    [    2.320709] cpu cpu0: cpu0 clock notifier not ready, retry<br>
    [    2.326514] platform cpufreq-cpu0.0: Driver cpufreq-cpu0 requests
    probe deferral<br>
    [    2.336513] ThumbEE CPU extension supported.<br>
    [    2.341170] Registering SWP/SWPB emulation handler<br>
    [    2.346195] SmartReflex Class3 initialized<br>
    [    2.357439] regulator-dummy: disabling<br>
    [    2.384036] DCDC1: at 1500 mV <br>
    [    2.390264] vdd_mpu: 925 &lt;--&gt; 1375 mV at 950 mV <br>
    [    2.397869] vdd_core: 925 &lt;--&gt; 1150 mV at 1100 mV <br>
    [    2.405818] LDO1: at 1800 mV <br>
    [    2.412522] LDO2: at 3300 mV <br>
    [    2.418448] LDO3: 1800 mV <br>
    [    2.421539] mmc1: BKOPS_EN bit is not set<br>
    [    2.428755] LDO4: at 3300 mV <br>
    [    2.434183] mmc1: new high speed MMC card at address 0001<br>
    [    2.442998] tps65217 0-0024: TPS65217 ID 0xe version 1.2<br>
    [    2.448797] omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 kHz<br>
    [    2.456393] mmcblk1: mmc1:0001 MMC02G 1.78 GiB <br>
    [    2.461714] mmcblk1boot0: mmc1:0001 MMC02G partition 1 1.00 MiB<br>
    [    2.468372] mmcblk1boot1: mmc1:0001 MMC02G partition 2 1.00 MiB<br>
    [    2.475900] cpu cpu0: of_pm_voltdm_notifier_register: Fail
    calculating voltage latency[950000&lt;-&gt;1260000]:-22<br>
    [    2.495900]  mmcblk1: p1 p2<br>
    [    2.522932]  mmcblk1boot1: unknown partition table<br>
    [    2.532026]  mmcblk1boot0: unknown partition table<br>
    [    2.568681] davinci_mdio 4a101000.mdio: davinci mdio revision 1.6<br>
    [    2.575050] davinci_mdio 4a101000.mdio: detected phy mask
    fffffffe<br>
    [    2.584451] libphy: 4a101000.mdio: probed<br>
    [    2.588751] davinci_mdio 4a101000.mdio: phy[0]: device
    4a101000.mdio:00, driver SMSC LAN8710/LAN8720<br>
    [    2.600127] cpsw 4a100000.ethernet: Detected MACID =
    c8:a0:30:ac:e0:b9<br>
    [    2.611864] omap_rtc 44e3e000.rtc: setting system clock to
    2014-08-14 19:55:19 UTC (1408046119)<br>
    [    2.621046] sr_init: No PMIC hook to init smartreflex<br>
    [    2.627239] sr_init: platform driver register failed for SR<br>
    [    2.673192] EXT4-fs (mmcblk0p2): mounted filesystem with ordered
    data mode. Opts: (null)<br>
    [    2.681903] VFS: Mounted root (ext4 filesystem) readonly on
    device 179:2.<br>
    [    2.692285] devtmpfs: mounted<br>
    [    2.696096] Freeing unused kernel memory: 380K (c080a000 -
    c0869000)<br>
    INIT: version 2.88 booting<br>
    Error opening /dev/fb0: No such file or directory<br>
    Starting udev<br>
    [    3.480607] udevd[777]: starting version 182<br>
    [    4.381310]  remoteproc0: powering up wkup_m3<br>
    [    4.387004]  remoteproc0: Booting fw image
    am335x-pm-firmware.elf, size 149385<br>
    [    4.396164] PM: CM3 Firmware Version = 0x187<br>
    [    4.401447]  remoteproc0: remote processor wkup_m3 is now up<br>
    [    4.566499] EXT4-fs (mmcblk0p2): re-mounted. Opts: data=ordered<br>
    [    5.010189] random: nonblocking pool is initialized<br>
    Starting Bootlog daemon: bootlogd: cannot allocate pseudo tty: No
    such file or directory<br>
    bootlogd.<br>
    ALSA: Restoring mixer settings...<br>
    /usr/sbin/alsactl: load_state:1729: No soundcards found...<br>
    INIT: Entering runlevel: 5<br>
    Configuring network interfaces... [    7.168955] net eth0:
    initializing cpsw version 1.12 (0)<br>
    [    7.249635] net eth0: phy found : id is : 0x7c0f1<br>
    [    7.254723] libphy: PHY 4a101000.mdio:01 not found<br>
    [    7.259805] net eth0: phy 4a101000.mdio:01 not found on slave 1<br>
    udhcpc (v1.22.1) started<br>
    Sending discover...<br>
    [   10.329530] libphy: 4a101000.mdio:00 - Link is Up - 100/Full<br>
    Sending discover...<br>
    Sending select for 10.1.14.205...<br>
    Lease of 10.1.14.205 obtained, lease time 86400<br>
    /etc/udhcpc.d/50default: Adding DNS 10.1.14.1<br>
    done.<br>
    Starting system message bus: dbus.<br>
    Starting Dropbear SSH server: dropbear.<br>
    Starting rpcbind daemon...rpcbind: cannot create socket for udp6<br>
    rpcbind: cannot create socket for tcp6<br>
    done.<br>
    Starting advanced power management daemon: No APM support in kernel<br>
    (failed.)<br>
    Starting syslogd/klogd: done<br>
     * Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon<br>
       ...done.<br>
    Starting Telephony daemon<br>
    Starting Linux NFC daemon<br>
    [   12.228418] Bluetooth: Core ver 2.18<br>
    [   12.233035] NET: Registered protocol family 31<br>
    [   12.237684] Bluetooth: HCI device and connection manager
    initialized<br>
    [   12.244791] Bluetooth: HCI socket layer initialized<br>
    [   12.249979] Bluetooth: L2CAP socket layer initialized<br>
    [   12.255387] Bluetooth: SCO socket layer initialized<br>
    Stopping Bootlog daemon: bootlogd.<br>
    <br>
    Poky (Yocto Project Reference Distro) 1.6.1 beaglebone /dev/ttyO0<br>
    <br>
  </body>
</html>

--------------020208080604050008030204--
