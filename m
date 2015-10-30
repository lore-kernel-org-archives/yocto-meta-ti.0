Return-Path: <b.bimmermann@yahoo.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74EF8E00B76; Fri, 30 Oct 2015 12:30:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.bimmermann[at]yahoo.de)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.82.96.63 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from nm38.bullet.mail.ir2.yahoo.com (nm38.bullet.mail.ir2.yahoo.com
	[212.82.96.63])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE07AE00B5D
	for <meta-ti@yoctoproject.org>; Fri, 30 Oct 2015 12:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1446233428; bh=HDcUMaRCgug2ybL8YiC5DIfdB2IxoPBPiZE0gwKQXH4=;
	h=Date:From:Reply-To:To:Subject:References:From:Subject;
	b=fZQ3XqFa4nUsWCRx+Qx8X4FgojI0m7lZ/Zr9wwKCo0zairf9cNjZRgZYndptcPW90L/rIqYboc2GTj4QmR2puDg1LEEiICeQ+MAwiv9XnEsI1ixEN+SA4N+qR3Ot+H1OB2gkbH4q8E5SpzOcg6MDLhJrjJTiO/1HfRlQilqnswy18TDmFhGeuBNnyXqfJ/qvonKpPjEExgRyBSMJ0URJW2oS+/lSdmrc3MP+yl6wMFJggJd9Df7VQeQBSkBGmdg73rTph55eKHo/QVB+jCTo5fOv2w4cLumVfl7UMLipXbmwaqnblYUpDiy1jZ/0IHzIvkZdviJ7xxDdYDIwyg+WHw==
Received: from [212.82.98.127] by nm38.bullet.mail.ir2.yahoo.com with NNFMP;
	30 Oct 2015 19:30:28 -0000
Received: from [212.82.98.107] by tm20.bullet.mail.ir2.yahoo.com with NNFMP;
	30 Oct 2015 19:30:28 -0000
Received: from [127.0.0.1] by omp1044.mail.ir2.yahoo.com with NNFMP;
	30 Oct 2015 19:30:28 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 215296.19527.bm@omp1044.mail.ir2.yahoo.com
X-YMail-OSG: D1hJG58VM1kUzF2mHsnKF71AVF85w1myVCbvYMJkuZ17UZnu59xsLns3y_40iL8
	ZQLx6T.Vc_ccvF2HM.dIfbIWDpP_ZbOXtZXJ7mlkJY.mYHwDB1ttrZjDg1QzHHlrJvIdiqD6xAiP
	4yYPcPz8VuS8pjZXfiuah7He6GP_YZtjE6aojyXtVx9TFruuc.jNoa0EEEhAUdoWLPVgO9ZQ__bL
	.GR9vhrIv1TgCKN6.mleqrHrYVjNguaTpOp_IkL3uGOXcBppte5VMDXERyyoJ_.H87nnhPeRv9H2
	QR2.v5WZ7CePVd1xyPnElfX1fr7w3ajP2aA6F0TrqSCzo1bydY2XZyd6b2YIMW0RNOAFcIP_6WzG
	3vBD3mUg9kS1P5WGaBSkh_JtozXJki3TajntjvFtOoP4twXkGAjCKTAPWqJe9gEiWzed4cg6.QUB
	a3_3.PZrihAuz21_xDjc7mujQMoL8jpuaerT.WyJEYnwNbQVLtrWkRJ80Ar7ZK7uwZWaSwRAQbwe
	7zB1SARScAYZjb5VjTaculQ_vhLQgQw--
Received: by 217.12.9.9; Fri, 30 Oct 2015 19:30:27 +0000 
Date: Fri, 30 Oct 2015 19:29:44 +0000 (UTC)
From: Benjamin Bimmermann <b.bimmermann@yahoo.de>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Message-ID: <1061405419.8311292.1446233384051.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
References: <1061405419.8311292.1446233384051.JavaMail.yahoo@mail.yahoo.com>
Subject: [BUG] linux-ti-staging-4.1 / libgles-omap3 / omaplfb: Unknown symbol register_vsync_cb (err 0)
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Benjamin Bimmermann <b.bimmermann@yahoo.de>
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Oct 2015 19:30:40 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_8311291_1610758549.1446233384034"

------=_Part_8311291_1610758549.1446233384034
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,
I try to build the linux-ti-staging-4.1 Kernel with Omap3 (EGLFS-Support) f=
or the Beagleboneblack (TI AM335x BeagleBone Black).In the uEnv.txt I start=
 the Board with the am335x-boneblack.dtb File.The Error is :[=C2=A0=C2=A0 2=
1.953922] omaplfb: Unknown symbol register_vsync_cb (err 0)
[=C2=A0=C2=A0 21.959780] omaplfb: Unknown symbol unregister_vsync_cb (err 0=
)
[=C2=A0=C2=A0 22.021091] Unable to handle kernel NULL pointer dereference a=
t virtual address 00000000
[=C2=A0=C2=A0 22.029541] pgd =3D dc880000
[=C2=A0=C2=A0 22.032793] [00000000] *pgd=3D9dcdc831, *pte=3D00000000, *ppte=
=3D00000000

I have googled a lot and have made a linux-ti-staging_4.1.bbappend File whe=
re I added a file://0000-extraConfig.cfg.
The extra 0000-extraConfig.cfg contains :=C2=A0CONFIG_DRM=3Dy
CONFIG_DRM_I2C_NXP_TDA998X=3Dy
CONFIG_DRM_TILCDC=3Dy
CONFIG_FB_DA8XX=3Dy
CONFIG_FB_DA8XX_TDA998X=3DyBut that has changed nothing.
What ist the problem ? Must I fix the OmapFB or is there another problem. I=
 don't know where to start to fix this bug.


