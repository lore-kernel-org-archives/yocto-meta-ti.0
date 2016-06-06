Return-Path: <bach@gmx.li>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 160CEE0048B; Mon,  6 Jun 2016 11:13:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	HTML_MESSAGE, MIME_HTML_ONLY,
	RCVD_IN_DNSWL_LOW autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [212.227.15.19 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bach[at]gmx.li)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.7 MIME_HTML_ONLY BODY: Message only has text/html MIME parts
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5D5EE0043B
	for <meta-ti@yoctoproject.org>; Mon,  6 Jun 2016 11:13:50 -0700 (PDT)
Received: from [77.7.131.116] by 3capp-gmx-bs22.server.lan (via HTTP); Mon,
	6 Jun 2016 20:13:48 +0200
MIME-Version: 1.0
Message-ID: <trinity-563a52aa-9417-4ddf-b16c-ed92ea779005-1465236828412@3capp-gmx-bs22>
From: "Holger Bach" <bach@gmx.li>
To: meta-ti@yoctoproject.org
Date: Mon, 6 Jun 2016 20:13:48 +0200
Importance: normal
Sensitivity: Normal
References: <trinity-6a71124c-bbc1-4d16-b3a8-2d08d357bb0a-1465192767005@3capp-gmx-bs20>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K0:bt02HAQolAHdItv4Hd7mpCSdujkEzIMrttYAXOZFqsA
	GlH7wG6h5c8lQsQPhZmwB79ad3SSiPa/5SrQhbHWlhriAM9qMN
	fR4jgYmisve7GsJgfjhn3zWhfWjLK797oAzw1XHkx99ic/RCAa
	jO2hIsf7EFIPFBpkjGKiNQM97wVU10fE5HNcZ6g8tROdxzKVfU
	vkoRydtIAbYdyjbNFRzV+7RJaBSUe0JzQ5tF9IayBbpQzqUMUx
	/5WXVpElyD9ViWjnQYJqCw4dhVdWO6ShXnG++JuZYmpPFsTBMu EdSmzA=
X-UI-Out-Filterresults: notjunk:1;V01:K0:fr36BerHDxU=:lMYAifjxtqzbMRxyp7OOYJ
	65wIbiU6l2w8bzJch0GWZEsFlOvW6KBcxEGkHHHlEswsW+XNAUTIRcEWE4Ql4tXjRarr/a5K8
	5ao/KvUXSLCKeN9EgHDJecG8qot1S1RpwJROmz7/vfwte5kLGQHGAT8fMRtDEAinHvTMoaRID
	RRcUDNUTPPalK7Zi9C/gfMatyqqy61vWrsu3JS0O82lMEnczFrjEEiNFcc/RFMVsDdJm5ET38
	GMwDyHiqk+ksxg7+pUM/wflRT4fIvv5k/KLy0mbBg/odLHwKcQUtmDDT+TjZC7F84kGM0u9Ky
	bNeDsuNy2zrq7Q4NOe5plysxu2EXOQWkszUhrExH/3F6hRCPWuaPvxS9atLZgHvo6WhmdzD8h
	okF1V5Ea5FSr8Mzx5lwf/OxiZtnPfnfktq3d4CrkKF3b6q6vUJ0/UYXgwNn+ShiRYlARfLvyP
	w786rgQv7uhTKOEn12Gcz6sgr0TnqHhCUsLTGtUhB/rVSBTpPxzKoCfc+LLAGOZ4/mU0/yiM9
	rXJeq6br9dlaP/riAma7cY=
Subject: Cannot boot from mmc; dtb-problem?
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
X-List-Received-Date: Mon, 06 Jun 2016 18:13:55 -0000
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>&nbsp;
<div>&nbsp;
<div name="quote" style="margin:10px 5px 5px 10px; padding: 10px 0 10px 10px; border-left:2px solid #C3D9E5; word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">
<div style="margin:0 0 10px 0;"><b>Gesendet:</b>&nbsp;Montag, 06. Juni 2016 um 07:59 Uhr<br/>
<b>Von:</b>&nbsp;&quot;Holger Bach&quot; &lt;bach@gmx.li&gt;<br/>
<b>An:</b>&nbsp;meta-ti@yoctoproject.org, denys@ti.com<br/>
<b>Betreff:</b>&nbsp;Cannot boot from mmc; dtb-problem?</div>