Complete LOG:
[=C2=A0=C2=A0=C2=A0 0.000000] Booting Linux on physical CPU 0x0
[=C2=A0=C2=A0=C2=A0 0.000000] Initializing cgroup subsys cpuset
[=C2=A0=C2=A0=C2=A0 0.000000] Initializing cgroup subsys cpu
[=C2=A0=C2=A0=C2=A0 0.000000] Initializing cgroup subsys cpuacct
[=C2=A0=C2=A0=C2=A0 0.000000] Linux version 4.1.10 (benjamin@benjamin-EX58-=
EXTREME) (gcc version 4.9.2 (GCC) ) #2 PREEMPT Thu Oct 29 22:08:54 CET 2015
[=C2=A0=C2=A0=C2=A0 0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (A=
RMv7), cr=3D10c5387d
[=C2=A0=C2=A0=C2=A0 0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT=
 aliasing instruction cache
[=C2=A0=C2=A0=C2=A0 0.000000] Machine model: TI AM335x BeagleBone Black
[=C2=A0=C2=A0=C2=A0 0.000000] cma: Reserved 24 MiB at 0x9e800000
[=C2=A0=C2=A0=C2=A0 0.000000] Memory policy: Data cache writeback
[=C2=A0=C2=A0=C2=A0 0.000000] On node 0 totalpages: 131072
[=C2=A0=C2=A0=C2=A0 0.000000] free_area_init_node: node 0, pgdat c08bbb60, =
node_mem_map de36d000
[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal zone: 1152 pages used for =
memmap
[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal zone: 0 pages reserved
[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal zone: 131072 pages, LIFO b=
atch:31
[=C2=A0=C2=A0=C2=A0 0.000000] CPU: All CPU(s) started in SVC mode.
[=C2=A0=C2=A0=C2=A0 0.000000] AM335X ES2.1 (sgx neon )
[=C2=A0=C2=A0=C2=A0 0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*327=
68
[=C2=A0=C2=A0=C2=A0 0.000000] pcpu-alloc: [0] 0=20
[=C2=A0=C2=A0=C2=A0 0.000000] Built 1 zonelists in Zone order, mobility gro=
uping on.=C2=A0 Total pages: 129920
[=C2=A0=C2=A0=C2=A0 0.000000] Kernel command line: console=3DttyS0,115200n8=
 consoleblank=3D0 root=3D/dev/mmcblk0p2 ro rootfstype=3Dext4 rootwait
[=C2=A0=C2=A0=C2=A0 0.000000] PID hash table entries: 2048 (order: 1, 8192 =
bytes)
[=C2=A0=C2=A0=C2=A0 0.000000] Dentry cache hash table entries: 65536 (order=
: 6, 262144 bytes)
[=C2=A0=C2=A0=C2=A0 0.000000] Inode-cache hash table entries: 32768 (order:=
 5, 131072 bytes)
[=C2=A0=C2=A0=C2=A0 0.000000] Memory: 485280K/524288K available (6267K kern=
el code, 254K rwdata, 2132K rodata, 260K init, 229K bss, 14432K reserved, 2=
4576K cma-reserved, 0K highmem)
[=C2=A0=C2=A0=C2=A0 0.000000] Virtual kernel memory layout:
=C2=A0=C2=A0=C2=A0 vector=C2=A0 : 0xffff0000 - 0xffff1000=C2=A0=C2=A0 (=C2=
=A0=C2=A0 4 kB)
=C2=A0=C2=A0=C2=A0 fixmap=C2=A0 : 0xffc00000 - 0xfff00000=C2=A0=C2=A0 (3072=
 kB)
=C2=A0=C2=A0=C2=A0 vmalloc : 0xe0800000 - 0xff000000=C2=A0=C2=A0 ( 488 MB)
=C2=A0=C2=A0=C2=A0 lowmem=C2=A0 : 0xc0000000 - 0xe0000000=C2=A0=C2=A0 ( 512=
 MB)
=C2=A0=C2=A0=C2=A0 pkmap=C2=A0=C2=A0 : 0xbfe00000 - 0xc0000000=C2=A0=C2=A0 =
(=C2=A0=C2=A0 2 MB)
=C2=A0=C2=A0=C2=A0 modules : 0xbf000000 - 0xbfe00000=C2=A0=C2=A0 (=C2=A0 14=
 MB)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .text : 0xc0008000 - 0xc083c05c=C2=A0=C2=A0 =
(8401 kB)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .init : 0xc083d000 - 0xc087e000=C2=A0=C2=A0 =
( 260 kB)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .data : 0xc087e000 - 0xc08bdba8=C2=A0=C2=A0 =
( 255 kB)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .bss : 0xc08c0000 - 0xc08f97f0=C2=A0=
=C2=A0 ( 230 kB)
[=C2=A0=C2=A0=C2=A0 0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=
=3D0, CPUs=3D1, Nodes=3D1
[=C2=A0=C2=A0=C2=A0 0.000000] Preemptible hierarchical RCU implementation.
[=C2=A0=C2=A0=C2=A0 0.000000] =C2=A0=C2=A0=C2=A0 Additional per-CPU info pr=
inted with stalls.
[=C2=A0=C2=A0=C2=A0 0.000000] NR_IRQS:16 nr_irqs:16 16
[=C2=A0=C2=A0=C2=A0 0.000000] IRQ: Found an INTC at 0xfa200000 (revision 5.=
0) with 128 interrupts
[=C2=A0=C2=A0=C2=A0 0.000000] OMAP clockevent source: timer2 at 24000000 Hz
[=C2=A0=C2=A0=C2=A0 0.000012] sched_clock: 32 bits at 24MHz, resolution 41n=
s, wraps every 89478484971ns
[=C2=A0=C2=A0=C2=A0 0.000030] clocksource timer1: mask: 0xffffffff max_cycl=
es: 0xffffffff, max_idle_ns: 79635851949 ns
[=C2=A0=C2=A0=C2=A0 0.000040] OMAP clocksource: timer1 at 24000000 Hz
[=C2=A0=C2=A0=C2=A0 0.000192] Console: colour dummy device 80x30
[=C2=A0=C2=A0=C2=A0 0.000224] Calibrating delay loop... 996.14 BogoMIPS (lp=
j=3D4980736)
[=C2=A0=C2=A0=C2=A0 0.089358] pid_max: default: 32768 minimum: 301
[=C2=A0=C2=A0=C2=A0 0.089447] Security Framework initialized
[=C2=A0=C2=A0=C2=A0 0.089492] Mount-cache hash table entries: 1024 (order: =
0, 4096 bytes)
[=C2=A0=C2=A0=C2=A0 0.089502] Mountpoint-cache hash table entries: 1024 (or=
der: 0, 4096 bytes)
[=C2=A0=C2=A0=C2=A0 0.090100] Initializing cgroup subsys blkio
[=C2=A0=C2=A0=C2=A0 0.090120] Initializing cgroup subsys memory
[=C2=A0=C2=A0=C2=A0 0.090158] Initializing cgroup subsys devices
[=C2=A0=C2=A0=C2=A0 0.090172] Initializing cgroup subsys freezer
[=C2=A0=C2=A0=C2=A0 0.090184] Initializing cgroup subsys perf_event
[=C2=A0=C2=A0=C2=A0 0.090206] CPU: Testing write buffer coherency: ok
[=C2=A0=C2=A0=C2=A0 0.090556] Setting up static identity map for 0x80008200=
 - 0x80008270
[=C2=A0=C2=A0=C2=A0 0.091878] devtmpfs: initialized
[=C2=A0=C2=A0=C2=A0 0.099969] VFP support v0.3: implementor 41 architecture=
 3 part 30 variant c rev 3
[=C2=A0=C2=A0=C2=A0 0.107299] omap_hwmod: tptc0 using broken dt data from e=
dma
[=C2=A0=C2=A0=C2=A0 0.107399] omap_hwmod: tptc1 using broken dt data from e=
dma
[=C2=A0=C2=A0=C2=A0 0.107480] omap_hwmod: tptc2 using broken dt data from e=
dma
[=C2=A0=C2=A0=C2=A0 0.111737] omap_hwmod: debugss: _wait_target_disable fai=
led
[=C2=A0=C2=A0=C2=A0 0.166099] clocksource jiffies: mask: 0xffffffff max_cyc=
les: 0xffffffff, max_idle_ns: 19112604462750000 ns
[=C2=A0=C2=A0=C2=A0 0.168044] pinctrl core: initialized pinctrl subsystem
[=C2=A0=C2=A0=C2=A0 0.169185] NET: Registered protocol family 16
[=C2=A0=C2=A0=C2=A0 0.171199] DMA: preallocated 256 KiB pool for atomic coh=
erent allocations
[=C2=A0=C2=A0=C2=A0 0.199346] cpuidle: using governor ladder
[=C2=A0=C2=A0=C2=A0 0.229337] cpuidle: using governor menu
[=C2=A0=C2=A0=C2=A0 0.232215] gpiochip_add: registered GPIOs 0 to 31 on dev=
ice: gpio
[=C2=A0=C2=A0=C2=A0 0.232493] OMAP GPIO hardware version 0.1
[=C2=A0=C2=A0=C2=A0 0.233124] gpiochip_add: registered GPIOs 32 to 63 on de=
vice: gpio
[=C2=A0=C2=A0=C2=A0 0.233774] gpiochip_add: registered GPIOs 64 to 95 on de=
vice: gpio
[=C2=A0=C2=A0=C2=A0 0.234394] gpiochip_add: registered GPIOs 96 to 127 on d=
evice: gpio
[=C2=A0=C2=A0=C2=A0 0.240725] No ATAGs?
[=C2=A0=C2=A0=C2=A0 0.240753] hw-breakpoint: debug architecture 0x4 unsuppo=
rted.
[=C2=A0=C2=A0=C2=A0 0.276242] edma-dma-engine edma-dma-engine.0: TI EDMA DM=
A engine driver
[=C2=A0=C2=A0=C2=A0 0.276653] of_get_named_gpiod_flags: can't parse 'gpio' =
property of node '/fixedregulator@0[0]'
[=C2=A0=C2=A0=C2=A0 0.278871] vgaarb: loaded
[=C2=A0=C2=A0=C2=A0 0.279431] SCSI subsystem initialized
[=C2=A0=C2=A0=C2=A0 0.279890] omap_i2c 44e0b000.i2c: could not find pctldev=
 for node /ocp/l4_wkup@44c00000/scm@210000/pinmux@800/pinmux_i2c0_pins, def=
erring probe
[=C2=A0=C2=A0=C2=A0 0.280030] pps_core: LinuxPPS API ver. 1 registered
[=C2=A0=C2=A0=C2=A0 0.280037] pps_core: Software ver. 5.3.6 - Copyright 200=
5-2007 Rodolfo Giometti <giometti@linux.it>
[=C2=A0=C2=A0=C2=A0 0.280067] PTP clock support registered
[=C2=A0=C2=A0=C2=A0 0.280765] omap-mailbox 480c8000.mailbox: omap mailbox r=
ev 0x400
[=C2=A0=C2=A0=C2=A0 0.280972] Advanced Linux Sound Architecture Driver Init=
ialized.
[=C2=A0=C2=A0=C2=A0 0.281694] Switched to clocksource timer1
[=C2=A0=C2=A0=C2=A0 0.290448] NET: Registered protocol family 2
[=C2=A0=C2=A0=C2=A0 0.291176] TCP established hash table entries: 4096 (ord=
er: 2, 16384 bytes)
[=C2=A0=C2=A0=C2=A0 0.291221] TCP bind hash table entries: 4096 (order: 2, =
16384 bytes)
[=C2=A0=C2=A0=C2=A0 0.291259] TCP: Hash tables configured (established 4096=
 bind 4096)
[=C2=A0=C2=A0=C2=A0 0.291337] UDP hash table entries: 256 (order: 0, 4096 b=
ytes)
[=C2=A0=C2=A0=C2=A0 0.291354] UDP-Lite hash table entries: 256 (order: 0, 4=
096 bytes)
[=C2=A0=C2=A0=C2=A0 0.291502] NET: Registered protocol family 1
[=C2=A0=C2=A0=C2=A0 0.291921] RPC: Registered named UNIX socket transport m=
odule.
[=C2=A0=C2=A0=C2=A0 0.291935] RPC: Registered udp transport module.
[=C2=A0=C2=A0=C2=A0 0.291941] RPC: Registered tcp transport module.
[=C2=A0=C2=A0=C2=A0 0.291946] RPC: Registered tcp NFSv4.1 backchannel trans=
port module.
[=C2=A0=C2=A0=C2=A0 0.291970] PCI: CLS 0 bytes, default 64
[=C2=A0=C2=A0=C2=A0 0.292719] CPU PMU: Failed to parse /pmu/interrupt-affin=
ity[0]
[=C2=A0=C2=A0=C2=A0 0.292763] hw perfevents: enabled with armv7_cortex_a8 P=
MU driver, 5 counters available
[=C2=A0=C2=A0=C2=A0 0.294391] futex hash table entries: 256 (order: -1, 307=
2 bytes)
[=C2=A0=C2=A0=C2=A0 0.294473] audit: initializing netlink subsys (disabled)
[=C2=A0=C2=A0=C2=A0 0.294534] audit: type=3D2000 audit(0.280:1): initialize=
d
[=C2=A0=C2=A0=C2=A0 0.300774] VFS: Disk quotas dquot_6.6.0
[=C2=A0=C2=A0=C2=A0 0.300957] VFS: Dquot-cache hash table entries: 1024 (or=
der 0, 4096 bytes)
[=C2=A0=C2=A0=C2=A0 0.302976] NFS: Registering the id_resolver key type
[=C2=A0=C2=A0=C2=A0 0.303043] Key type id_resolver registered
[=C2=A0=C2=A0=C2=A0 0.303050] Key type id_legacy registered
[=C2=A0=C2=A0=C2=A0 0.303115] jffs2: version 2.2. (NAND) (SUMMARY)=C2=A0 \x=
ffffffc2\xffffffa9 2001-2006 Red Hat, Inc.
[=C2=A0=C2=A0=C2=A0 0.305300] NET: Registered protocol family 38
[=C2=A0=C2=A0=C2=A0 0.305369] io scheduler noop registered
[=C2=A0=C2=A0=C2=A0 0.305382] io scheduler deadline registered
[=C2=A0=C2=A0=C2=A0 0.305436] io scheduler cfq registered (default)
[=C2=A0=C2=A0=C2=A0 0.306334] pinctrl-single 44e10800.pinmux: 142 pins at p=
a f9e10800 size 568
[=C2=A0=C2=A0=C2=A0 0.307963] wkup_m3_ipc 44e11324.wkup_m3_ipc: could not g=
et rproc handle
[=C2=A0=C2=A0=C2=A0 0.308888] Serial: 8250/16550 driver, 10 ports, IRQ shar=
ing enabled
[=C2=A0=C2=A0=C2=A0 0.311449] omap8250 44e09000.serial: GPIO lookup for con=
sumer enable
[=C2=A0=C2=A0=C2=A0 0.311466] omap8250 44e09000.serial: using device tree f=
or GPIO lookup
[=C2=A0=C2=A0=C2=A0 0.311481] of_get_named_gpiod_flags: can't parse 'enable=
-gpios' property of node '/ocp/serial@44e09000[0]'
[=C2=A0=C2=A0=C2=A0 0.311489] of_get_named_gpiod_flags: can't parse 'enable=
-gpio' property of node '/ocp/serial@44e09000[0]'
[=C2=A0=C2=A0=C2=A0 0.311497] omap8250 44e09000.serial: using lookup tables=
 for GPIO lookup
[=C2=A0=C2=A0=C2=A0 0.311507] omap8250 44e09000.serial: lookup for GPIO ena=
ble failed
[=C2=A0=C2=A0=C2=A0 0.312021] console [ttyS0] disabled
[=C2=A0=C2=A0=C2=A0 0.312097] 44e09000.serial: ttyS0 at MMIO 0x44e09000 (ir=
q =3D 155, base_baud =3D 3000000) is a 8250
[=C2=A0=C2=A0=C2=A0 0.932202] console [ttyS0] enabled
[=C2=A0=C2=A0=C2=A0 0.936567] [drm] Initialized drm 1.1.0 20060810
[=C2=A0=C2=A0=C2=A0 0.941508] slave hdmi: could not get i2c
[=C2=A0=C2=A0=C2=A0 0.954626] brd: module loaded
[=C2=A0=C2=A0=C2=A0 0.962095] loop: module loaded
[=C2=A0=C2=A0=C2=A0 0.966072] mtdoops: mtd device (mtddev=3Dname/number) mu=
st be supplied
[=C2=A0=C2=A0=C2=A0 0.974361] mousedev: PS/2 mouse device common for all mi=
ce
[=C2=A0=C2=A0=C2=A0 0.979975] i2c /dev entries driver
[=C2=A0=C2=A0=C2=A0 0.984295] omap_hsmmc 48060000.mmc: GPIO lookup for cons=
umer cd
[=C2=A0=C2=A0=C2=A0 0.984311] omap_hsmmc 48060000.mmc: using device tree fo=
r GPIO lookup
[=C2=A0=C2=A0=C2=A0 0.984337] of_get_named_gpiod_flags: parsed 'cd-gpios' p=
roperty of node '/ocp/mmc@48060000[0]' - status (0)
[=C2=A0=C2=A0=C2=A0 0.984415] omap_hsmmc 48060000.mmc: Got CD GPIO
[=C2=A0=C2=A0=C2=A0 0.989058] omap_hsmmc 48060000.mmc: GPIO lookup for cons=
umer wp
[=C2=A0=C2=A0=C2=A0 0.989066] omap_hsmmc 48060000.mmc: using device tree fo=
r GPIO lookup
[=C2=A0=C2=A0=C2=A0 0.989075] of_get_named_gpiod_flags: can't parse 'wp-gpi=
os' property of node '/ocp/mmc@48060000[0]'
[=C2=A0=C2=A0=C2=A0 0.989084] of_get_named_gpiod_flags: can't parse 'wp-gpi=
o' property of node '/ocp/mmc@48060000[0]'
[=C2=A0=C2=A0=C2=A0 0.989092] omap_hsmmc 48060000.mmc: using lookup tables =
for GPIO lookup
[=C2=A0=C2=A0=C2=A0 0.989101] omap_hsmmc 48060000.mmc: lookup for GPIO wp f=
ailed
[=C2=A0=C2=A0=C2=A0 1.022282] omap_hsmmc 481d8000.mmc: GPIO lookup for cons=
umer cd
[=C2=A0=C2=A0=C2=A0 1.022302] omap_hsmmc 481d8000.mmc: using device tree fo=
r GPIO lookup
[=C2=A0=C2=A0=C2=A0 1.022314] of_get_named_gpiod_flags: can't parse 'cd-gpi=
os' property of node '/ocp/mmc@481d8000[0]'
[=C2=A0=C2=A0=C2=A0 1.022323] of_get_named_gpiod_flags: can't parse 'cd-gpi=
o' property of node '/ocp/mmc@481d8000[0]'
[=C2=A0=C2=A0=C2=A0 1.022331] omap_hsmmc 481d8000.mmc: using lookup tables =
for GPIO lookup
[=C2=A0=C2=A0=C2=A0 1.022340] omap_hsmmc 481d8000.mmc: lookup for GPIO cd f=
ailed
[=C2=A0=C2=A0=C2=A0 1.022350] omap_hsmmc 481d8000.mmc: GPIO lookup for cons=
umer wp
[=C2=A0=C2=A0=C2=A0 1.022357] omap_hsmmc 481d8000.mmc: using device tree fo=
r GPIO lookup
[=C2=A0=C2=A0=C2=A0 1.022365] of_get_named_gpiod_flags: can't parse 'wp-gpi=
os' property of node '/ocp/mmc@481d8000[0]'
[=C2=A0=C2=A0=C2=A0 1.022373] of_get_named_gpiod_flags: can't parse 'wp-gpi=
o' property of node '/ocp/mmc@481d8000[0]'
[=C2=A0=C2=A0=C2=A0 1.022380] omap_hsmmc 481d8000.mmc: using lookup tables =
for GPIO lookup
[=C2=A0=C2=A0=C2=A0 1.022387] omap_hsmmc 481d8000.mmc: lookup for GPIO wp f=
ailed
[=C2=A0=C2=A0=C2=A0 1.061963] ledtrig-cpu: registered to indicate activity =
on CPUs
[=C2=A0=C2=A0=C2=A0 1.068288] omap-aes 53500000.aes: OMAP AES hw accel rev:=
 3.2
[=C2=A0=C2=A0=C2=A0 1.075376] omap-sham 53100000.sham: hw accel on OMAP rev=
 4.3
[=C2=A0=C2=A0=C2=A0 1.082544]=C2=A0 remoteproc0: wkup_m3 is available
[=C2=A0=C2=A0=C2=A0 1.087018]=C2=A0 remoteproc0: Note: remoteproc is still =
under development and considered experimental.
[=C2=A0=C2=A0=C2=A0 1.096172]=C2=A0 remoteproc0: THE BINARY FORMAT IS NOT Y=
ET FINALIZED, and backward compatibility isn't yet guaranteed.
[=C2=A0=C2=A0=C2=A0 1.106858]=C2=A0 remoteproc0: Direct firmware load for a=
m335x-pm-firmware.elf failed with error -2
[=C2=A0=C2=A0=C2=A0 1.118002] oprofile: using arm/armv7
[=C2=A0=C2=A0=C2=A0 1.121893]=C2=A0 remoteproc0: Falling back to user helpe=
r
[=C2=A0=C2=A0=C2=A0 1.127397] Initializing XFRM netlink socket
[=C2=A0=C2=A0=C2=A0 1.131859] NET: Registered protocol family 17
[=C2=A0=C2=A0=C2=A0 1.136349] mmc0: host does not support reading read-only=
 switch, assuming write-enable
[=C2=A0=C2=A0=C2=A0 1.144599] NET: Registered protocol family 15
[=C2=A0=C2=A0=C2=A0 1.149171] Key type dns_resolver registered
[=C2=A0=C2=A0=C2=A0 1.153709] omap_voltage_late_init: Voltage driver suppor=
t not added
[=C2=A0=C2=A0=C2=A0 1.160198] mmc0: new high speed SDHC card at address aaa=
a
[=C2=A0=C2=A0=C2=A0 1.166250] ThumbEE CPU extension supported.
[=C2=A0=C2=A0=C2=A0 1.170559] Registering SWP/SWPB emulation handler
[=C2=A0=C2=A0=C2=A0 1.175905] mmcblk0: mmc0:aaaa SU08G 7.40 GiB=20
[=C2=A0=C2=A0=C2=A0 1.182296]=C2=A0 mmcblk0: p1 p2
[=C2=A0=C2=A0=C2=A0 1.208663] tps65217 0-0024: TPS65217 ID 0xe version 1.2
[=C2=A0=C2=A0=C2=A0 1.214135] omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 k=
Hz
[=C2=A0=C2=A0=C2=A0 1.233327] mmc1: MAN_BKOPS_EN bit is not set
[=C2=A0=C2=A0=C2=A0 1.242067] mmc1: new high speed MMC card at address 0001
[=C2=A0=C2=A0=C2=A0 1.247954] mmcblk1: mmc1:0001 MMC04G 3.60 GiB=20
[=C2=A0=C2=A0=C2=A0 1.252734] mmcblk1boot0: mmc1:0001 MMC04G partition 1 2.=
00 MiB
[=C2=A0=C2=A0=C2=A0 1.258786] mmcblk1boot1: mmc1:0001 MMC04G partition 2 2.=
00 MiB
[=C2=A0=C2=A0=C2=A0 1.265751]=C2=A0 mmcblk1: p1
[=C2=A0=C2=A0=C2=A0 1.344041] tda998x 0-0070: found TDA19988
[=C2=A0=C2=A0=C2=A0 1.349110] [drm] Supports vblank timestamp caching Rev 2=
 (21.10.2013).
[=C2=A0=C2=A0=C2=A0 1.355785] [drm] No driver support for vblank timestamp =
query.
[=C2=A0=C2=A0=C2=A0 1.490624] Console: switching to colour frame buffer dev=
ice 160x64
[=C2=A0=C2=A0=C2=A0 1.504953] tilcdc 4830e000.lcdc: fb0:=C2=A0 frame buffer=
 device
[=C2=A0=C2=A0=C2=A0 1.510549] tilcdc 4830e000.lcdc: registered panic notifi=
er
[=C2=A0=C2=A0=C2=A0 1.541726] [drm] Initialized tilcdc 1.0.0 20121205 on mi=
nor 0
[=C2=A0=C2=A0=C2=A0 1.611719] davinci_mdio 4a101000.mdio: davinci mdio revi=
sion 1.6
[=C2=A0=C2=A0=C2=A0 1.617859] davinci_mdio 4a101000.mdio: detected phy mask=
 fffffffe
[=C2=A0=C2=A0=C2=A0 1.624887] libphy: 4a101000.mdio: probed
[=C2=A0=C2=A0=C2=A0 1.628927] davinci_mdio 4a101000.mdio: phy[0]: device 4a=
101000.mdio:00, driver SMSC LAN8710/LAN8720
[=C2=A0=C2=A0=C2=A0 1.638853] cpsw 4a100000.ethernet: Detected MACID =3D 78=
:a5:04:f8:7d:81
[=C2=A0=C2=A0=C2=A0 1.646447] hctosys: unable to open rtc device (rtc0)
[=C2=A0=C2=A0=C2=A0 1.654954] ALSA device list:
[=C2=A0=C2=A0=C2=A0 1.657953]=C2=A0=C2=A0 No soundcards found.
[=C2=A0=C2=A0=C2=A0 1.680347] EXT4-fs (mmcblk0p2): mounted filesystem with =
ordered data mode. Opts: (null)
[=C2=A0=C2=A0=C2=A0 1.688662] VFS: Mounted root (ext4 filesystem) readonly =
on device 179:2.
[=C2=A0=C2=A0=C2=A0 1.701789] devtmpfs: mounted
[=C2=A0=C2=A0=C2=A0 1.705090] Freeing unused kernel memory: 260K (c083d000 =
- c087e000)
[=C2=A0=C2=A0=C2=A0 2.376604] udevd[95]: starting version 182
[=C2=A0=C2=A0=C2=A0 2.576210] of_get_named_gpiod_flags: parsed 'gpios' prop=
erty of node '/leds/led@2[0]' - status (0)
[=C2=A0=C2=A0=C2=A0 2.576511] of_get_named_gpiod_flags: parsed 'gpios' prop=
erty of node '/leds/led@3[0]' - status (0)
[=C2=A0=C2=A0=C2=A0 2.576658] of_get_named_gpiod_flags: parsed 'gpios' prop=
erty of node '/leds/led@4[0]' - status (0)
[=C2=A0=C2=A0=C2=A0 2.576785] of_get_named_gpiod_flags: parsed 'gpios' prop=
erty of node '/leds/led@5[0]' - status (0)
[=C2=A0=C2=A0=C2=A0 2.586208] cpu cpu0: of_pm_voltdm_notifier_register: Fai=
l calculating voltage latency[950000<->1325000]:-22
[=C2=A0=C2=A0=C2=A0 2.620459] omap_wdt: OMAP Watchdog Timer Rev 0x01: initi=
al timeout 60 sec
[=C2=A0=C2=A0=C2=A0 2.656116] omap_rtc 44e3e000.rtc: rtc core: registered 4=
4e3e000.rtc as rtc0
[=C2=A0=C2=A0=C2=A0 2.664866] cpu cpu0: of_pm_voltdm_notifier_register: Fai=
l calculating voltage latency[950000<->1325000]:-22
[=C2=A0=C2=A0=C2=A0 2.692566] am335x-phy-driver 47401300.usb-phy: GPIO look=
up for consumer reset
[=C2=A0=C2=A0=C2=A0 2.692592] am335x-phy-driver 47401300.usb-phy: using dev=
ice tree for GPIO lookup
[=C2=A0=C2=A0=C2=A0 2.692607] of_get_named_gpiod_flags: can't parse 'reset-=
gpios' property of node '/ocp/usb@47400000/usb-phy@47401300[0]'
[=C2=A0=C2=A0=C2=A0 2.692616] of_get_named_gpiod_flags: can't parse 'reset-=
gpio' property of node '/ocp/usb@47400000/usb-phy@47401300[0]'
[=C2=A0=C2=A0=C2=A0 2.692625] am335x-phy-driver 47401300.usb-phy: using loo=
kup tables for GPIO lookup
[=C2=A0=C2=A0=C2=A0 2.692635] am335x-phy-driver 47401300.usb-phy: lookup fo=
r GPIO reset failed
[=C2=A0=C2=A0=C2=A0 2.692643] am335x-phy-driver 47401300.usb-phy: GPIO look=
up for consumer vbus-detect
[=C2=A0=C2=A0=C2=A0 2.692651] am335x-phy-driver 47401300.usb-phy: using dev=
ice tree for GPIO lookup
[=C2=A0=C2=A0=C2=A0 2.692659] of_get_named_gpiod_flags: can't parse 'vbus-d=
etect-gpios' property of node '/ocp/usb@47400000/usb-phy@47401300[0]'
[=C2=A0=C2=A0=C2=A0 2.692668] of_get_named_gpiod_flags: can't parse 'vbus-d=
etect-gpio' property of node '/ocp/usb@47400000/usb-phy@47401300[0]'
[=C2=A0=C2=A0=C2=A0 2.692675] am335x-phy-driver 47401300.usb-phy: using loo=
kup tables for GPIO lookup
[=C2=A0=C2=A0=C2=A0 2.692683] am335x-phy-driver 47401300.usb-phy: lookup fo=
r GPIO vbus-detect failed
[=C2=A0=C2=A0=C2=A0 2.692741] 47401300.usb-phy supply vcc not found, using =
dummy regulator
[=C2=A0=C2=A0=C2=A0 2.734893] am335x-phy-driver 47401b00.usb-phy: GPIO look=
up for consumer reset
[=C2=A0=C2=A0=C2=A0 2.734918] am335x-phy-driver 47401b00.usb-phy: using dev=
ice tree for GPIO lookup
[=C2=A0=C2=A0=C2=A0 2.734933] of_get_named_gpiod_flags: can't parse 'reset-=
gpios' property of node '/ocp/usb@47400000/usb-phy@47401b00[0]'
[=C2=A0=C2=A0=C2=A0 2.734943] of_get_named_gpiod_flags: can't parse 'reset-=
gpio' property of node '/ocp/usb@47400000/usb-phy@47401b00[0]'
[=C2=A0=C2=A0=C2=A0 2.734952] am335x-phy-driver 47401b00.usb-phy: using loo=
kup tables for GPIO lookup
[=C2=A0=C2=A0=C2=A0 2.734961] am335x-phy-driver 47401b00.usb-phy: lookup fo=
r GPIO reset failed
[=C2=A0=C2=A0=C2=A0 2.734970] am335x-phy-driver 47401b00.usb-phy: GPIO look=
up for consumer vbus-detect
[=C2=A0=C2=A0=C2=A0 2.734978] am335x-phy-driver 47401b00.usb-phy: using dev=
ice tree for GPIO lookup
[=C2=A0=C2=A0=C2=A0 2.734986] of_get_named_gpiod_flags: can't parse 'vbus-d=
etect-gpios' property of node '/ocp/usb@47400000/usb-phy@47401b00[0]'
[=C2=A0=C2=A0=C2=A0 2.734995] of_get_named_gpiod_flags: can't parse 'vbus-d=
etect-gpio' property of node '/ocp/usb@47400000/usb-phy@47401b00[0]'
[=C2=A0=C2=A0=C2=A0 2.735002] am335x-phy-driver 47401b00.usb-phy: using loo=
kup tables for GPIO lookup
[=C2=A0=C2=A0=C2=A0 2.735010] am335x-phy-driver 47401b00.usb-phy: lookup fo=
r GPIO vbus-detect failed
[=C2=A0=C2=A0=C2=A0 2.735067] 47401b00.usb-phy supply vcc not found, using =
dummy regulator
[=C2=A0=C2=A0=C2=A0 2.829266] omap_rng 48310000.rng: OMAP Random Number Gen=
erator ver. 20
[=C2=A0=C2=A0=C2=A0 3.028142]=C2=A0 remoteproc0: powering up wkup_m3
[=C2=A0=C2=A0=C2=A0 3.035541] PM: bootloader does not support rtc-only!
[=C2=A0=C2=A0=C2=A0 3.045982]=C2=A0 remoteproc0: Booting fw image am335x-pm=
-firmware.elf, size 154079
[=C2=A0=C2=A0=C2=A0 3.082122]=C2=A0 remoteproc0: remote processor wkup_m3 i=
s now up
[=C2=A0=C2=A0=C2=A0 3.082143] wkup_m3_ipc 44e11324.wkup_m3_ipc: CM3 Firmwar=
e Version =3D 0x191
[=C2=A0=C2=A0=C2=A0 3.097258] of_get_named_gpiod_flags: parsed 'enable-gpio=
s' property of node '/clk_mcasp0[0]' - status (0)
[=C2=A0=C2=A0=C2=A0 3.103448] davinci_evm sound: hdmi-hifi <-> 48038000.mca=
sp mapping ok
[=C2=A0=C2=A0=C2=A0 3.438768] usbcore: registered new interface driver usbf=
s
[=C2=A0=C2=A0=C2=A0 3.472883] usbcore: registered new interface driver hub
[=C2=A0=C2=A0=C2=A0 3.492997] usbcore: registered new device driver usb
[=C2=A0=C2=A0=C2=A0 3.520394] musb-hdrc: ConfigData=3D0xde (UTMI-8, dyn FIF=
Os, bulk combine, bulk split, HB-ISO Rx, HB-ISO Tx, SoftConn)
[=C2=A0=C2=A0=C2=A0 3.520419] musb-hdrc: MHDRC RTL version 2.0=20
[=C2=A0=C2=A0=C2=A0 3.520427] musb-hdrc: setup fifo_mode 4
[=C2=A0=C2=A0=C2=A0 3.520445] musb-hdrc: 28/31 max ep, 16384/16384 memory
[=C2=A0=C2=A0=C2=A0 3.547711] musb-hdrc: ConfigData=3D0xde (UTMI-8, dyn FIF=
Os, bulk combine, bulk split, HB-ISO Rx, HB-ISO Tx, SoftConn)
[=C2=A0=C2=A0=C2=A0 3.547735] musb-hdrc: MHDRC RTL version 2.0=20
[=C2=A0=C2=A0=C2=A0 3.547743] musb-hdrc: setup fifo_mode 4
[=C2=A0=C2=A0=C2=A0 3.547757] musb-hdrc: 28/31 max ep, 16384/16384 memory
[=C2=A0=C2=A0=C2=A0 3.547883] musb-hdrc musb-hdrc.1.auto: MUSB HDRC host dr=
iver
[=C2=A0=C2=A0=C2=A0 3.557884] musb-hdrc musb-hdrc.1.auto: new USB bus regis=
tered, assigned bus number 1
[=C2=A0=C2=A0=C2=A0 3.567343] usb usb1: New USB device found, idVendor=3D1d=
6b, idProduct=3D0002
[=C2=A0=C2=A0=C2=A0 3.575433] usb usb1: New USB device strings: Mfr=3D3, Pr=
oduct=3D2, SerialNumber=3D1
[=C2=A0=C2=A0=C2=A0 3.583585] usb usb1: Product: MUSB HDRC host driver
[=C2=A0=C2=A0=C2=A0 3.588575] usb usb1: Manufacturer: Linux 4.1.10 musb-hcd
[=C2=A0=C2=A0=C2=A0 3.594450] usb usb1: SerialNumber: musb-hdrc.1.auto
[=C2=A0=C2=A0=C2=A0 3.601379] hub 1-0:1.0: USB hub found
[=C2=A0=C2=A0=C2=A0 3.606026] hub 1-0:1.0: 1 port detected
[=C2=A0=C2=A0=C2=A0 3.722771] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
[=C2=A0=C2=A0=C2=A0 3.864028] random: dd urandom read with 57 bits of entro=
py available
[=C2=A0=C2=A0=C2=A0 4.031876] usb 1-1: new full-speed USB device number 2 u=
sing musb-hdrc
[=C2=A0=C2=A0=C2=A0 4.194262] usb 1-1: New USB device found, idVendor=3D046=
d, idProduct=3Dc52b
[=C2=A0=C2=A0=C2=A0 4.201020] usb 1-1: New USB device strings: Mfr=3D1, Pro=
duct=3D2, SerialNumber=3D0
[=C2=A0=C2=A0=C2=A0 4.241938] usb 1-1: Product: USB Receiver
[=C2=A0=C2=A0=C2=A0 4.246081] usb 1-1: Manufacturer: Logitech
[=C2=A0=C2=A0=C2=A0 8.274727] usbcore: registered new interface driver usbh=
id
[=C2=A0=C2=A0=C2=A0 8.280381] usbhid: USB HID core driver
[=C2=A0=C2=A0=C2=A0 8.311024] usbcore: registered new interface driver usbk=
bd
[=C2=A0=C2=A0=C2=A0 8.326484] usbcore: registered new interface driver usbm=
ouse
[=C2=A0=C2=A0=C2=A0 8.338026] input: Logitech USB Receiver as /devices/plat=
form/ocp/47400000.usb/47401c00.usb/musb-hdrc.1.auto/usb1/1-1/1-1:1.0/0003:0=
46D:C52B.0001/input/input0
[=C2=A0=C2=A0=C2=A0 8.462483] hid-generic 0003:046D:C52B.0001: input: USB H=
ID v1.11 Keyboard [Logitech USB Receiver] on usb-musb-hdrc.1.auto-1/input0
[=C2=A0=C2=A0=C2=A0 8.510248] input: Logitech USB Receiver as /devices/plat=
form/ocp/47400000.usb/47401c00.usb/musb-hdrc.1.auto/usb1/1-1/1-1:1.1/0003:0=
46D:C52B.0002/input/input1
[=C2=A0=C2=A0=C2=A0 8.584867] hid-generic 0003:046D:C52B.0002: input,hiddev=
0: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-musb-hdrc.1.auto-1/in=
put1
[=C2=A0=C2=A0=C2=A0 8.627403] hid-generic 0003:046D:C52B.0003: hiddev0: USB=
 HID v1.11 Device [Logitech USB Receiver] on usb-musb-hdrc.1.auto-1/input2
[=C2=A0=C2=A0=C2=A0 9.033530] net eth0: initializing cpsw version 1.12 (0)
[=C2=A0=C2=A0=C2=A0 9.041396] net eth0: phy found : id is : 0x7c0f1
[=C2=A0=C2=A0=C2=A0 9.046432] libphy: PHY 4a101000.mdio:01 not found
[=C2=A0=C2=A0=C2=A0 9.051266] net eth0: phy 4a101000.mdio:01 not found on s=
lave 1
[=C2=A0=C2=A0 12.112518] cpsw 4a100000.ethernet eth0: Link is Up - 100Mbps/=
Full - flow control rx/tx
[=C2=A0=C2=A0 20.533042] NET: Registered protocol family 10
[=C2=A0=C2=A0 21.268486] Bluetooth: Core ver 2.20
[=C2=A0=C2=A0 21.281020] NET: Registered protocol family 31
[=C2=A0=C2=A0 21.291884] Bluetooth: HCI device and connection manager initi=
alized
[=C2=A0=C2=A0 21.298342] Bluetooth: HCI socket layer initialized
[=C2=A0=C2=A0 21.328927] Bluetooth: L2CAP socket layer initialized
[=C2=A0=C2=A0 21.338179] Bluetooth: SCO socket layer initialized
[=C2=A0=C2=A0 21.387517] random: nonblocking pool is initialized
[=C2=A0=C2=A0 21.953922] omaplfb: Unknown symbol register_vsync_cb (err 0)
[=C2=A0=C2=A0 21.959780] omaplfb: Unknown symbol unregister_vsync_cb (err 0=
)
[=C2=A0=C2=A0 22.021091] Unable to handle kernel NULL pointer dereference a=
t virtual address 00000000
[=C2=A0=C2=A0 22.029541] pgd =3D dc880000
[=C2=A0=C2=A0 22.032793] [00000000] *pgd=3D9dcdc831, *pte=3D00000000, *ppte=
=3D00000000
[=C2=A0=C2=A0 22.039134] Internal error: Oops: 17 [#1] PREEMPT ARM
[=C2=A0=C2=A0 22.044212] Modules linked in: bufferclass_ti(O+) pvrsrvkm(O) =
bluetooth ipv6 joydev evdev usbmouse hid_generic usbkbd usbhid musb_dsps mu=
sb_hdrc udc_core usbcore snd_soc_evm pm33xx omap_rng rng_core musb_am335x r=
tc_omap omap_wdt cpufreq_voltdm leds_gpio snd_soc_hdmi_codec thermal_sys hw=
mon
[=C2=A0=C2=A0 22.070177] CPU: 0 PID: 596 Comm: modprobe Tainted: G=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0 4.1=
.10 #2
[=C2=A0=C2=A0 22.077432] Hardware name: Generic AM33XX (Flattened Device Tr=
ee)
[=C2=A0=C2=A0 22.083555] task: ddc5fa80 ti: dc804000 task.ti: dc804000
[=C2=A0=C2=A0 22.089128] PC is at AllocateDeviceID+0xc/0x50 [pvrsrvkm]
[=C2=A0=C2=A0 22.094592] LR is at PVRSRVRegisterBCDeviceKM+0x108/0x18c [pvr=
srvkm]
[=C2=A0=C2=A0 22.100978] pc : [<bf1fecfc>]=C2=A0=C2=A0=C2=A0 lr : [<bf1fa9d=
4>]=C2=A0=C2=A0=C2=A0 psr: 400f0013
sp : dc805d78=C2=A0 ip : dc805d88=C2=A0 fp : dc805d84
[=C2=A0=C2=A0 22.112508] r10: bf239168=C2=A0 r9 : bf1fbfb8=C2=A0 r8 : c08d8=
974
[=C2=A0=C2=A0 22.117757] r7 : 00000000=C2=A0 r6 : ddc4b904=C2=A0 r5 : 00000=
000=C2=A0 r4 : ddc4b920
[=C2=A0=C2=A0 22.124313] r3 : 00000002=C2=A0 r2 : 00000009=C2=A0 r1 : ddf76=
c08=C2=A0 r0 : 00000000
[=C2=A0=C2=A0 22.130872] Flags: nZcv=C2=A0 IRQs on=C2=A0 FIQs on=C2=A0 Mode=
 SVC_32=C2=A0 ISA ARM=C2=A0 Segment user
[=C2=A0=C2=A0 22.138040] Control: 10c5387d=C2=A0 Table: 9c880019=C2=A0 DAC:=
 00000015
[=C2=A0=C2=A0 22.143811] Process modprobe (pid: 596, stack limit =3D 0xdc80=
4210)
[=C2=A0=C2=A0 22.149932] Stack: (0xdc805d78 to 0xdc806000)
[=C2=A0=C2=A0 22.154311] 5d60:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc805dac dc805d88
[=C2=A0=C2=A0 22.162531] 5d80: bf1fa9d4 bf1fecfc dcb20000 ddf76c00 00000000=
 bf239f7c bf239c78 bf239f7c
[=C2=A0=C2=A0 22.170751] 5da0: dc805dec dc805db0 bf23c25c bf1fa8d8 bf239c78=
 00000000 00000000 ddc4b900
[=C2=A0=C2=A0 22.178972] 5dc0: c02ecc8c c08826a0 c08826a0 ddfdd800 bf23c000=
 dc847f40 bf239e40 00000000
[=C2=A0=C2=A0 22.187192] 5de0: dc805e6c dc805df0 c000966c bf23c00c 00000000=
 00080000 0040003e de36d000
[=C2=A0=C2=A0 22.195412] 5e00: bf239e40 00000001 dc805e4c dc805e18 c00c3d64=
 dc804000 de76f9fc dc847600
[=C2=A0=C2=A0 22.203631] 5e20: dd801e40 00007fd2 bf239e40 00000001 dc805e64=
 dc805e40 c00fb440 c00fae3c
[=C2=A0=C2=A0 22.211851] 5e40: 00000002 bf239e40 dc847f48 ddfddc80 00000001=
 dc847f40 bf239e40 00000001
[=C2=A0=C2=A0 22.220070] 5e60: dc805e94 dc805e70 c061c2ac c00095f0 bf239e88=
 00000001 dc805e94 dc805f48
[=C2=A0=C2=A0 22.228290] 5e80: dc847f48 bf239e88 dc805f44 dc805e98 c0090384=
 c061c258 bf239e4c 00007fff
[=C2=A0=C2=A0 22.236510] 5ea0: c008d58c ddc95480 00000000 bf239e4c bf239f6c=
 bf239e4c 00000000 bf23cb64
[=C2=A0=C2=A0 22.244730] 5ec0: 00020ee4 dc805f48 000012c7 00000000 0b300002=
 ddc981a4 00000001 00000000
[=C2=A0=C2=A0 22.252948] 5ee0: 00000000 00000000 00000000 00000000 00000000=
 00000000 00000000 00000000
[=C2=A0=C2=A0 22.261167] 5f00: 00000000 00000000 00000000 00000000 00000000=
 00000000 dc805f34 00000000
[=C2=A0=C2=A0 22.269387] 5f20: 00000003 00020ee4 0000017b c000fb24 dc804000=
 00000000 dc805fa4 dc805f48
[=C2=A0=C2=A0 22.277607] 5f40: c0090a6c c008eac4 e111b000 000268f3 e113810c=
 e1137fb0 e1141594 00000fb4
[=C2=A0=C2=A0 22.285826] 5f60: 00001454 00000000 00000000 00000000 00000024=
 00000025 0000000e 0000000b
[=C2=A0=C2=A0 22.294045] 5f80: 00000009 00000000 00000000 00000000 0002b168=
 00000000 00000000 dc805fa8
[=C2=A0=C2=A0 22.302264] 5fa0: c000f980 c0090a08 00000000 0002b168 00000003=
 00020ee4 00000000 00040000
[=C2=A0=C2=A0 22.310483] 5fc0: 00000000 0002b168 00000000 0000017b 00000000=
 0002b168 0002b330 00000000
[=C2=A0=C2=A0 22.318704] 5fe0: beea9a10 beea9a00 00016f84 b6e68ed0 60080010=
 00000003 e1a0c00d e92dd800
[=C2=A0=C2=A0 22.326914] Backtrace:=20
[=C2=A0=C2=A0 22.329467] [<bf1fecf0>] (AllocateDeviceID [pvrsrvkm]) from [<=
bf1fa9d4>] (PVRSRVRegisterBCDeviceKM+0x108/0x18c [pvrsrvkm])
[=C2=A0=C2=A0 22.340617] [<bf1fa8cc>] (PVRSRVRegisterBCDeviceKM [pvrsrvkm])=
 from [<bf23c25c>] (bc_cat_init+0x25c/0x324 [bufferclass_ti])
[=C2=A0=C2=A0 22.351796]=C2=A0 r7:bf239f7c r6:bf239c78 r5:bf239f7c r4:00000=
000
[=C2=A0=C2=A0 22.357535] [<bf23c000>] (bc_cat_init [bufferclass_ti]) from [=
<c000966c>] (do_one_initcall+0x88/0x1e0)
[=C2=A0=C2=A0 22.366882]=C2=A0 r10:00000000 r9:bf239e40 r8:dc847f40 r7:bf23=
c000 r6:ddfdd800 r5:c08826a0
[=C2=A0=C2=A0 22.374785]=C2=A0 r4:c08826a0
[=C2=A0=C2=A0 22.377351] [<c00095e4>] (do_one_initcall) from [<c061c2ac>] (=
do_init_module+0x60/0x1b0)
[=C2=A0=C2=A0 22.385475]=C2=A0 r10:00000001 r9:bf239e40 r8:dc847f40 r7:0000=
0001 r6:ddfddc80 r5:dc847f48
[=C2=A0=C2=A0 22.393377]=C2=A0 r4:bf239e40
[=C2=A0=C2=A0 22.395937] [<c061c24c>] (do_init_module) from [<c0090384>] (l=
oad_module+0x18cc/0x1e0c)
[=C2=A0=C2=A0 22.403974]=C2=A0 r6:bf239e88 r5:dc847f48 r4:dc805f48
[=C2=A0=C2=A0 22.408639] [<c008eab8>] (load_module) from [<c0090a6c>] (SyS_=
finit_module+0x70/0x80)
[=C2=A0=C2=A0 22.416503]=C2=A0 r10:00000000 r9:dc804000 r8:c000fb24 r7:0000=
017b r6:00020ee4 r5:00000003
[=C2=A0=C2=A0 22.424406]=C2=A0 r4:00000000
[=C2=A0=C2=A0 22.426967] [<c00909fc>] (SyS_finit_module) from [<c000f980>] =
(ret_fast_syscall+0x0/0x3c)
[=C2=A0=C2=A0 22.435179]=C2=A0 r6:00000000 r5:0002b168 r4:00000000
[=C2=A0=C2=A0 22.439843] Code: e89da818 e1a0c00d e92dd800 e24cb004 (e590200=
0)=20
[=C2=A0=C2=A0 22.452999] ---[ end trace 0d3e29e148f3f02b ]---
[=C2=A0=C2=A0 22.556695] Unhandled fault: external abort on non-linefetch (=
0x1018) at 0xb6f4f014
[=C2=A0=C2=A0 22.564412] pgd =3D dcae8000
[=C2=A0=C2=A0 22.567127] [b6f4f014] *pgd=3D9cb13831, *pte=3D56000303, *ppte=
=3D56000a33


------=_Part_8311291_1610758549.1446233384034
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"color:#000; background-color:#fff; f=
ont-family:times new roman, new york, times, serif;font-size:16px"><div id=
=3D"yui_3_16_0_1_1446232302033_3084">Hello,</div><div id=3D"yui_3_16_0_1_14=
46232302033_3370"><br></div><div dir=3D"ltr" id=3D"yui_3_16_0_1_14462323020=
33_3369">I try to build the linux-ti-staging-4.1 Kernel with Omap3 (EGLFS-S=
upport) for the Beagleboneblack (TI AM335x BeagleBone Black).</div><div id=
=3D"yui_3_16_0_1_1446232302033_3900" dir=3D"ltr">In the uEnv.txt I start th=
e Board with the am335x-boneblack.dtb File.</div><div id=3D"yui_3_16_0_1_14=
46232302033_3946" dir=3D"ltr">The Error is :</div><div id=3D"yui_3_16_0_1_1=
446232302033_3947" dir=3D"ltr">[&nbsp;&nbsp; 21.953922] omaplfb: Unknown sy=
mbol register_vsync_cb (err 0)<br class=3D"">[&nbsp;&nbsp; 21.959780] omapl=
fb: Unknown symbol unregister_vsync_cb (err 0)<br class=3D"">[&nbsp;&nbsp; =
22.021091] Unable to handle kernel NULL pointer dereference at virtual addr=
ess 00000000<br class=3D"">[&nbsp;&nbsp; 22.029541] pgd =3D dc880000<br cla=
ss=3D"">[&nbsp;&nbsp; 22.032793] [00000000] *pgd=3D9dcdc831, *pte=3D0000000=
0, *ppte=3D00000000<br class=3D""></div><div id=3D"yui_3_16_0_1_14462323020=
33_4019" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1446232302033_4018" =
dir=3D"ltr">I have googled a lot and have made a linux-ti-staging_4.1.bbapp=
end File where I added a file://0000-extraConfig.cfg.<br>The extra 0000-ext=
raConfig.cfg contains :&nbsp;</div><div id=3D"yui_3_16_0_1_1446232302033_42=
28" dir=3D"ltr">CONFIG_DRM=3Dy<br class=3D"">CONFIG_DRM_I2C_NXP_TDA998X=3Dy=
<br class=3D"">CONFIG_DRM_TILCDC=3Dy<br class=3D"">CONFIG_FB_DA8XX=3Dy<br c=
lass=3D"">CONFIG_FB_DA8XX_TDA998X=3Dy</div><div id=3D"yui_3_16_0_1_14462323=
02033_4308" dir=3D"ltr">But that has changed nothing.</div><div id=3D"yui_3=
_16_0_1_1446232302033_4374" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1=
446232302033_4375" dir=3D"ltr">What ist the problem ? Must I fix the OmapFB=
 or is there another problem. I don't know where to start to fix this bug.<=
br></div><div id=3D"yui_3_16_0_1_1446232302033_4749" dir=3D"ltr"><br></div>=
<div id=3D"yui_3_16_0_1_1446232302033_4748" dir=3D"ltr"><br></div><div id=
=3D"yui_3_16_0_1_1446232302033_4747" dir=3D"ltr">Complete LOG:</div><div id=
=3D"yui_3_16_0_1_1446232302033_4746" dir=3D"ltr"><br></div><div id=3D"yui_3=
_16_0_1_1446232302033_4735" dir=3D"ltr">[&nbsp;&nbsp;&nbsp; 0.000000] Booti=
ng Linux on physical CPU 0x0<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] In=
itializing cgroup subsys cpuset<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000]=
 Initializing cgroup subsys cpu<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000]=
 Initializing cgroup subsys cpuacct<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000=
000] Linux version 4.1.10 (benjamin@benjamin-EX58-EXTREME) (gcc version 4.9=
.2 (GCC) ) #2 PREEMPT Thu Oct 29 22:08:54 CET 2015<br class=3D"">[&nbsp;&nb=
sp;&nbsp; 0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=
=3D10c5387d<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] CPU: PIPT / VIPT no=
naliasing data cache, VIPT aliasing instruction cache<br class=3D"">[&nbsp;=
&nbsp;&nbsp; 0.000000] Machine model: TI AM335x BeagleBone Black<br class=
=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] cma: Reserved 24 MiB at 0x9e800000<br c=
lass=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] Memory policy: Data cache writeback=
<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] On node 0 totalpages: 131072<b=
r class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] free_area_init_node: node 0, pgd=
at c08bbb60, node_mem_map de36d000<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.0000=
00]&nbsp;&nbsp; Normal zone: 1152 pages used for memmap<br class=3D"">[&nbs=
p;&nbsp;&nbsp; 0.000000]&nbsp;&nbsp; Normal zone: 0 pages reserved<br class=
=3D"">[&nbsp;&nbsp;&nbsp; 0.000000]&nbsp;&nbsp; Normal zone: 131072 pages, =
LIFO batch:31<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] CPU: All CPU(s) s=
tarted in SVC mode.<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] AM335X ES2.=
1 (sgx neon )<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] pcpu-alloc: s0 r0=
 d32768 u32768 alloc=3D1*32768<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] =
pcpu-alloc: [0] 0 <br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] Built 1 zone=
lists in Zone order, mobility grouping on.&nbsp; Total pages: 129920<br cla=
ss=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] Kernel command line: console=3DttyS0,=
115200n8 consoleblank=3D0 root=3D/dev/mmcblk0p2 ro rootfstype=3Dext4 rootwa=
it<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] PID hash table entries: 2048=
 (order: 1, 8192 bytes)<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] Dentry =
cache hash table entries: 65536 (order: 6, 262144 bytes)<br class=3D"">[&nb=
sp;&nbsp;&nbsp; 0.000000] Inode-cache hash table entries: 32768 (order: 5, =
131072 bytes)<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] Memory: 485280K/5=
24288K available (6267K kernel code, 254K rwdata, 2132K rodata, 260K init, =
229K bss, 14432K reserved, 24576K cma-reserved, 0K highmem)<br class=3D"">[=
&nbsp;&nbsp;&nbsp; 0.000000] Virtual kernel memory layout:<br class=3D"">&n=
bsp;&nbsp;&nbsp; vector&nbsp; : 0xffff0000 - 0xffff1000&nbsp;&nbsp; (&nbsp;=
&nbsp; 4 kB)<br class=3D"">&nbsp;&nbsp;&nbsp; fixmap&nbsp; : 0xffc00000 - 0=
xfff00000&nbsp;&nbsp; (3072 kB)<br class=3D"">&nbsp;&nbsp;&nbsp; vmalloc : =
0xe0800000 - 0xff000000&nbsp;&nbsp; ( 488 MB)<br class=3D"">&nbsp;&nbsp;&nb=
sp; lowmem&nbsp; : 0xc0000000 - 0xe0000000&nbsp;&nbsp; ( 512 MB)<br class=
=3D"">&nbsp;&nbsp;&nbsp; pkmap&nbsp;&nbsp; : 0xbfe00000 - 0xc0000000&nbsp;&=
nbsp; (&nbsp;&nbsp; 2 MB)<br class=3D"">&nbsp;&nbsp;&nbsp; modules : 0xbf00=
0000 - 0xbfe00000&nbsp;&nbsp; (&nbsp; 14 MB)<br class=3D"">&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; .text : 0xc0008000 - 0xc083c05c&nbsp;&nbsp; (8401 kB)<br cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .init : 0xc083d000 - 0xc087e000&nbsp=
;&nbsp; ( 260 kB)<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .data : 0xc0=
87e000 - 0xc08bdba8&nbsp;&nbsp; ( 255 kB)<br class=3D"">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; .bss : 0xc08c0000 - 0xc08f97f0&nbsp;&nbsp; ( 230 kB)<br c=
lass=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] SLUB: HWalign=3D64, Order=3D0-3, Mi=
nObjects=3D0, CPUs=3D1, Nodes=3D1<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.00000=
0] Preemptible hierarchical RCU implementation.<br class=3D"">[&nbsp;&nbsp;=
&nbsp; 0.000000] &nbsp;&nbsp;&nbsp; Additional per-CPU info printed with st=
alls.<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] NR_IRQS:16 nr_irqs:16 16<=
br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000000] IRQ: Found an INTC at 0xfa20000=
0 (revision 5.0) with 128 interrupts<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.00=
0000] OMAP clockevent source: timer2 at 24000000 Hz<br class=3D"">[&nbsp;&n=
bsp;&nbsp; 0.000012] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps =
every 89478484971ns<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000030] clocksource=
 timer1: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635851949 =