<div name="quoted-content">
<div style="font-family: Verdana;font-size: 12.0px;">
<div>Hello,</div>

<div><br/>
I&#39;m pretty new to yocto and trying to build an image for my beagleboard BB-MB-000 Rev.C4. I am using poky and the meta-ti-layer but i cannot get the rootfs from mmcblk0p2.<br/>
<br/>
A workaround was to boot an old anstrom-demo-image from&nbsp;<a href="https://deref-gmx.net/mail/client/dereferrer/?redirectUrl=http%3A%2F%2Fdownloads.angstro" target="_blank">http://downloads.angstro</a>m-distribution.org/demo/beagleboard/<br/>
<br/>
and flashing the poky-rootfs to nand. Booting from Nand is working, but device fb0 was not found.<br/>
<br/>
Therefore it seems, that the device tree doesn&#39;t fit to the board. I have tried kernel 4.4.7, 4.4.9, 4.4.11 and finally 4.1.18 with the same result. I<br/>
customized nothing, only build an uImage by bitbake and a core-image-sato.<br/>
<br/>
And here comes the output from the boot process with a lot of messages saying that some hardware is disabled:<br/>
<br/>
Starting kernel ...<br/>
&nbsp;<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Booting Linux on physical CPU 0x0<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Initializing cgroup subsys cpuset<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Initializing cgroup subsys cpu<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Initializing cgroup subsys cpuacct<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Linux version 4.1.18-g6b41ca0b94 (holger@thinkdebian) (gcc<br/>
version 5.3.0 (GCC) ) #1 SMP PREEMPT Thu Jun 2 22:40:20 CEST 206<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] CPU: ARMv7 Processor [411fc083] revision 3 (ARMv7), cr=10c5387d<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing<br/>
instruction cache<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Machine model: TI OMAP3 BeagleBoard<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] cma: Reserved 24 MiB at 0x8e000000<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Memory policy: Data cache writeback<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] CPU: All CPU(s) started in SVC mode.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] OMAP3430/3530 ES3.1 (l2cache iva sgx neon isp )<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] PERCPU: Embedded 12 pages/cpu @cfb5c000 s17164 r8192 d23796<br/>
u49152<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Built 1 zonelists in Zone order, mobility grouping on.&nbsp;&nbsp;Total<br/>
pages: 64448<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Kernel command line: console=ttyO2,115200n8 root=/dev/mmcblk0p2<br/>
rootwait rw rootfstype=ext4 mpurate=auto buddy=zippy camer0<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Memory: 222560K/260096K available (6455K kernel code, 498K<br/>
rwdata, 2364K rodata, 376K init, 256K bss, 12960K reserved, 245)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Virtual kernel memory layout:<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vector&nbsp;&nbsp;: 0xffff0000 - 0xffff1000&nbsp;&nbsp;&nbsp;(&nbsp;&nbsp;&nbsp;4 kB)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fixmap&nbsp;&nbsp;: 0xffc00000 - 0xfff00000&nbsp;&nbsp;&nbsp;(3072 kB)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vmalloc : 0xd0800000 - 0xff000000&nbsp;&nbsp;&nbsp;( 744 MB)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lowmem&nbsp;&nbsp;: 0xc0000000 - 0xd0000000&nbsp;&nbsp;&nbsp;( 256 MB)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pkmap&nbsp;&nbsp;&nbsp;: 0xbfe00000 - 0xc0000000&nbsp;&nbsp;&nbsp;(&nbsp;&nbsp;&nbsp;2 MB)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;modules : 0xbf000000 - 0xbfe00000&nbsp;&nbsp;&nbsp;(&nbsp;&nbsp;14 MB)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.text : 0xc0008000 - 0xc08a5064&nbsp;&nbsp;&nbsp;(8821 kB)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.init : 0xc08a6000 - 0xc0904000&nbsp;&nbsp;&nbsp;( 376 kB)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.data : 0xc0904000 - 0xc0980970&nbsp;&nbsp;&nbsp;( 499 kB)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.bss : 0xc0983000 - 0xc09c3030&nbsp;&nbsp;&nbsp;( 257 kB)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Preemptible hierarchical RCU implementation.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000]&nbsp;&nbsp;Additional per-CPU info printed with stalls.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000]&nbsp;&nbsp;RCU restricting CPUs from NR_CPUS=2 to nr_cpu_ids=1.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] NR_IRQS:16 nr_irqs:16 16<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] IRQ: Found an INTC at 0xfa200000 (revision 4.0) with 96<br/>
interrupts<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] Clocking rate (Crystal/Core/MPU): 26.0/332/500 MHz<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] omap_hwmod: mpu: _wait_target_ready failed: -22<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] omap_hwmod: mpu: cannot be enabled for reset (3)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] OMAP clockevent source: timer12 at 32768 Hz<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] clocksource 32k_counter: mask: 0xffffffff max_cycles: 0xffffffff,<br/>
max_idle_ns: 58327039986419 ns<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000000] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps every<br/>
65535999984741ns<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000030] OMAP clocksource: 32k_counter at 32768 Hz<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000335] Console: colour dummy device 80x30<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000366] WARNING: Your &#39;console=ttyO2&#39; has been replaced by &#39;ttyS2&#39;<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000396] This ensures that you still see kernel messages. Please<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000396] update your kernel commandline.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.000427] Calibrating delay loop... 496.43 BogoMIPS (lpj=2482176)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.048370] pid_max: default: 32768 minimum: 301<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.048583] Security Framework initialized<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.048706] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.048706] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.050109] Initializing cgroup subsys blkio<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.050170] Initializing cgroup subsys memory<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.050231] Initializing cgroup subsys devices<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.050262] Initializing cgroup subsys freezer<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.050323] Initializing cgroup subsys perf_event<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.050354] CPU: Testing write buffer coherency: ok<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.051025] CPU0: thread -1, cpu 0, socket -1, mpidr 0<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.051177] Setting up static identity map for 0x80008280 - 0x800082f0<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.089263] Brought up 1 CPUs<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.089294] SMP: Total of 1 processors activated (496.43 BogoMIPS).<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.089324] CPU: All CPU(s) started in SVC mode.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.090515] devtmpfs: initialized<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.148559] VFP support v0.3: implementor 41 architecture 3 part 30 variant c<br/>
rev 1<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.188323] omap_hwmod: mcbsp2_sidetone using broken dt data from mcbsp<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.189453] omap_hwmod: mcbsp3_sidetone using broken dt data from mcbsp<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.217529] omap_hwmod: mpu: _wait_target_ready failed: -22<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.217559] omap_hwmod: mpu: cannot be enabled for reset (3)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.271850] clocksource jiffies: mask: 0xffffffff max_cycles: 0xffffffff,<br/>
max_idle_ns: 19112604462750000 ns<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.274993] pinctrl core: initialized pinctrl subsystem<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.277526] NET: Registered protocol family 16<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.283355] DMA: preallocated 256 KiB pool for atomic coherent allocations<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.308044] cpuidle: using governor ladder<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.338165] cpuidle: using governor menu<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.352600] Reprogramming SDRC clock to 332000000 Hz<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.362426] omap_gpio 48310000.gpio: could not find pctldev for node /ocp/l4@<br/>
48000000/scm@2000/pinmux@a00/pinmux_gpio1_pins, deferringe<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.364471] OMAP GPIO hardware version 2.5<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.375061] irq: no irq domain found for /ocp/l4@48000000/scm@2000/pinmux@30<br/>
!<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.395874] omap-gpmc 6e000000.gpmc: GPMC revision 5.0<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.395904] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.407012] No ATAGs?<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.407073] hw-breakpoint: debug architecture 0x4 unsupported.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.408935] omap4_sram_init:Unable to allocate sram needed to handle errata<br/>
I688<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.408996] omap4_sram_init:Unable to get sram pool needed to handle errata<br/>
I688<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.410003] OMAP DMA hardware revision 4.0<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.464447] omap-dma-engine 48056000.dma-controller: OMAP DMA engine driver<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.472625] omap-iommu 480bd400.mmu: 480bd400.mmu registered<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.473510] vgaarb: loaded<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.474487] SCSI subsystem initialized<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.478179] omap_i2c 48070000.i2c: bus 0 rev3.3 at 2600 kHz<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.479461] omap_i2c 48072000.i2c: bus 1 rev3.3 at 100 kHz<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.480590] omap_i2c 48060000.i2c: bus 2 rev3.3 at 100 kHz<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.481140] media: Linux media interface: v0.10<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.481292] Linux video capture interface: v2.00<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.481445] pps_core: LinuxPPS API ver. 1 registered<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.481445] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo<br/>
Giometti &lt;giometti@linux.it&gt;<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.481536] PTP clock support registered<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.483062] omap-mailbox 48094000.mailbox: omap mailbox rev 0x40<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.483642] Advanced Linux Sound Architecture Driver Initialized.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.485656] Switched to clocksource 32k_counter<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.513519] NET: Registered protocol family 2<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.515014] TCP established hash table entries: 2048 (order: 1, 8192 bytes)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.515075] TCP bind hash table entries: 2048 (order: 2, 16384 bytes)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.515167] TCP: Hash tables configured (established 2048 bind 2048)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.515319] UDP hash table entries: 256 (order: 1, 8192 bytes)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.515380] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.515747] NET: Registered protocol family 1<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.516662] RPC: Registered named UNIX socket transport module.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.516693] RPC: Registered udp transport module.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.516723] RPC: Registered tcp transport module.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.516723] RPC: Registered tcp NFSv4.1 backchannel transport module.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.520629] CPU PMU: Failed to parse /pmu/interrupt-affinity[0]<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.520782] hw perfevents: enabled with armv7_cortex_a8 PMU driver, 5<br/>
counters available<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.527404] futex hash table entries: 256 (order: 2, 16384 bytes)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.527587] audit: initializing netlink subsys (disabled)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.527709] audit: type=2000 audit(0.520:1): initialized<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.546203] VFS: Disk quotas dquot_6.6.0<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.546691] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.552490] NFS: Registering the id_resolver key type<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.552612] Key type id_resolver registered<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.552642] Key type id_legacy registered<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.552795] jffs2: version 2.2. (NAND) (SUMMARY)&nbsp;&nbsp;&#65533;&copy; 2001-2006 Red Hat, Inc.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.557373] NET: Registered protocol family 38<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.557495] io scheduler noop registered<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.557525] io scheduler deadline registered<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.557647] io scheduler cfq registered (default)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.560546] pinctrl-single 48002030.pinmux: 284 pins at pa fa002030 size 568<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.561035] pinctrl-single 48002a00.pinmux: 46 pins at pa fa002a00 size 92<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.562072] pinctrl-single 480025d8.pinmux: 18 pins at pa fa0025d8 size 36<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.569366] 48050000.dss supply vdda_video not found, using dummy regulator<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.569641] OMAP DSS rev 2.0<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.570129] omapdss_dss 48050000.dss: bound 48050400.dispc (ops<br/>
dispc_component_ops)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.570526] omapdss_dss 48050000.dss: bound 48050c00.encoder (ops<br/>
venc_component_ops)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.577697] Serial: 8250/16550 driver, 10 ports, IRQ sharing enabled<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.586608] 4806a000.serial: ttyS0 at MMIO 0x4806a000 (irq = 88, base_baud =<br/>
3000000) is a 8250<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.588592] 4806c000.serial: ttyS1 at MMIO 0x4806c000 (irq = 89, base_baud =<br/>
3000000) is a 8250<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.590637] console [ttyS2] disabled<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;0.590759] 49020000.serial: ttyS2 at MMIO 0x49020000 (irq = 90, base_baud =<br/>
3000000) is a 8250<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.423004] console [ttyS2] enabled<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.428924] [drm] Initialized drm 1.1.0 20060810<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.461090] brd: module loaded<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.477691] loop: module loaded<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.488281] twl 0-0048: PIH (irq 23) chaining IRQs 309..317<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.494079] twl 0-0048: power (irq 314) chaining IRQs 317..324<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.538513] twl4030_gpio twl4030-gpio: gpio (irq 309) chaining IRQs 325..342<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.554199] mtdoops: mtd device (mtddev=name/number) must be supplied<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.563110] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xba<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.569580] nand: Micron MT29F2G16ABD<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.573303] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB<br/>
size: 64<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.580963] nand: using OMAP_ECC_HAM1_CODE_HW<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.585418] 5 ofpart partitions found on MTD device 30000000.nand<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.591613] Creating 5 MTD partitions on &quot;30000000.nand&quot;:<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.597106] 0x000000000000-0x000000080000 : &quot;X-Loader&quot;<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.605224] 0x000000080000-0x000000260000 : &quot;U-Boot&quot;<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.614135] 0x000000260000-0x000000280000 : &quot;U-Boot Env&quot;<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.621887] 0x000000280000-0x000000680000 : &quot;Kernel&quot;<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.632598] 0x000000680000-0x000010000000 : &quot;Filesystem&quot;<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.864410] mousedev: PS/2 mouse device common for all mice<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.870269] i2c /dev entries driver<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.879669] omap_hsmmc 4809c000.mmc: failed to set clock to 52000000<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.886352] omap_hsmmc: probe of 4809c000.mmc failed with error -22<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.893524] ledtrig-cpu: registered to indicate activity on CPUs<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.905700] oprofile: using arm/armv7<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.910217] Initializing XFRM netlink socket<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.914611] NET: Registered protocol family 17<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.919342] NET: Registered protocol family 15<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.924072] Key type dns_resolver registered<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.928894] omap2_set_init_voltage: unable to find boot up OPP for<br/>
vdd_mpu_iva<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.936248] omap2_set_init_voltage: unable to set vdd_mpu_iva<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.942047] omap2_set_init_voltage: unable to find boot up OPP for vdd_core<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.949096] omap2_set_init_voltage: unable to set vdd_core<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.956695] cpu cpu0: of_pm_voltdm_notifier_register: Fail calculating<br/>
voltage latency[975000&lt;-&gt;1350000]:-22<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.967468] cpu cpu0: of_pm_voltdm_notifier_register: Fail calculating<br/>
voltage latency[975000&lt;-&gt;1350000]:-22<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.980285] ThumbEE CPU extension supported.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.984619] Registering SWP/SWPB emulation handler<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;1.989654] SmartReflex Class3 initialized<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.004669] hctosys: unable to open rtc device (rtc0)<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.010070] sr_init: No PMIC hook to init smartreflex<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.015594] smartreflex smartreflex.0: omap_sr_probe: SmartReflex driver<br/>
initialized<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.024353] smartreflex smartreflex.1: omap_sr_probe: SmartReflex driver<br/>
initialized<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.057983] hsusb2_vbus: disabling<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.061920] VUSB3V1: disabling<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.065429] VUSB1V8: disabling<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.069030] VUSB1V5: disabling<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.072692] VMMC1: disabling<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.076080] VDAC: disabling<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.079498] VAUX3: disabling<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.082855] pbias_mmc_omap2430: disabling<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.087341] ALSA device list:<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.090332]&nbsp;&nbsp;&nbsp;No soundcards found.<br/>
[&nbsp;&nbsp;&nbsp;&nbsp;2.096069] Waiting for root device /dev/mmcblk0p2...<br/>
[&nbsp;&nbsp;133.656372] random: nonblocking pool is initialized<br/>
<br/>
Do you have a clue what I&#39;m doing wrong? Or is it really a bug?<br/>
<br/>
Thanks.<br/>
<br/>
Holger Bach<span>&nbsp;</span></div>
</div>
</div>
</div>
</div>
</div></div></body></html>