ns<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000040] OMAP clocksource: timer1 at =
24000000 Hz<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000192] Console: colour dum=
my device 80x30<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.000224] Calibrating del=
ay loop... 996.14 BogoMIPS (lpj=3D4980736)<br class=3D"">[&nbsp;&nbsp;&nbsp=
; 0.089358] pid_max: default: 32768 minimum: 301<br class=3D"">[&nbsp;&nbsp=
;&nbsp; 0.089447] Security Framework initialized<br class=3D"">[&nbsp;&nbsp=
;&nbsp; 0.089492] Mount-cache hash table entries: 1024 (order: 0, 4096 byte=
s)<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.089502] Mountpoint-cache hash table =
entries: 1024 (order: 0, 4096 bytes)<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.09=
0100] Initializing cgroup subsys blkio<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.=
090120] Initializing cgroup subsys memory<br class=3D"">[&nbsp;&nbsp;&nbsp;=
 0.090158] Initializing cgroup subsys devices<br class=3D"">[&nbsp;&nbsp;&n=
bsp; 0.090172] Initializing cgroup subsys freezer<br class=3D"">[&nbsp;&nbs=
p;&nbsp; 0.090184] Initializing cgroup subsys perf_event<br class=3D"">[&nb=
sp;&nbsp;&nbsp; 0.090206] CPU: Testing write buffer coherency: ok<br class=
=3D"">[&nbsp;&nbsp;&nbsp; 0.090556] Setting up static identity map for 0x80=
008200 - 0x80008270<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.091878] devtmpfs: i=
nitialized<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.099969] VFP support v0.3: im=
plementor 41 architecture 3 part 30 variant c rev 3<br class=3D"">[&nbsp;&n=
bsp;&nbsp; 0.107299] omap_hwmod: tptc0 using broken dt data from edma<br cl=
ass=3D"">[&nbsp;&nbsp;&nbsp; 0.107399] omap_hwmod: tptc1 using broken dt da=
ta from edma<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.107480] omap_hwmod: tptc2 =
using broken dt data from edma<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.111737] =
omap_hwmod: debugss: _wait_target_disable failed<br class=3D"">[&nbsp;&nbsp=
;&nbsp; 0.166099] clocksource jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 19112604462750000 ns<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.=
168044] pinctrl core: initialized pinctrl subsystem<br class=3D"">[&nbsp;&n=
bsp;&nbsp; 0.169185] NET: Registered protocol family 16<br class=3D"">[&nbs=
p;&nbsp;&nbsp; 0.171199] DMA: preallocated 256 KiB pool for atomic coherent=
 allocations<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.199346] cpuidle: using gov=
ernor ladder<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.229337] cpuidle: using gov=
ernor menu<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.232215] gpiochip_add: regist=
ered GPIOs 0 to 31 on device: gpio<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.2324=
93] OMAP GPIO hardware version 0.1<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.2331=
24] gpiochip_add: registered GPIOs 32 to 63 on device: gpio<br class=3D"">[=
&nbsp;&nbsp;&nbsp; 0.233774] gpiochip_add: registered GPIOs 64 to 95 on dev=
ice: gpio<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.234394] gpiochip_add: registe=
red GPIOs 96 to 127 on device: gpio<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.240=
725] No ATAGs?<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.240753] hw-breakpoint: d=
ebug architecture 0x4 unsupported.<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.2762=
42] edma-dma-engine edma-dma-engine.0: TI EDMA DMA engine driver<br class=
=3D"">[&nbsp;&nbsp;&nbsp; 0.276653] of_get_named_gpiod_flags: can't parse '=
gpio' property of node '/fixedregulator@0[0]'<br class=3D"">[&nbsp;&nbsp;&n=
bsp; 0.278871] vgaarb: loaded<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.279431] S=
CSI subsystem initialized<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.279890] omap_=
i2c 44e0b000.i2c: could not find pctldev for node /ocp/l4_wkup@44c00000/scm=
@210000/pinmux@800/pinmux_i2c0_pins, deferring probe<br class=3D"">[&nbsp;&=
nbsp;&nbsp; 0.280030] pps_core: LinuxPPS API ver. 1 registered<br class=3D"=
">[&nbsp;&nbsp;&nbsp; 0.280037] pps_core: Software ver. 5.3.6 - Copyright 2=
005-2007 Rodolfo Giometti &lt;giometti@linux.it&gt;<br class=3D"">[&nbsp;&n=
bsp;&nbsp; 0.280067] PTP clock support registered<br class=3D"">[&nbsp;&nbs=
p;&nbsp; 0.280765] omap-mailbox 480c8000.mailbox: omap mailbox rev 0x400<br=
 class=3D"">[&nbsp;&nbsp;&nbsp; 0.280972] Advanced Linux Sound Architecture=
 Driver Initialized.<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.281694] Switched t=
o clocksource timer1<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.290448] NET: Regis=
tered protocol family 2<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.291176] TCP est=
ablished hash table entries: 4096 (order: 2, 16384 bytes)<br class=3D"">[&n=
bsp;&nbsp;&nbsp; 0.291221] TCP bind hash table entries: 4096 (order: 2, 163=
84 bytes)<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.291259] TCP: Hash tables conf=
igured (established 4096 bind 4096)<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.291=
337] UDP hash table entries: 256 (order: 0, 4096 bytes)<br class=3D"">[&nbs=
p;&nbsp;&nbsp; 0.291354] UDP-Lite hash table entries: 256 (order: 0, 4096 b=
ytes)<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.291502] NET: Registered protocol =
family 1<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.291921] RPC: Registered named =
UNIX socket transport module.<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.291935] R=
PC: Registered udp transport module.<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.29=
1941] RPC: Registered tcp transport module.<br class=3D"">[&nbsp;&nbsp;&nbs=
p; 0.291946] RPC: Registered tcp NFSv4.1 backchannel transport module.<br c=
lass=3D"">[&nbsp;&nbsp;&nbsp; 0.291970] PCI: CLS 0 bytes, default 64<br cla=
ss=3D"">[&nbsp;&nbsp;&nbsp; 0.292719] CPU PMU: Failed to parse /pmu/interru=
pt-affinity[0]<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.292763] hw perfevents: e=
nabled with armv7_cortex_a8 PMU driver, 5 counters available<br class=3D"">=
[&nbsp;&nbsp;&nbsp; 0.294391] futex hash table entries: 256 (order: -1, 307=
2 bytes)<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.294473] audit: initializing ne=
tlink subsys (disabled)<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.294534] audit: =
type=3D2000 audit(0.280:1): initialized<br class=3D"">[&nbsp;&nbsp;&nbsp; 0=
.300774] VFS: Disk quotas dquot_6.6.0<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.3=
00957] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)<br c=
lass=3D"">[&nbsp;&nbsp;&nbsp; 0.302976] NFS: Registering the id_resolver ke=
y type<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.303043] Key type id_resolver reg=
istered<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.303050] Key type id_legacy regi=
stered<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.303115] jffs2: version 2.2. (NAN=
D) (SUMMARY)&nbsp; \xffffffc2\xffffffa9 2001-2006 Red Hat, Inc.<br class=3D=
"">[&nbsp;&nbsp;&nbsp; 0.305300] NET: Registered protocol family 38<br clas=
s=3D"">[&nbsp;&nbsp;&nbsp; 0.305369] io scheduler noop registered<br class=
=3D"">[&nbsp;&nbsp;&nbsp; 0.305382] io scheduler deadline registered<br cla=
ss=3D"">[&nbsp;&nbsp;&nbsp; 0.305436] io scheduler cfq registered (default)=
<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.306334] pinctrl-single 44e10800.pinmux=
: 142 pins at pa f9e10800 size 568<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.3079=
63] wkup_m3_ipc 44e11324.wkup_m3_ipc: could not get rproc handle<br class=
=3D"">[&nbsp;&nbsp;&nbsp; 0.308888] Serial: 8250/16550 driver, 10 ports, IR=
Q sharing enabled<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.311449] omap8250 44e0=
9000.serial: GPIO lookup for consumer enable<br class=3D"">[&nbsp;&nbsp;&nb=
sp; 0.311466] omap8250 44e09000.serial: using device tree for GPIO lookup<b=
r class=3D"">[&nbsp;&nbsp;&nbsp; 0.311481] of_get_named_gpiod_flags: can't =
parse 'enable-gpios' property of node '/ocp/serial@44e09000[0]'<br class=3D=
"">[&nbsp;&nbsp;&nbsp; 0.311489] of_get_named_gpiod_flags: can't parse 'ena=
ble-gpio' property of node '/ocp/serial@44e09000[0]'<br class=3D"">[&nbsp;&=
nbsp;&nbsp; 0.311497] omap8250 44e09000.serial: using lookup tables for GPI=
O lookup<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.311507] omap8250 44e09000.seri=
al: lookup for GPIO enable failed<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.31202=
1] console [ttyS0] disabled<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.312097] 44e=
09000.serial: ttyS0 at MMIO 0x44e09000 (irq =3D 155, base_baud =3D 3000000)=
 is a 8250<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.932202] console [ttyS0] enab=
led<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.936567] [drm] Initialized drm 1.1.0=
 20060810<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.941508] slave hdmi: could not=
 get i2c<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.954626] brd: module loaded<br =
class=3D"">[&nbsp;&nbsp;&nbsp; 0.962095] loop: module loaded<br class=3D"">=
[&nbsp;&nbsp;&nbsp; 0.966072] mtdoops: mtd device (mtddev=3Dname/number) mu=
st be supplied<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.974361] mousedev: PS/2 m=
ouse device common for all mice<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.979975]=
 i2c /dev entries driver<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.984295] omap_h=
smmc 48060000.mmc: GPIO lookup for consumer cd<br class=3D"">[&nbsp;&nbsp;&=
nbsp; 0.984311] omap_hsmmc 48060000.mmc: using device tree for GPIO lookup<=
br class=3D"">[&nbsp;&nbsp;&nbsp; 0.984337] of_get_named_gpiod_flags: parse=
d 'cd-gpios' property of node '/ocp/mmc@48060000[0]' - status (0)<br class=
=3D"">[&nbsp;&nbsp;&nbsp; 0.984415] omap_hsmmc 48060000.mmc: Got CD GPIO<br=
 class=3D"">[&nbsp;&nbsp;&nbsp; 0.989058] omap_hsmmc 48060000.mmc: GPIO loo=
kup for consumer wp<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.989066] omap_hsmmc =
48060000.mmc: using device tree for GPIO lookup<br class=3D"">[&nbsp;&nbsp;=
&nbsp; 0.989075] of_get_named_gpiod_flags: can't parse 'wp-gpios' property =
of node '/ocp/mmc@48060000[0]'<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.989084] =
of_get_named_gpiod_flags: can't parse 'wp-gpio' property of node '/ocp/mmc@=
48060000[0]'<br class=3D"">[&nbsp;&nbsp;&nbsp; 0.989092] omap_hsmmc 4806000=
0.mmc: using lookup tables for GPIO lookup<br class=3D"">[&nbsp;&nbsp;&nbsp=
; 0.989101] omap_hsmmc 48060000.mmc: lookup for GPIO wp failed<br class=3D"=
">[&nbsp;&nbsp;&nbsp; 1.022282] omap_hsmmc 481d8000.mmc: GPIO lookup for co=
nsumer cd<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.022302] omap_hsmmc 481d8000.m=
mc: using device tree for GPIO lookup<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.0=
22314] of_get_named_gpiod_flags: can't parse 'cd-gpios' property of node '/=
ocp/mmc@481d8000[0]'<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.022323] of_get_nam=
ed_gpiod_flags: can't parse 'cd-gpio' property of node '/ocp/mmc@481d8000[0=
]'<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.022331] omap_hsmmc 481d8000.mmc: usi=
ng lookup tables for GPIO lookup<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.022340=
] omap_hsmmc 481d8000.mmc: lookup for GPIO cd failed<br class=3D"">[&nbsp;&=
nbsp;&nbsp; 1.022350] omap_hsmmc 481d8000.mmc: GPIO lookup for consumer wp<=
br class=3D"">[&nbsp;&nbsp;&nbsp; 1.022357] omap_hsmmc 481d8000.mmc: using =
device tree for GPIO lookup<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.022365] of_=
get_named_gpiod_flags: can't parse 'wp-gpios' property of node '/ocp/mmc@48=
1d8000[0]'<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.022373] of_get_named_gpiod_f=
lags: can't parse 'wp-gpio' property of node '/ocp/mmc@481d8000[0]'<br clas=
s=3D"">[&nbsp;&nbsp;&nbsp; 1.022380] omap_hsmmc 481d8000.mmc: using lookup =
tables for GPIO lookup<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.022387] omap_hsm=
mc 481d8000.mmc: lookup for GPIO wp failed<br class=3D"">[&nbsp;&nbsp;&nbsp=
; 1.061963] ledtrig-cpu: registered to indicate activity on CPUs<br class=
=3D"">[&nbsp;&nbsp;&nbsp; 1.068288] omap-aes 53500000.aes: OMAP AES hw acce=
l rev: 3.2<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.075376] omap-sham 53100000.s=
ham: hw accel on OMAP rev 4.3<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.082544]&n=
bsp; remoteproc0: wkup_m3 is available<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.=
087018]&nbsp; remoteproc0: Note: remoteproc is still under development and =
considered experimental.<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.096172]&nbsp; =
remoteproc0: THE BINARY FORMAT IS NOT YET FINALIZED, and backward compatibi=
lity isn't yet guaranteed.<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.106858]&nbsp=
; remoteproc0: Direct firmware load for am335x-pm-firmware.elf failed with =
error -2<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.118002] oprofile: using arm/ar=
mv7<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.121893]&nbsp; remoteproc0: Falling =
back to user helper<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.127397] Initializin=
g XFRM netlink socket<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.131859] NET: Regi=
stered protocol family 17<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.136349] mmc0:=
 host does not support reading read-only switch, assuming write-enable<br c=
lass=3D"">[&nbsp;&nbsp;&nbsp; 1.144599] NET: Registered protocol family 15<=
br class=3D"">[&nbsp;&nbsp;&nbsp; 1.149171] Key type dns_resolver registere=
d<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.153709] omap_voltage_late_init: Volta=
ge driver support not added<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.160198] mmc=
0: new high speed SDHC card at address aaaa<br class=3D"">[&nbsp;&nbsp;&nbs=
p; 1.166250] ThumbEE CPU extension supported.<br class=3D"">[&nbsp;&nbsp;&n=
bsp; 1.170559] Registering SWP/SWPB emulation handler<br class=3D"">[&nbsp;=
&nbsp;&nbsp; 1.175905] mmcblk0: mmc0:aaaa SU08G 7.40 GiB <br class=3D"">[&n=
bsp;&nbsp;&nbsp; 1.182296]&nbsp; mmcblk0: p1 p2<br class=3D"">[&nbsp;&nbsp;=
&nbsp; 1.208663] tps65217 0-0024: TPS65217 ID 0xe version 1.2<br class=3D""=
>[&nbsp;&nbsp;&nbsp; 1.214135] omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 =
kHz<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.233327] mmc1: MAN_BKOPS_EN bit is n=
ot set<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.242067] mmc1: new high speed MMC=
 card at address 0001<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.247954] mmcblk1: =
mmc1:0001 MMC04G 3.60 GiB <br class=3D"">[&nbsp;&nbsp;&nbsp; 1.252734] mmcb=
lk1boot0: mmc1:0001 MMC04G partition 1 2.00 MiB<br class=3D"">[&nbsp;&nbsp;=
&nbsp; 1.258786] mmcblk1boot1: mmc1:0001 MMC04G partition 2 2.00 MiB<br cla=
ss=3D"">[&nbsp;&nbsp;&nbsp; 1.265751]&nbsp; mmcblk1: p1<br class=3D"">[&nbs=
p;&nbsp;&nbsp; 1.344041] tda998x 0-0070: found TDA19988<br class=3D"">[&nbs=
p;&nbsp;&nbsp; 1.349110] [drm] Supports vblank timestamp caching Rev 2 (21.=
10.2013).<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.355785] [drm] No driver suppo=
rt for vblank timestamp query.<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.490624] =
Console: switching to colour frame buffer device 160x64<br class=3D"">[&nbs=
p;&nbsp;&nbsp; 1.504953] tilcdc 4830e000.lcdc: fb0:&nbsp; frame buffer devi=
ce<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.510549] tilcdc 4830e000.lcdc: regist=
ered panic notifier<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.541726] [drm] Initi=
alized tilcdc 1.0.0 20121205 on minor 0<br class=3D"">[&nbsp;&nbsp;&nbsp; 1=
.611719] davinci_mdio 4a101000.mdio: davinci mdio revision 1.6<br class=3D"=
">[&nbsp;&nbsp;&nbsp; 1.617859] davinci_mdio 4a101000.mdio: detected phy ma=
sk fffffffe<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.624887] libphy: 4a101000.md=
io: probed<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.628927] davinci_mdio 4a10100=
0.mdio: phy[0]: device 4a101000.mdio:00, driver SMSC LAN8710/LAN8720<br cla=
ss=3D"">[&nbsp;&nbsp;&nbsp; 1.638853] cpsw 4a100000.ethernet: Detected MACI=
D =3D 78:a5:04:f8:7d:81<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.646447] hctosys=
: unable to open rtc device (rtc0)<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.6549=
54] ALSA device list:<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.657953]&nbsp;&nbs=
p; No soundcards found.<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.680347] EXT4-fs=
 (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)<br cl=
ass=3D"">[&nbsp;&nbsp;&nbsp; 1.688662] VFS: Mounted root (ext4 filesystem) =
readonly on device 179:2.<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.701789] devtm=
pfs: mounted<br class=3D"">[&nbsp;&nbsp;&nbsp; 1.705090] Freeing unused ker=
nel memory: 260K (c083d000 - c087e000)<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.=
376604] udevd[95]: starting version 182<br class=3D"">[&nbsp;&nbsp;&nbsp; 2=
.576210] of_get_named_gpiod_flags: parsed 'gpios' property of node '/leds/l=
ed@2[0]' - status (0)<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.576511] of_get_na=
med_gpiod_flags: parsed 'gpios' property of node '/leds/led@3[0]' - status =
(0)<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.576658] of_get_named_gpiod_flags: p=
arsed 'gpios' property of node '/leds/led@4[0]' - status (0)<br class=3D"">=
[&nbsp;&nbsp;&nbsp; 2.576785] of_get_named_gpiod_flags: parsed 'gpios' prop=
erty of node '/leds/led@5[0]' - status (0)<br class=3D"">[&nbsp;&nbsp;&nbsp=
; 2.586208] cpu cpu0: of_pm_voltdm_notifier_register: Fail calculating volt=
age latency[950000&lt;-&gt;1325000]:-22<br class=3D"">[&nbsp;&nbsp;&nbsp; 2=
.620459] omap_wdt: OMAP Watchdog Timer Rev 0x01: initial timeout 60 sec<br =
class=3D"">[&nbsp;&nbsp;&nbsp; 2.656116] omap_rtc 44e3e000.rtc: rtc core: r=
egistered 44e3e000.rtc as rtc0<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.664866] =
cpu cpu0: of_pm_voltdm_notifier_register: Fail calculating voltage latency[=
950000&lt;-&gt;1325000]:-22<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.692566] am3=
35x-phy-driver 47401300.usb-phy: GPIO lookup for consumer reset<br class=3D=
"">[&nbsp;&nbsp;&nbsp; 2.692592] am335x-phy-driver 47401300.usb-phy: using =
device tree for GPIO lookup<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.692607] of_=
get_named_gpiod_flags: can't parse 'reset-gpios' property of node '/ocp/usb=
@47400000/usb-phy@47401300[0]'<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.692616] =
of_get_named_gpiod_flags: can't parse 'reset-gpio' property of node '/ocp/u=
sb@47400000/usb-phy@47401300[0]'<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.692625=
] am335x-phy-driver 47401300.usb-phy: using lookup tables for GPIO lookup<b=
r class=3D"">[&nbsp;&nbsp;&nbsp; 2.692635] am335x-phy-driver 47401300.usb-p=
hy: lookup for GPIO reset failed<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.692643=
] am335x-phy-driver 47401300.usb-phy: GPIO lookup for consumer vbus-detect<=
br class=3D"">[&nbsp;&nbsp;&nbsp; 2.692651] am335x-phy-driver 47401300.usb-=
phy: using device tree for GPIO lookup<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.=
692659] of_get_named_gpiod_flags: can't parse 'vbus-detect-gpios' property =
of node '/ocp/usb@47400000/usb-phy@47401300[0]'<br class=3D"">[&nbsp;&nbsp;=
&nbsp; 2.692668] of_get_named_gpiod_flags: can't parse 'vbus-detect-gpio' p=
roperty of node '/ocp/usb@47400000/usb-phy@47401300[0]'<br class=3D"">[&nbs=
p;&nbsp;&nbsp; 2.692675] am335x-phy-driver 47401300.usb-phy: using lookup t=
ables for GPIO lookup<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.692683] am335x-ph=
y-driver 47401300.usb-phy: lookup for GPIO vbus-detect failed<br class=3D""=
>[&nbsp;&nbsp;&nbsp; 2.692741] 47401300.usb-phy supply vcc not found, using=
 dummy regulator<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.734893] am335x-phy-dri=
ver 47401b00.usb-phy: GPIO lookup for consumer reset<br class=3D"">[&nbsp;&=
nbsp;&nbsp; 2.734918] am335x-phy-driver 47401b00.usb-phy: using device tree=
 for GPIO lookup<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.734933] of_get_named_g=
piod_flags: can't parse 'reset-gpios' property of node '/ocp/usb@47400000/u=
sb-phy@47401b00[0]'<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.734943] of_get_name=
d_gpiod_flags: can't parse 'reset-gpio' property of node '/ocp/usb@47400000=
/usb-phy@47401b00[0]'<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.734952] am335x-ph=
y-driver 47401b00.usb-phy: using lookup tables for GPIO lookup<br class=3D"=
">[&nbsp;&nbsp;&nbsp; 2.734961] am335x-phy-driver 47401b00.usb-phy: lookup =
for GPIO reset failed<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.734970] am335x-ph=
y-driver 47401b00.usb-phy: GPIO lookup for consumer vbus-detect<br class=3D=
"">[&nbsp;&nbsp;&nbsp; 2.734978] am335x-phy-driver 47401b00.usb-phy: using =
device tree for GPIO lookup<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.734986] of_=
get_named_gpiod_flags: can't parse 'vbus-detect-gpios' property of node '/o=
cp/usb@47400000/usb-phy@47401b00[0]'<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.73=
4995] of_get_named_gpiod_flags: can't parse 'vbus-detect-gpio' property of =
node '/ocp/usb@47400000/usb-phy@47401b00[0]'<br class=3D"">[&nbsp;&nbsp;&nb=
sp; 2.735002] am335x-phy-driver 47401b00.usb-phy: using lookup tables for G=
PIO lookup<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.735010] am335x-phy-driver 47=
401b00.usb-phy: lookup for GPIO vbus-detect failed<br class=3D"">[&nbsp;&nb=
sp;&nbsp; 2.735067] 47401b00.usb-phy supply vcc not found, using dummy regu=
lator<br class=3D"">[&nbsp;&nbsp;&nbsp; 2.829266] omap_rng 48310000.rng: OM=
AP Random Number Generator ver. 20<br class=3D"">[&nbsp;&nbsp;&nbsp; 3.0281=
42]&nbsp; remoteproc0: powering up wkup_m3<br class=3D"">[&nbsp;&nbsp;&nbsp=
; 3.035541] PM: bootloader does not support rtc-only!<br class=3D"">[&nbsp;=
&nbsp;&nbsp; 3.045982]&nbsp; remoteproc0: Booting fw image am335x-pm-firmwa=
re.elf, size 154079<br class=3D"">[&nbsp;&nbsp;&nbsp; 3.082122]&nbsp; remot=
eproc0: remote processor wkup_m3 is now up<br class=3D"">[&nbsp;&nbsp;&nbsp=
; 3.082143] wkup_m3_ipc 44e11324.wkup_m3_ipc: CM3 Firmware Version =3D 0x19=
1<br class=3D"">[&nbsp;&nbsp;&nbsp; 3.097258] of_get_named_gpiod_flags: par=
sed 'enable-gpios' property of node '/clk_mcasp0[0]' - status (0)<br class=
=3D"">[&nbsp;&nbsp;&nbsp; 3.103448] davinci_evm sound: hdmi-hifi &lt;-&gt; =
48038000.mcasp mapping ok<br class=3D"">[&nbsp;&nbsp;&nbsp; 3.438768] usbco=
re: registered new interface driver usbfs<br class=3D"">[&nbsp;&nbsp;&nbsp;=
 3.472883] usbcore: registered new interface driver hub<br class=3D"">[&nbs=
p;&nbsp;&nbsp; 3.492997] usbcore: registered new device driver usb<br class=
=3D"">[&nbsp;&nbsp;&nbsp; 3.520394] musb-hdrc: ConfigData=3D0xde (UTMI-8, d=
yn FIFOs, bulk combine, bulk split, HB-ISO Rx, HB-ISO Tx, SoftConn)<br clas=
s=3D"">[&nbsp;&nbsp;&nbsp; 3.520419] musb-hdrc: MHDRC RTL version 2.0 <br c=
lass=3D"">[&nbsp;&nbsp;&nbsp; 3.520427] musb-hdrc: setup fifo_mode 4<br cla=
ss=3D"">[&nbsp;&nbsp;&nbsp; 3.520445] musb-hdrc: 28/31 max ep, 16384/16384 =
memory<br class=3D"">[&nbsp;&nbsp;&nbsp; 3.547711] musb-hdrc: ConfigData=3D=
0xde (UTMI-8, dyn FIFOs, bulk combine, bulk split, HB-ISO Rx, HB-ISO Tx, So=
ftConn)<br class=3D"">[&nbsp;&nbsp;&nbsp; 3.547735] musb-hdrc: MHDRC RTL ve=
rsion 2.0 <br class=3D"">[&nbsp;&nbsp;&nbsp; 3.547743] musb-hdrc: setup fif=
o_mode 4<br class=3D"">[&nbsp;&nbsp;&nbsp; 3.547757] musb-hdrc: 28/31 max e=
p, 16384/16384 memory<br class=3D"">[&nbsp;&nbsp;&nbsp; 3.547883] musb-hdrc=
 musb-hdrc.1.auto: MUSB HDRC host driver<br class=3D"">[&nbsp;&nbsp;&nbsp; =
3.557884] musb-hdrc musb-hdrc.1.auto: new USB bus registered, assigned bus =
number 1<br class=3D"">[&nbsp;&nbsp;&nbsp; 3.567343] usb usb1: New USB devi=
ce found, idVendor=3D1d6b, idProduct=3D0002<br class=3D"">[&nbsp;&nbsp;&nbs=
p; 3.575433] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Serial=
Number=3D1<br class=3D"">[&nbsp;&nbsp;&nbsp; 3.583585] usb usb1: Product: M=
USB HDRC host driver<br class=3D"">[&nbsp;&nbsp;&nbsp; 3.588575] usb usb1: =
Manufacturer: Linux 4.1.10 musb-hcd<br class=3D"">[&nbsp;&nbsp;&nbsp; 3.594=
450] usb usb1: SerialNumber: musb-hdrc.1.auto<br class=3D"">[&nbsp;&nbsp;&n=
bsp; 3.601379] hub 1-0:1.0: USB hub found<br class=3D"">[&nbsp;&nbsp;&nbsp;=
 3.606026] hub 1-0:1.0: 1 port detected<br class=3D"">[&nbsp;&nbsp;&nbsp; 3=
.722771] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)<br class=3D"">[&nbsp=
;&nbsp;&nbsp; 3.864028] random: dd urandom read with 57 bits of entropy ava=
ilable<br class=3D"">[&nbsp;&nbsp;&nbsp; 4.031876] usb 1-1: new full-speed =
USB device number 2 using musb-hdrc<br class=3D"">[&nbsp;&nbsp;&nbsp; 4.194=
262] usb 1-1: New USB device found, idVendor=3D046d, idProduct=3Dc52b<br cl=
ass=3D"">[&nbsp;&nbsp;&nbsp; 4.201020] usb 1-1: New USB device strings: Mfr=
=3D1, Product=3D2, SerialNumber=3D0<br class=3D"">[&nbsp;&nbsp;&nbsp; 4.241=
938] usb 1-1: Product: USB Receiver<br class=3D"">[&nbsp;&nbsp;&nbsp; 4.246=
081] usb 1-1: Manufacturer: Logitech<br class=3D"">[&nbsp;&nbsp;&nbsp; 8.27=
4727] usbcore: registered new interface driver usbhid<br class=3D"">[&nbsp;=
&nbsp;&nbsp; 8.280381] usbhid: USB HID core driver<br class=3D"">[&nbsp;&nb=
sp;&nbsp; 8.311024] usbcore: registered new interface driver usbkbd<br clas=
s=3D"">[&nbsp;&nbsp;&nbsp; 8.326484] usbcore: registered new interface driv=
er usbmouse<br class=3D"">[&nbsp;&nbsp;&nbsp; 8.338026] input: Logitech USB=
 Receiver as /devices/platform/ocp/47400000.usb/47401c00.usb/musb-hdrc.1.au=
to/usb1/1-1/1-1:1.0/0003:046D:C52B.0001/input/input0<br class=3D"">[&nbsp;&=
nbsp;&nbsp; 8.462483] hid-generic 0003:046D:C52B.0001: input: USB HID v1.11=
 Keyboard [Logitech USB Receiver] on usb-musb-hdrc.1.auto-1/input0<br class=
=3D"">[&nbsp;&nbsp;&nbsp; 8.510248] input: Logitech USB Receiver as /device=
s/platform/ocp/47400000.usb/47401c00.usb/musb-hdrc.1.auto/usb1/1-1/1-1:1.1/=
0003:046D:C52B.0002/input/input1<br class=3D"">[&nbsp;&nbsp;&nbsp; 8.584867=
] hid-generic 0003:046D:C52B.0002: input,hiddev0: USB HID v1.11 Mouse [Logi=
tech USB Receiver] on usb-musb-hdrc.1.auto-1/input1<br class=3D"">[&nbsp;&n=
bsp;&nbsp; 8.627403] hid-generic 0003:046D:C52B.0003: hiddev0: USB HID v1.1=
1 Device [Logitech USB Receiver] on usb-musb-hdrc.1.auto-1/input2<br class=
=3D"">[&nbsp;&nbsp;&nbsp; 9.033530] net eth0: initializing cpsw version 1.1=
2 (0)<br class=3D"">[&nbsp;&nbsp;&nbsp; 9.041396] net eth0: phy found : id =
is : 0x7c0f1<br class=3D"">[&nbsp;&nbsp;&nbsp; 9.046432] libphy: PHY 4a1010=
00.mdio:01 not found<br class=3D"">[&nbsp;&nbsp;&nbsp; 9.051266] net eth0: =
phy 4a101000.mdio:01 not found on slave 1<br class=3D"">[&nbsp;&nbsp; 12.11=
2518] cpsw 4a100000.ethernet eth0: Link is Up - 100Mbps/Full - flow control=
 rx/tx<br class=3D"">[&nbsp;&nbsp; 20.533042] NET: Registered protocol fami=
ly 10<br class=3D"">[&nbsp;&nbsp; 21.268486] Bluetooth: Core ver 2.20<br cl=
ass=3D"">[&nbsp;&nbsp; 21.281020] NET: Registered protocol family 31<br cla=
ss=3D"">[&nbsp;&nbsp; 21.291884] Bluetooth: HCI device and connection manag=
er initialized<br class=3D"">[&nbsp;&nbsp; 21.298342] Bluetooth: HCI socket=
 layer initialized<br class=3D"">[&nbsp;&nbsp; 21.328927] Bluetooth: L2CAP =
socket layer initialized<br class=3D"">[&nbsp;&nbsp; 21.338179] Bluetooth: =
SCO socket layer initialized<br class=3D"">[&nbsp;&nbsp; 21.387517] random:=
 nonblocking pool is initialized<br class=3D"">[&nbsp;&nbsp; 21.953922] oma=
plfb: Unknown symbol register_vsync_cb (err 0)<br class=3D"">[&nbsp;&nbsp; =
21.959780] omaplfb: Unknown symbol unregister_vsync_cb (err 0)<br class=3D"=
">[&nbsp;&nbsp; 22.021091] Unable to handle kernel NULL pointer dereference=
 at virtual address 00000000<br class=3D"">[&nbsp;&nbsp; 22.029541] pgd =3D=
 dc880000<br class=3D"">[&nbsp;&nbsp; 22.032793] [00000000] *pgd=3D9dcdc831=
, *pte=3D00000000, *ppte=3D00000000<br class=3D"">[&nbsp;&nbsp; 22.039134] =
Internal error: Oops: 17 [#1] PREEMPT ARM<br class=3D"">[&nbsp;&nbsp; 22.04=
4212] Modules linked in: bufferclass_ti(O+) pvrsrvkm(O) bluetooth ipv6 joyd=
ev evdev usbmouse hid_generic usbkbd usbhid musb_dsps musb_hdrc udc_core us=
bcore snd_soc_evm pm33xx omap_rng rng_core musb_am335x rtc_omap omap_wdt cp=
ufreq_voltdm leds_gpio snd_soc_hdmi_codec thermal_sys hwmon<br class=3D"">[=
&nbsp;&nbsp; 22.070177] CPU: 0 PID: 596 Comm: modprobe Tainted: G&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O&nbsp;&nbsp;&nbsp; 4.1.=
10 #2<br class=3D"">[&nbsp;&nbsp; 22.077432] Hardware name: Generic AM33XX =
(Flattened Device Tree)<br class=3D"">[&nbsp;&nbsp; 22.083555] task: ddc5fa=
80 ti: dc804000 task.ti: dc804000<br class=3D"">[&nbsp;&nbsp; 22.089128] PC=
 is at AllocateDeviceID+0xc/0x50 [pvrsrvkm]<br class=3D"">[&nbsp;&nbsp; 22.=
094592] LR is at PVRSRVRegisterBCDeviceKM+0x108/0x18c [pvrsrvkm]<br class=
=3D"">[&nbsp;&nbsp; 22.100978] pc : [&lt;bf1fecfc&gt;]&nbsp;&nbsp;&nbsp; lr=
 : [&lt;bf1fa9d4&gt;]&nbsp;&nbsp;&nbsp; psr: 400f0013<br class=3D"">sp : dc=
805d78&nbsp; ip : dc805d88&nbsp; fp : dc805d84<br class=3D"">[&nbsp;&nbsp; =
22.112508] r10: bf239168&nbsp; r9 : bf1fbfb8&nbsp; r8 : c08d8974<br class=
=3D"">[&nbsp;&nbsp; 22.117757] r7 : 00000000&nbsp; r6 : ddc4b904&nbsp; r5 :=
 00000000&nbsp; r4 : ddc4b920<br class=3D"">[&nbsp;&nbsp; 22.124313] r3 : 0=
0000002&nbsp; r2 : 00000009&nbsp; r1 : ddf76c08&nbsp; r0 : 00000000<br clas=
s=3D"">[&nbsp;&nbsp; 22.130872] Flags: nZcv&nbsp; IRQs on&nbsp; FIQs on&nbs=
p; Mode SVC_32&nbsp; ISA ARM&nbsp; Segment user<br class=3D"">[&nbsp;&nbsp;=
 22.138040] Control: 10c5387d&nbsp; Table: 9c880019&nbsp; DAC: 00000015<br =
class=3D"">[&nbsp;&nbsp; 22.143811] Process modprobe (pid: 596, stack limit=
 =3D 0xdc804210)<br class=3D"">[&nbsp;&nbsp; 22.149932] Stack: (0xdc805d78 =
to 0xdc806000)<br class=3D"">[&nbsp;&nbsp; 22.154311] 5d60:&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; dc805dac dc805d88<br class=3D"">[&nbsp;&nbsp; 22.162531] 5d80: bf1=
fa9d4 bf1fecfc dcb20000 ddf76c00 00000000 bf239f7c bf239c78 bf239f7c<br cla=
ss=3D"">[&nbsp;&nbsp; 22.170751] 5da0: dc805dec dc805db0 bf23c25c bf1fa8d8 =
bf239c78 00000000 00000000 ddc4b900<br class=3D"">[&nbsp;&nbsp; 22.178972] =
5dc0: c02ecc8c c08826a0 c08826a0 ddfdd800 bf23c000 dc847f40 bf239e40 000000=
00<br class=3D"">[&nbsp;&nbsp; 22.187192] 5de0: dc805e6c dc805df0 c000966c =
bf23c00c 00000000 00080000 0040003e de36d000<br class=3D"">[&nbsp;&nbsp; 22=
.195412] 5e00: bf239e40 00000001 dc805e4c dc805e18 c00c3d64 dc804000 de76f9=
fc dc847600<br class=3D"">[&nbsp;&nbsp; 22.203631] 5e20: dd801e40 00007fd2 =
bf239e40 00000001 dc805e64 dc805e40 c00fb440 c00fae3c<br class=3D"">[&nbsp;=
&nbsp; 22.211851] 5e40: 00000002 bf239e40 dc847f48 ddfddc80 00000001 dc847f=
40 bf239e40 00000001<br class=3D"">[&nbsp;&nbsp; 22.220070] 5e60: dc805e94 =
dc805e70 c061c2ac c00095f0 bf239e88 00000001 dc805e94 dc805f48<br class=3D"=
">[&nbsp;&nbsp; 22.228290] 5e80: dc847f48 bf239e88 dc805f44 dc805e98 c00903=
84 c061c258 bf239e4c 00007fff<br class=3D"">[&nbsp;&nbsp; 22.236510] 5ea0: =
c008d58c ddc95480 00000000 bf239e4c bf239f6c bf239e4c 00000000 bf23cb64<br =
class=3D"">[&nbsp;&nbsp; 22.244730] 5ec0: 00020ee4 dc805f48 000012c7 000000=
00 0b300002 ddc981a4 00000001 00000000<br class=3D"">[&nbsp;&nbsp; 22.25294=
8] 5ee0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000<br class=3D"">[&nbsp;&nbsp; 22.261167] 5f00: 00000000 00000000 000000=
00 00000000 00000000 00000000 dc805f34 00000000<br class=3D"">[&nbsp;&nbsp;=
 22.269387] 5f20: 00000003 00020ee4 0000017b c000fb24 dc804000 00000000 dc8=
05fa4 dc805f48<br class=3D"">[&nbsp;&nbsp; 22.277607] 5f40: c0090a6c c008ea=
c4 e111b000 000268f3 e113810c e1137fb0 e1141594 00000fb4<br class=3D"">[&nb=
sp;&nbsp; 22.285826] 5f60: 00001454 00000000 00000000 00000000 00000024 000=
00025 0000000e 0000000b<br class=3D"">[&nbsp;&nbsp; 22.294045] 5f80: 000000=
09 00000000 00000000 00000000 0002b168 00000000 00000000 dc805fa8<br class=
=3D"">[&nbsp;&nbsp; 22.302264] 5fa0: c000f980 c0090a08 00000000 0002b168 00=
000003 00020ee4 00000000 00040000<br class=3D"">[&nbsp;&nbsp; 22.310483] 5f=
c0: 00000000 0002b168 00000000 0000017b 00000000 0002b168 0002b330 00000000=
<br class=3D"">[&nbsp;&nbsp; 22.318704] 5fe0: beea9a10 beea9a00 00016f84 b6=
e68ed0 60080010 00000003 e1a0c00d e92dd800<br class=3D"">[&nbsp;&nbsp; 22.3=
26914] Backtrace: <br class=3D"">[&nbsp;&nbsp; 22.329467] [&lt;bf1fecf0&gt;=
] (AllocateDeviceID [pvrsrvkm]) from [&lt;bf1fa9d4&gt;] (PVRSRVRegisterBCDe=
viceKM+0x108/0x18c [pvrsrvkm])<br class=3D"">[&nbsp;&nbsp; 22.340617] [&lt;=
bf1fa8cc&gt;] (PVRSRVRegisterBCDeviceKM [pvrsrvkm]) from [&lt;bf23c25c&gt;]=
 (bc_cat_init+0x25c/0x324 [bufferclass_ti])<br class=3D"">[&nbsp;&nbsp; 22.=
351796]&nbsp; r7:bf239f7c r6:bf239c78 r5:bf239f7c r4:00000000<br class=3D""=
>[&nbsp;&nbsp; 22.357535] [&lt;bf23c000&gt;] (bc_cat_init [bufferclass_ti])=
 from [&lt;c000966c&gt;] (do_one_initcall+0x88/0x1e0)<br class=3D"">[&nbsp;=
&nbsp; 22.366882]&nbsp; r10:00000000 r9:bf239e40 r8:dc847f40 r7:bf23c000 r6=
:ddfdd800 r5:c08826a0<br class=3D"">[&nbsp;&nbsp; 22.374785]&nbsp; r4:c0882=
6a0<br class=3D"">[&nbsp;&nbsp; 22.377351] [&lt;c00095e4&gt;] (do_one_initc=
all) from [&lt;c061c2ac&gt;] (do_init_module+0x60/0x1b0)<br class=3D"">[&nb=
sp;&nbsp; 22.385475]&nbsp; r10:00000001 r9:bf239e40 r8:dc847f40 r7:00000001=
 r6:ddfddc80 r5:dc847f48<br class=3D"">[&nbsp;&nbsp; 22.393377]&nbsp; r4:bf=
239e40<br class=3D"">[&nbsp;&nbsp; 22.395937] [&lt;c061c24c&gt;] (do_init_m=
odule) from [&lt;c0090384&gt;] (load_module+0x18cc/0x1e0c)<br class=3D"">[&=
nbsp;&nbsp; 22.403974]&nbsp; r6:bf239e88 r5:dc847f48 r4:dc805f48<br class=
=3D"">[&nbsp;&nbsp; 22.408639] [&lt;c008eab8&gt;] (load_module) from [&lt;c=
0090a6c&gt;] (SyS_finit_module+0x70/0x80)<br class=3D"">[&nbsp;&nbsp; 22.41=
6503]&nbsp; r10:00000000 r9:dc804000 r8:c000fb24 r7:0000017b r6:00020ee4 r5=
:00000003<br class=3D"">[&nbsp;&nbsp; 22.424406]&nbsp; r4:00000000<br class=
=3D"">[&nbsp;&nbsp; 22.426967] [&lt;c00909fc&gt;] (SyS_finit_module) from [=
&lt;c000f980&gt;] (ret_fast_syscall+0x0/0x3c)<br class=3D"">[&nbsp;&nbsp; 2=
2.435179]&nbsp; r6:00000000 r5:0002b168 r4:00000000<br class=3D"">[&nbsp;&n=
bsp; 22.439843] Code: e89da818 e1a0c00d e92dd800 e24cb004 (e5902000) <br cl=
ass=3D"">[&nbsp;&nbsp; 22.452999] ---[ end trace 0d3e29e148f3f02b ]---<br c=
lass=3D"">[&nbsp;&nbsp; 22.556695] Unhandled fault: external abort on non-l=
inefetch (0x1018) at 0xb6f4f014<br class=3D"">[&nbsp;&nbsp; 22.564412] pgd =
=3D dcae8000<br class=3D"">[&nbsp;&nbsp; 22.567127] [b6f4f014] *pgd=3D9cb13=
831, *pte=3D56000303, *ppte=3D56000a33<br class=3D""><br></div></div></body=
></html>

------=_Part_8311291_1610758549.1446233384034--
