Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CAFC04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 21:14:24 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.740.1715721262618450459
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 May 2024 14:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YewUXjzX;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: joel.winarske@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f666caf9abso1319361b3a.1
        for <meta-ti@lists.yoctoproject.org>; Tue, 14 May 2024 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715721262; x=1716326062; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9j58oyrXpFLb4l+9rIboLXJY620APcHoUlSCPEz05Nc=;
        b=YewUXjzXThrzIKgsul6SLBHUqs2G6Hi3gdf7su625hFJ2P/7lc483mABSm6k3Iospu
         uu40vAICDnbxkwelx+Z9Y9JiTRXG4UmgzwWGonRaO8G2KHorZKoVBCVCgzN5T6VXAsgF
         upViG94OAphymNtZwgyj5KxsN5HbIu3S26IUs4pIW+1A91mVyptizf0udrSAx2hLol0y
         ydR+6RPlSOzUdEuz5mRTu4IW+mHcmFcVruPuOHxQuTxAE0DNf0sK5TGoFWgWWUQxvGAe
         8+b+TnGx63J3ZVPSXMWAYbr8AmzrrBuKWpCciSoQ95p3VuK+FX8zNTQUdIRdq6C5MVYy
         FGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715721262; x=1716326062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9j58oyrXpFLb4l+9rIboLXJY620APcHoUlSCPEz05Nc=;
        b=WNBrP0H/PKuBoFn+D5XOdp8mHeSjp+gaV2AP/FkGlMPtuL6fzXSWPqci3mFLJLDKJ5
         SuiN1Rs7TKtIwUuwe7799lZCB3+Nb2fNf2SsTxnyH5hjLKYzQdN5KMX+SPqYrEyv8yAi
         QfsyGOpurqkS7C5hnWZVBYUHZmqyyyofNONc4iSWAbL3seADzjwt5SGoEfIcTBci1jrA
         kZujx0YET+W/+PeVhxeA+IO0SxmwTiNjc2RI6NOKG9VLthykKMxraFLH7RYcxZR/dq8U
         W9noXop4pcFTGdZl3d38W/CI7ZwbNU8tXnp085oxp6i1oumypPPt2duEuQNONoA39TA9
         lIHA==
X-Gm-Message-State: AOJu0YzxzIkpab30p58ZDDyMrQMlUwxiUc3ten7od9riQTMqugKPMJG8
	Ev9qlE8T2/pLMg8aKMp+XeVJDLLvtpHkr2GW21fq620h5xRWM5s3lCnbq+c2BjqS0+ENP5SJ6mf
	0ySxqCQmSNr8oEliclt/f411aIlxBgQ==
X-Google-Smtp-Source: AGHT+IFLCLzmIKnQ0IHPluMir40H8MK3O9C/l1VPU+Ojoe0ysFCEsWYZzwg1YqMbjg8Knwbx7f4cV1b3K70JDE9qsnU=
X-Received: by 2002:a05:6a20:734c:b0:1af:a37e:367e with SMTP id
 adf61e73a8af0-1afde0af60emr14554109637.15.1715721261680; Tue, 14 May 2024
 14:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <CABKMkPJ8grzYqQv22xU4pEKSxhoxx0voSSt_KzGT-13xyDQN0A@mail.gmail.com>
 <20240514205531.GI21287@denix.org>
In-Reply-To: <20240514205531.GI21287@denix.org>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Tue, 14 May 2024 14:14:10 -0700
Message-ID: <CABKMkPJGMaxrdPno0xSzRLnf_awLYf6+4kAuG0eQ5CXkiqJZsQ@mail.gmail.com>
Subject: Re: [meta-ti] beagle bone black - scarthgap
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005611b10618707c6c"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 May 2024 21:14:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17658

--0000000000005611b10618707c6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah right.  Booting with S2 pressed booted the scarthgap bits.  Thanks for
the help!

On Tue, May 14, 2024 at 1:55=E2=80=AFPM Denys Dmytriyenko <denis@denix.org>=
 wrote:

> 1. U-boot and SPL seem to be old from Dunfell
>
> 2. Check your env:
>
> > append: root=3DPARTUUID=3D rootwait rw earlycon console=3DttyO0,115200n=
8,115200
> ...
> > [    3.961253] VFS: PARTUUID=3D is invalid.
> > [    3.961253] Expected PARTUUID=3D<valid-uuid-id>[/PARTNROFF=3D%d]
> > [    3.970800] Disabling rootwait; root=3D is invalid.
> > [    3.977324] /dev/root: Can't open blockdev
> > [    3.981716] VFS: Cannot open root device "PARTUUID=3D" or
> > unknown-block(0,0): error -6
> > [    3.989649] Please append a correct "root=3D" boot option; here are =
the
>
> --
> Denys
>
>
> On Tue, May 14, 2024 at 01:24:37PM -0700, Joel Winarske wrote:
> > What's the status of bbb on scarthgap?
> >
> > Three weeks or so ago it would boot, only SGX driver was not loading.
> >
> > Today I get a kernel panic.  Last week Scott Murray was saying to set
> > kernel preference to 6.1, which appears to be the default now.
> >
> > I would appreciate any assistance with this.
> >
> >
> > U-Boot SPL 2019.04-00002-g31a8ae0206 (May 13 2020 - 09:26:17 -0500)
> > Trying to boot from MMC2
> > Loading Environment from EXT4...
> > ** Unable to use mmc 0:1 for loading the env **
> >
> >
> > U-Boot 2019.04-00002-g31a8ae0206 (May 13 2020 - 09:26:17 -0500), Build:
> > jenkins-github_Bootloader-Builder-139
> >
> > CPU  : AM335X-GP rev 2.1
> > I2C:   ready
> > DRAM:  512 MiB
> > No match for driver 'omap_hsmmc'
> > No match for driver 'omap_hsmmc'
> > Some drivers were not found
> > Reset Source: Power-on reset has occurred.
> > RTC 32KCLK Source: External.
> > MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
> > Loading Environment from EXT4...
> > ** Unable to use mmc 0:1 for loading the env **
> > Board: BeagleBone Black
> > <ethaddr> not set. Validating first E-fuse MAC
> > BeagleBone Black:
> > BeagleBone: cape eeprom: i2c_probe: 0x54:
> > BeagleBone: cape eeprom: i2c_probe: 0x55:
> > BeagleBone: cape eeprom: i2c_probe: 0x56:
> > BeagleBone: cape eeprom: i2c_probe: 0x57:
> > Net:   eth0: MII MODE
> > cpsw, usb_ether
> > Press SPACE to abort autoboot in 0 seconds
> > board_name=3D[A335BNLT] ...
> > board_rev=3D[00C0] ...
> > switch to partitions #0, OK
> > mmc0 is current device
> > SD/MMC found on device 0
> > switch to partitions #0, OK
> > mmc0 is current device
> > Scanning mmc 0:1...
> > Found /extlinux/extlinux.conf
> > Retrieving file: /extlinux/extlinux.conf
> > 218 bytes read in 6 ms (35.2 KiB/s)
> > 1:      Poky (Yocto Project Reference Distro)
> > Retrieving file: /extlinux/../zImage
> > 12653056 bytes read in 800 ms (15.1 MiB/s)
> > append: root=3DPARTUUID=3D rootwait rw earlycon console=3DttyO0,115200n=
8,115200
> > Retrieving file: /extlinux/../am335x-boneblack.dtb
> > 99078 bytes read in 13 ms (7.3 MiB/s)
> > ## Flattened Device Tree blob at 88000000
> >    Booting using the fdt blob at 0x88000000
> >    Loading Device Tree to 8ffe4000, end 8ffff305 ... OK
> >
> > Starting kernel ...
> >
> > [    0.000000] Booting Linux on physical CPU 0x0
> > [    0.000000] Linux version 6.1.69-ti (oe-user@oe-host)
> > (arm-poky-linux-gnueabi-gcc (GCC) 13.2.0, GNU ld (GNU Binutils)
> > 2.42.0.20240216) #1 SMP PREEMPT Mon Jan 29 18:204
> > [    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7),
> > cr=3D10c5387d
> > [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
> > instruction cache
> > [    0.000000] OF: fdt: Machine model: TI AM335x BeagleBone Black
> > [    0.000000] earlycon: omap8250 at MMIO 0x44e09000 (options '')
> > [    0.000000] printk: bootconsole [omap8250] enabled
> > [    0.000000] Memory policy: Data cache writeback
> > [    0.000000] efi: UEFI not found.
> > [    0.000000] cma: Reserved 48 MiB at 0x9c800000
> > [    0.000000] Zone ranges:
> > [    0.000000]   Normal   [mem 0x0000000080000000-0x000000009fdfffff]
> > [    0.000000]   HighMem  empty
> > [    0.000000] Movable zone start for each node
> > [    0.000000] Early memory node ranges
> > [    0.000000]   node   0: [mem 0x0000000080000000-0x000000009fdfffff]
> > [    0.000000] Initmem setup node 0 [mem
> > 0x0000000080000000-0x000000009fdfffff]
> > [    0.000000] CPU: All CPU(s) started in SVC mode.
> > [    0.000000] AM335X ES2.1 (sgx neon)
> > [    0.000000] percpu: Embedded 18 pages/cpu s41428 r8192 d24108 u73728
> > [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
> 129412
> > [    0.000000] Kernel command line: root=3DPARTUUID=3D rootwait rw earl=
ycon
> > console=3DttyO0,115200n8,115200
> > [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144
> > bytes, linear)
> > [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072
> > bytes, linear)
> > [    0.000000] mem auto-init: stack:all(zero), heap alloc:on, heap
> free:off
> > [    0.000000] Memory: 442892K/522240K available (16384K kernel code,
> 1686K
> > rwdata, 4440K rodata, 1024K init, 455K bss, 30196K reserved, 49152K
> > cma-reserved, 0K highmem)
> > [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D=
1, Nodes=3D1
> > [    0.000000] ftrace: allocating 50610 entries in 149 pages
> > [    0.000000] ftrace: allocated 149 pages with 4 groups
> > [    0.000000] trace event string verifier disabled
> > [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> > [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D2 to
> nr_cpu_ids=3D1.
> > [    0.000000]  Trampoline variant of Tasks RCU enabled.
> > [    0.000000]  Rude variant of Tasks RCU enabled.
> > [    0.000000]  Tracing variant of Tasks RCU enabled.
> > [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay =
is
> > 25 jiffies.
> > [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,
> nr_cpu_ids=3D1
> > [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
> > [    0.000000] IRQ: Found an INTC at 0x(ptrval) (revision 5.0) with 128
> > interrupts
> > [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on
> > contention.
> > [    0.000000] TI gptimer clocksource: always-on
> /ocp/interconnect@44c00000
> > /segment@200000/target-module@31000
> > [    0.000002] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps
> every
> > 89478484971ns
> > [    0.008068] clocksource: dmtimer: mask: 0xffffffff max_cycles:
> > 0xffffffff, max_idle_ns: 79635851949 ns
> > [    0.018002] TI gptimer clockevent: 24000000 Hz at
> > /ocp/interconnect@48000000/segment@0/target-module@40000
> > [    0.029329] Console: colour dummy device 80x30
> > [    0.034029] WARNING: Your 'console=3DttyO0' has been replaced by 'tt=
yS0'
> > [    0.040765] This ensures that you still see kernel messages. Please
> > [    0.047223] update your kernel commandline.
> > [    0.051587] Calibrating delay loop... 995.32 BogoMIPS (lpj=3D1990656=
)
> > [    0.074478] CPU: Testing write buffer coherency: ok
> > [    0.079591] CPU0: Spectre v2: using BPIALL workaround
> > [    0.084801] pid_max: default: 32768 minimum: 301
> > [    0.090028] LSM: Security Framework initializing
> > [    0.094923] landlock: Up and running.
> > [    0.098710] Yama: becoming mindful.
> > [    0.102614] AppArmor: AppArmor initialized
> > [    0.106865] TOMOYO Linux initialized
> > [    0.110599] LSM support for eBPF active
> > [    0.114831] Mount-cache hash table entries: 1024 (order: 0, 4096
> bytes,
> > linear)
> > [    0.122385] Mountpoint-cache hash table entries: 1024 (order: 0, 409=
6
> > bytes, linear)
> > [    0.134142] cblist_init_generic: Setting adjustable number of callba=
ck
> > queues.
> > [    0.141692] cblist_init_generic: Setting shift to 0 and lim to 1.
> > [    0.148206] cblist_init_generic: Setting adjustable number of callba=
ck
> > queues.
> > [    0.155687] cblist_init_generic: Setting shift to 0 and lim to 1.
> > [    0.162178] cblist_init_generic: Setting adjustable number of callba=
ck
> > queues.
> > [    0.169653] cblist_init_generic: Setting shift to 0 and lim to 1.
> > [    0.176195] Setting up static identity map for 0x80100000 - 0x801000=
60
> > [    0.183196] rcu: Hierarchical SRCU implementation.
> > [    0.188174] rcu:     Max phase no-delay instances is 1000.
> > [    0.195209] EFI services will not be available.
> > [    0.200736] smp: Bringing up secondary CPUs ...
> > [    0.205481] smp: Brought up 1 node, 1 CPU
> > [    0.209628] SMP: Total of 1 processors activated (995.32 BogoMIPS).
> > [    0.216099] CPU: All CPU(s) started in SVC mode.
> > [    0.221891] devtmpfs: initialized
> > [    0.248887] VFP support v0.3: implementor 41 architecture 3 part 30
> > variant c rev 3
> > [    0.257438] clocksource: jiffies: mask: 0xffffffff max_cycles:
> > 0xffffffff, max_idle_ns: 7645041785100000 ns
> > [    0.267544] futex hash table entries: 256 (order: 2, 16384 bytes,
> linear)
> > [    0.279749] pinctrl core: initialized pinctrl subsystem
> > [    0.286562] DMI not present or invalid.
> > [    0.291573] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> > [    0.306527] DMA: preallocated 256 KiB pool for atomic coherent
> > allocations
> > [    0.314286] audit: initializing netlink subsys (disabled)
> > [    0.321360] thermal_sys: Registered thermal governor 'fair_share'
> > [    0.321384] thermal_sys: Registered thermal governor 'bang_bang'
> > [    0.327762] audit: type=3D2000 audit(0.232:1): state=3Dinitialized
> > audit_enabled=3D0 res=3D1
> > [    0.341952] thermal_sys: Registered thermal governor 'step_wise'
> > [    0.341961] thermal_sys: Registered thermal governor 'user_space'
> > [    0.348159] thermal_sys: Registered thermal governor 'power_allocato=
r'
> > [    0.354588] cpuidle: using governor ladder
> > [    0.365590] cpuidle: using governor menu
> > [    0.392937] hw-breakpoint: debug architecture 0x4 unsupported.
> > [    0.413611] kprobes: kprobe jump-optimization is enabled. All kprobe=
s
> > are optimized if possible.
> > [    0.441354] raid6: skipped pq benchmark and selected neonx8
> > [    0.452017] raid6: using neon recovery algorithm
> > [    0.468087] iommu: Default domain type: Translated
> > [    0.473185] iommu: DMA domain TLB invalidation policy: strict mode
> > [    0.489780] SCSI subsystem initialized
> > [    0.501001] usbcore: registered new interface driver usbfs
> > [    0.512146] usbcore: registered new interface driver hub
> > [    0.524089] usbcore: registered new device driver usb
> > [    0.536781] pps_core: LinuxPPS API ver. 1 registered
> > [    0.548015] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
> Rodolfo
> > Giometti <giometti@linux.it>
> > [    0.564043] PTP clock support registered
> > [    0.577552] NetLabel: Initializing
> > [    0.588018] NetLabel:  domain hash size =3D 128
> > [    0.592525] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
> > [    0.604158] NetLabel:  unlabeled traffic allowed by default
> > [    0.620692] clocksource: Switched to clocksource dmtimer
> > [    0.634086] VFS: Disk quotas dquot_6.6.0
> > [    0.644882] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096
> > bytes)
> > [    0.656972] FS-Cache: Loaded
> > [    0.664821] CacheFiles: Loaded
> > [    0.673204] AppArmor: AppArmor Filesystem Enabled
> > [    0.704059] NET: Registered PF_INET protocol family
> > [    0.717040] IP idents hash table entries: 8192 (order: 4, 65536 byte=
s,
> > linear)
> > [    0.734482] tcp_listen_portaddr_hash hash table entries: 512 (order:
> 0,
> > 4096 bytes, linear)
> > [    0.752899] Table-perturb hash table entries: 65536 (order: 6, 26214=
4
> > bytes, linear)
> > [    0.768718] TCP established hash table entries: 4096 (order: 2, 1638=
4
> > bytes, linear)
> > [    0.784765] TCP bind hash table entries: 4096 (order: 4, 65536 bytes=
,
> > linear)
> > [    0.800775] TCP: Hash tables configured (established 4096 bind 4096)
> > [    0.813054] MPTCP token hash table entries: 512 (order: 1, 8192 byte=
s,
> > linear)
> > [    0.828795] UDP hash table entries: 256 (order: 1, 8192 bytes, linea=
r)
> > [    0.844723] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes,
> > linear)
> > [    0.857230] NET: Registered PF_UNIX/PF_LOCAL protocol family
> > [    0.873449] RPC: Registered named UNIX socket transport module.
> > [    0.884695] RPC: Registered udp transport module.
> > [    0.892688] RPC: Registered tcp transport module.
> > [    0.904698] RPC: Registered tcp NFSv4.1 backchannel transport module=
.
> > [    0.916707] NET: Registered PF_XDP protocol family
> > [    2.057584] Initialise system trusted keyrings
> > [    2.064353] workingset: timestamp_bits=3D14 max_order=3D17 bucket_or=
der=3D3
> > [    2.081692] zbud: loaded
> > [    2.089227] NFS: Registering the id_resolver key type
> > [    2.094600] Key type id_resolver registered
> > [    2.098937] Key type id_legacy registered
> > [    2.103293] nfs4filelayout_init: NFSv4 File Layout Driver
> Registering...
> > [    2.110222] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
> > Registering...
> > [    2.117932] jffs2: version 2.2. (NAND) (SUMMARY)  =C2=A9 2001-2006 R=
ed Hat,
> > Inc.
> > [    2.126320] fuse: init (API version 7.37)
> > [    2.223398] NET: Registered PF_ALG protocol family
> > [    2.228520] xor: measuring software checksum speed
> > [    2.241238]    arm4regs        :  1270 MB/sec
> > [    2.254710]    8regs           :  1099 MB/sec
> > [    2.268180]    32regs          :  1099 MB/sec
> > [    2.278200]    neon            :  1783 MB/sec
> > [    2.282696] xor: using function: neon (1783 MB/sec)
> > [    2.287741] Key type asymmetric registered
> > [    2.291976] Asymmetric key parser 'x509' registered
> > [    2.299642] alg: self-tests for CTR-KDF (hmac(sha256)) passed
> > [    2.306168] Block layer SCSI generic (bsg) driver version 0.4 loaded
> > (major 244)
> > [    2.314270] io scheduler mq-deadline registered
> > [    2.326615] Serial: 8250/16550 driver, 6 ports, IRQ sharing disabled
> > [    2.354956] loop: module loaded
> > [    2.358858] SPI driver tps6594 has no spi_device_id for ti,tps6594-q=
1
> > [    2.365541] SPI driver tps6594 has no spi_device_id for ti,tps6593-q=
1
> > [    2.372185] SPI driver tps6594 has no spi_device_id for ti,lp8764-q1
> > [    2.383380] usbcore: registered new interface driver smsc95xx
> > [    2.393632] i2c_dev: i2c /dev entries driver
> > [    2.398311] Driver for 1-wire Dallas network protocol.
> > [    2.405002] softdog: initialized. soft_noboot=3D0 soft_margin=3D60 s=
ec
> > soft_panic=3D0 (nowayout=3D0)
> > [    2.413734] softdog:              soft_reboot_cmd=3D<not set>
> > soft_active_on_boot=3D0
> > [    2.422541] cpuidle: enable-method property 'ti,am3352' found
> operations
> > [    2.430352] sdhci: Secure Digital Host Controller Interface driver
> > [    2.436776] sdhci: Copyright(c) Pierre Ossman
> > [    2.441277] sdhci-pltfm: SDHCI platform and OF driver helper
> > [    2.447615] ledtrig-cpu: registered to indicate activity on CPUs
> > [    2.454533] hid: raw HID events driver (C) Jiri Kosina
> > [    2.460601] usbcore: registered new interface driver usbhid
> > [    2.466401] usbhid: USB HID core driver
> > [    2.472766] NET: Registered PF_INET6 protocol family
> > [    2.482755] Segment Routing with IPv6
> > [    2.486926] In-situ OAM (IOAM) with IPv6
> > [    2.491263] mip6: Mobile IPv6
> > [    2.494566] NET: Registered PF_PACKET protocol family
> > [    2.500227] Key type dns_resolver registered
> > [    2.504771] mpls_gso: MPLS GSO support
> > [    2.508856] ThumbEE CPU extension supported.
> > [    2.513298] Registering SWP/SWPB emulation handler
> > [    2.518251] omap_voltage_late_init: Voltage driver support not added
> > [    2.526359] registered taskstats version 1
> > [    2.530792] Loading compiled-in X.509 certificates
> > [    2.536739] zswap: loaded using pool lzo/zbud
> > [    2.542631] Key type .fscrypt registered
> > [    2.546840] Key type fscrypt-provisioning registered
> > [    2.561788] Btrfs loaded, crc32c=3Dcrc32c-generic, zoned=3Dyes,
> fsverity=3Dyes
> > [    2.571469] Key type encrypted registered
> > [    2.575883] AppArmor: AppArmor sha1 policy hashing enabled
> > [    2.581759] ima: No TPM chip found, activating TPM-bypass!
> > [    2.587664] ima: Allocated hash algorithm: sha256
> > [    2.592803] ima: No architecture policies found
> > [    2.597661] evm: Initialising EVM extended attributes:
> > [    2.602985] evm: security.selinux
> > [    2.606412] evm: security.SMACK64 (disabled)
> > [    2.610825] evm: security.SMACK64EXEC (disabled)
> > [    2.615587] evm: security.SMACK64TRANSMUTE (disabled)
> > [    2.620799] evm: security.SMACK64MMAP (disabled)
> > [    2.625560] evm: security.apparmor
> > [    2.629071] evm: security.ima
> > [    2.632121] evm: security.capability
> > [    2.635810] evm: HMAC attrs: 0x1
> > [    2.683301] remoteproc remoteproc0: wkup_m3 is available
> > [    2.702524] pinctrl-single 44e10800.pinmux: 142 pins, size 568
> > [    2.715024] ti-sysc: probe of 44e31000.target-module failed with err=
or
> > -16
> > [    2.726119] omap_wdt: OMAP Watchdog Timer Rev 0x01: initial timeout =
60
> > sec
> > [    2.737737] omap_rtc 44e3e000.rtc: registered as rtc0
> > [    2.743061] omap_rtc 44e3e000.rtc: setting system clock to
> > 2000-01-01T00:00:00 UTC (946684800)
> > [    2.763281] ti-sysc: probe of 48040000.target-module failed with err=
or
> > -16
> > [    2.785171] gpio gpiochip0: (gpio-0-31): not an immutable chip, plea=
se
> > consider fixing it!
> > [    2.794444] OMAP GPIO hardware version 0.1
> > [    2.805375] omap-mailbox 480c8000.mailbox: omap mailbox rev 0x400
> > [    2.818643] at24 2-0054: supply vcc not found, using dummy regulator
> > [    2.856849] at24 2-0055: supply vcc not found, using dummy regulator
> > [    2.892531] at24 2-0056: supply vcc not found, using dummy regulator
> > [    2.928560] at24 2-0057: supply vcc not found, using dummy regulator
> > [    2.964125] omap_i2c 4819c000.i2c: bus 2 rev0.11 at 100 kHz
> > [    2.975562] gpio gpiochip1: (gpio-32-63): not an immutable chip,
> please
> > consider fixing it!
> > [    2.987140] gpio gpiochip2: (gpio-64-95): not an immutable chip,
> please
> > consider fixing it!
> > [    3.001969] sdhci-omap 481d8000.mmc: supply pbias not found, using
> dummy
> > regulator
> > [    3.018359] sdhci-omap 481d8000.mmc: supply vqmmc not found, using
> dummy
> > regulator
> > [    3.028511] omap_rng 48310000.rng: Random Number Generator ver. 20
> > [    3.035855] random: crng init done
> > [    3.092730] davinci_mdio 4a101000.mdio: davinci mdio revision 1.6, b=
us
> > freq 1000000
> > [    3.126125] SMSC LAN8710/LAN8720: probe of 4a101000.mdio:00 failed
> with
> > error -5
> > [    3.133894] davinci_mdio 4a101000.mdio: phy[0]: device
> 4a101000.mdio:00,
> > driver SMSC LAN8710/LAN8720
> > [    3.144040] cpsw-switch 4a100000.switch: initialized cpsw ale versio=
n
> 1.4
> > [    3.151110] cpsw-switch 4a100000.switch: ALE Table size 1024
> > [    3.157084] cpsw-switch 4a100000.switch: cpts: overflow check period
> > 1250 (jiffies)
> > [    3.165001] cpsw-switch 4a100000.switch: CPTS: ref_clk_freq:25000000=
0
> > calc_mult:2147483648 calc_shift:29 error:0 nsec/sec
> > [    3.176410] cpsw-switch 4a100000.switch: Detected MACID =3D
> > 68:5e:1c:03:07:bf
> > [    3.185575] cpsw-switch 4a100000.switch: initialized (regs 0x4a10000=
0,
> > pool size 256) hw_ver:0019010C 1.12 (0)
> > [    3.210379] debugfs: Directory '49000000.dma' with parent 'dmaengine=
'
> > already present!
> > [    3.218638] edma 49000000.dma: TI EDMA DMA engine driver
> > [    3.230547] am335x-phy-driver 47401300.usb-phy: supply vcc not found=
,
> > using dummy regulator
> > [    3.239674] am335x-phy-driver 47401300.usb-phy: dummy supplies not
> > allowed for exclusive requests
> > [    3.255611] am335x-phy-driver 47401b00.usb-phy: supply vcc not found=
,
> > using dummy regulator
> > [    3.264906] am335x-phy-driver 47401b00.usb-phy: dummy supplies not
> > allowed for exclusive requests
> > [    3.288119] musb-hdrc musb-hdrc.1: MUSB HDRC host driver
> > [    3.293805] musb-hdrc musb-hdrc.1: new USB bus registered, assigned
> bus
> > number 1
> > [    3.301785] usb usb1: New USB device found, idVendor=3D1d6b,
> > idProduct=3D0002, bcdDevice=3D 6.01
> > [    3.310336] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
> > SerialNumber=3D1
> > [    3.317791] usb usb1: Product: MUSB HDRC host driver
> > [    3.322915] usb usb1: Manufacturer: Linux 6.1.69-ti musb-hcd
> > [    3.328755] usb usb1: SerialNumber: musb-hdrc.1
> > [    3.334399] hub 1-0:1.0: USB hub found
> > [    3.338446] hub 1-0:1.0: 1 port detected
> > [    3.364408] omap-sham 53100000.sham: hw accel on OMAP rev 4.3
> > [    3.370789] omap-sham 53100000.sham: will run requests pump with
> > realtime priority
> > [    3.382899] omap-aes 53500000.aes: OMAP AES hw accel rev: 3.2
> > [    3.389523] omap-aes 53500000.aes: will run requests pump with
> realtime
> > priority
> > [    3.405436] hw perfevents: enabled with armv7_cortex_a8 PMU driver, =
5
> > counters available
> > [    3.419147] l3-aon-clkctrl:0000:0: failed to disable
> > [    3.427855] gpio gpiochip3: (gpio-96-127): not an immutable chip,
> please
> > consider fixing it!
> > [    3.439204] 44e09000.serial: ttyS0 at MMIO 0x44e09000 (irq =3D 41,
> > base_baud =3D 3000000) is a 8250
> > [    3.448493] printk: console [ttyS0] enabled
> > [    3.448493] printk: console [ttyS0] enabled
> > [    3.457110] printk: bootconsole [omap8250] disabled
> > [    3.457110] printk: bootconsole [omap8250] disabled
> > [    3.493448] tps65217-pmic: Failed to locate of_node [id: -1]
> > [    3.510500] tps65217-bl: Failed to locate of_node [id: -1]
> > [    3.520003] tps65217 0-0024: TPS65217 ID 0xe version 1.2
> > [    3.527310] at24 0-0050: 32768 byte 24c256 EEPROM, writable, 1
> > bytes/write
> > [    3.534718] i2c 0-0070: Fixed dependency cycle(s) with
> > /ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0
> > /port/endpoint@0
> > [    3.667523] tda998x 0-0070: found TDA19988
> > [    3.675108] omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 kHz
> > [    3.683307] omap_gpio 44e07000.gpio: Could not set line 6 debounce t=
o
> > 200000 microseconds (-22)
> > [    3.693654] tilcdc 4830e000.lcdc: bound 0-0070 (ops 0xc11bf9a8)
> > [    3.699748] sdhci-omap 48060000.mmc: Got CD GPIO
> > [    3.705997] [drm] Initialized tilcdc 1.0.0 20121205 for 4830e000.lcd=
c
> on
> > minor 0
> > [    3.713860] sdhci-omap 48060000.mmc: supply pbias not found, using
> dummy
> > regulator
> > [    3.723323] sdhci-omap 48060000.mmc: supply vqmmc not found, using
> dummy
> > regulator
> > [    3.757212] mmc0: SDHCI controller on 48060000.mmc [48060000.mmc]
> using
> > External DMA
> > [    3.828717] mmc0: new high speed SDHC card at address aaaa
> > [    3.833620] mmcblk0: mmc0:aaaa SD32G 29.7 GiB
> > [    3.837419]  mmcblk0: p1 p2
> > [    3.839151] Console: switching to colour frame buffer device 160x64
> > [    3.868128] tilcdc 4830e000.lcdc: [drm] fb0: tilcdcdrmfb frame buffe=
r
> > device
> > [    3.878981] sdhci-omap 481d8000.mmc: supply pbias not found, using
> dummy
> > regulator
> > [    3.891295] tps6521x_pwrbutton tps65217-pwrbutton: DMA mask not set
> > [    3.899587] sdhci-omap 481d8000.mmc: supply vqmmc not found, using
> dummy
> > regulator
> > [    3.910419] input: tps65217_pwrbutton as
> >
> /devices/platform/ocp/44c00000.interconnect/44c00000.interconnect:segment=
@200000
> > /44e0b000.target-module/44e0b000.i2c/i2c-0/0-0
> > [    3.952837] mmc1: SDHCI controller on 481d8000.mmc [481d8000.mmc]
> using
> > External DMA
> > [    3.961253] VFS: PARTUUID=3D is invalid.
> > [    3.961253] Expected PARTUUID=3D<valid-uuid-id>[/PARTNROFF=3D%d]
> > [    3.970800] Disabling rootwait; root=3D is invalid.
> > [    3.977324] /dev/root: Can't open blockdev
> > [    3.981716] VFS: Cannot open root device "PARTUUID=3D" or
> > unknown-block(0,0): error -6
> > [    3.989649] Please append a correct "root=3D" boot option; here are =
the
> > available partitions:
> > [    3.998200] b300        31166976 mmcblk0
> > [    3.998216]  driver: mmcblk
> > [    4.005313]   b301          131072 mmcblk0p1 076c4a2a-01
> > [    4.005328]
> > [    4.012322]   b302         2027747 mmcblk0p2 076c4a2a-02
> > [    4.012334]
> > [    4.019437] Kernel panic - not syncing: VFS: Unable to mount root fs
> on
> > unknown-block(0,0)
> > [    4.027753] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.1.69-ti #1
> > [    4.033966] Hardware name: Generic AM33XX (Flattened Device Tree)
> > [    4.040101]  unwind_backtrace from show_stack+0x18/0x1c
> > [    4.045389]  show_stack from dump_stack_lvl+0x40/0x4c
> > [    4.050478]  dump_stack_lvl from panic+0x11c/0x35c
> > [    4.055310]  panic from mount_block_root+0x158/0x1f4
> > [    4.060314]  mount_block_root from prepare_namespace+0x158/0x194
> > [    4.066358]  prepare_namespace from kernel_init_freeable+0x254/0x268
> > [    4.072750]  kernel_init_freeable from kernel_init+0x20/0x13c
> > [    4.078531]  kernel_init from ret_from_fork+0x14/0x28
> > [    4.083614] Exception stack(0xe0009fb0 to 0xe0009ff8)
> > [    4.088692] 9fa0:                                     00000000
> 00000000
> > 00000000 00000000
> > [    4.096909] 9fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000
> > 00000000 00000000
> > [    4.105124] 9fe0: 00000000 00000000 00000000 00000000 00000013
> 00000000
> > [    4.111788] ---[ end Kernel panic - not syncing: VFS: Unable to moun=
t
> > root fs on unknown-block(0,0) ]---
>

--0000000000005611b10618707c6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah right.=C2=A0 Booting with S2 pressed booted the scarthg=
ap bits.=C2=A0 Thanks for the help!<br></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 14, 2024 at 1:55=E2=80=
=AFPM Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org">denis@denix.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">1. U-boot and SPL seem to be old from Dunfell<br>
<br>
2. Check your env:<br>
<br>
&gt; append: root=3DPARTUUID=3D rootwait rw earlycon console=3DttyO0,115200=
n8,115200<br>
...<br>
&gt; [=C2=A0 =C2=A0 3.961253] VFS: PARTUUID=3D is invalid.<br>
&gt; [=C2=A0 =C2=A0 3.961253] Expected PARTUUID=3D&lt;valid-uuid-id&gt;[/PA=
RTNROFF=3D%d]<br>
&gt; [=C2=A0 =C2=A0 3.970800] Disabling rootwait; root=3D is invalid.<br>
&gt; [=C2=A0 =C2=A0 3.977324] /dev/root: Can&#39;t open blockdev<br>
&gt; [=C2=A0 =C2=A0 3.981716] VFS: Cannot open root device &quot;PARTUUID=
=3D&quot; or<br>
&gt; unknown-block(0,0): error -6<br>
&gt; [=C2=A0 =C2=A0 3.989649] Please append a correct &quot;root=3D&quot; b=
oot option; here are the<br>
<br>
-- <br>
Denys<br>
<br>
<br>
On Tue, May 14, 2024 at 01:24:37PM -0700, Joel Winarske wrote:<br>
&gt; What&#39;s the status of bbb on scarthgap?<br>
&gt; <br>
&gt; Three weeks or so ago it would boot, only SGX driver was not loading.<=
br>
&gt; <br>
&gt; Today I get a kernel panic.=C2=A0 Last week Scott Murray was saying to=
 set<br>
&gt; kernel preference to 6.1, which appears to be the default now.<br>
&gt; <br>
&gt; I would appreciate any assistance with this.<br>
&gt; <br>
&gt; <br>
&gt; U-Boot SPL 2019.04-00002-g31a8ae0206 (May 13 2020 - 09:26:17 -0500)<br=
>
&gt; Trying to boot from MMC2<br>
&gt; Loading Environment from EXT4...<br>
&gt; ** Unable to use mmc 0:1 for loading the env **<br>
&gt; <br>
&gt; <br>
&gt; U-Boot 2019.04-00002-g31a8ae0206 (May 13 2020 - 09:26:17 -0500), Build=
:<br>
&gt; jenkins-github_Bootloader-Builder-139<br>
&gt; <br>
&gt; CPU=C2=A0 : AM335X-GP rev 2.1<br>
&gt; I2C:=C2=A0 =C2=A0ready<br>
&gt; DRAM:=C2=A0 512 MiB<br>
&gt; No match for driver &#39;omap_hsmmc&#39;<br>
&gt; No match for driver &#39;omap_hsmmc&#39;<br>
&gt; Some drivers were not found<br>
&gt; Reset Source: Power-on reset has occurred.<br>
&gt; RTC 32KCLK Source: External.<br>
&gt; MMC:=C2=A0 =C2=A0OMAP SD/MMC: 0, OMAP SD/MMC: 1<br>
&gt; Loading Environment from EXT4...<br>
&gt; ** Unable to use mmc 0:1 for loading the env **<br>
&gt; Board: BeagleBone Black<br>
&gt; &lt;ethaddr&gt; not set. Validating first E-fuse MAC<br>
&gt; BeagleBone Black:<br>
&gt; BeagleBone: cape eeprom: i2c_probe: 0x54:<br>
&gt; BeagleBone: cape eeprom: i2c_probe: 0x55:<br>
&gt; BeagleBone: cape eeprom: i2c_probe: 0x56:<br>
&gt; BeagleBone: cape eeprom: i2c_probe: 0x57:<br>
&gt; Net:=C2=A0 =C2=A0eth0: MII MODE<br>
&gt; cpsw, usb_ether<br>
&gt; Press SPACE to abort autoboot in 0 seconds<br>
&gt; board_name=3D[A335BNLT] ...<br>
&gt; board_rev=3D[00C0] ...<br>
&gt; switch to partitions #0, OK<br>
&gt; mmc0 is current device<br>
&gt; SD/MMC found on device 0<br>
&gt; switch to partitions #0, OK<br>
&gt; mmc0 is current device<br>
&gt; Scanning mmc 0:1...<br>
&gt; Found /extlinux/extlinux.conf<br>
&gt; Retrieving file: /extlinux/extlinux.conf<br>
&gt; 218 bytes read in 6 ms (35.2 KiB/s)<br>
&gt; 1:=C2=A0 =C2=A0 =C2=A0 Poky (Yocto Project Reference Distro)<br>
&gt; Retrieving file: /extlinux/../zImage<br>
&gt; 12653056 bytes read in 800 ms (15.1 MiB/s)<br>
&gt; append: root=3DPARTUUID=3D rootwait rw earlycon console=3DttyO0,115200=
n8,115200<br>
&gt; Retrieving file: /extlinux/../am335x-boneblack.dtb<br>
&gt; 99078 bytes read in 13 ms (7.3 MiB/s)<br>
&gt; ## Flattened Device Tree blob at 88000000<br>
&gt;=C2=A0 =C2=A0 Booting using the fdt blob at 0x88000000<br>
&gt;=C2=A0 =C2=A0 Loading Device Tree to 8ffe4000, end 8ffff305 ... OK<br>
&gt; <br>
&gt; Starting kernel ...<br>
&gt; <br>
&gt; [=C2=A0 =C2=A0 0.000000] Booting Linux on physical CPU 0x0<br>
&gt; [=C2=A0 =C2=A0 0.000000] Linux version 6.1.69-ti (oe-user@oe-host)<br>
&gt; (arm-poky-linux-gnueabi-gcc (GCC) 13.2.0, GNU ld (GNU Binutils)<br>
&gt; 2.42.0.20240216) #1 SMP PREEMPT Mon Jan 29 18:204<br>
&gt; [=C2=A0 =C2=A0 0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (A=
RMv7),<br>
&gt; cr=3D10c5387d<br>
&gt; [=C2=A0 =C2=A0 0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT=
 aliasing<br>
&gt; instruction cache<br>
&gt; [=C2=A0 =C2=A0 0.000000] OF: fdt: Machine model: TI AM335x BeagleBone =
Black<br>
&gt; [=C2=A0 =C2=A0 0.000000] earlycon: omap8250 at MMIO 0x44e09000 (option=
s &#39;&#39;)<br>
&gt; [=C2=A0 =C2=A0 0.000000] printk: bootconsole [omap8250] enabled<br>
&gt; [=C2=A0 =C2=A0 0.000000] Memory policy: Data cache writeback<br>
&gt; [=C2=A0 =C2=A0 0.000000] efi: UEFI not found.<br>
&gt; [=C2=A0 =C2=A0 0.000000] cma: Reserved 48 MiB at 0x9c800000<br>
&gt; [=C2=A0 =C2=A0 0.000000] Zone ranges:<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0Normal=C2=A0 =C2=A0[mem 0x0000000=
080000000-0x000000009fdfffff]<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0HighMem=C2=A0 empty<br>
&gt; [=C2=A0 =C2=A0 0.000000] Movable zone start for each node<br>
&gt; [=C2=A0 =C2=A0 0.000000] Early memory node ranges<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0node=C2=A0 =C2=A00: [mem 0x000000=
0080000000-0x000000009fdfffff]<br>
&gt; [=C2=A0 =C2=A0 0.000000] Initmem setup node 0 [mem<br>
&gt; 0x0000000080000000-0x000000009fdfffff]<br>
&gt; [=C2=A0 =C2=A0 0.000000] CPU: All CPU(s) started in SVC mode.<br>
&gt; [=C2=A0 =C2=A0 0.000000] AM335X ES2.1 (sgx neon)<br>
&gt; [=C2=A0 =C2=A0 0.000000] percpu: Embedded 18 pages/cpu s41428 r8192 d2=
4108 u73728<br>
&gt; [=C2=A0 =C2=A0 0.000000] Built 1 zonelists, mobility grouping on.=C2=
=A0 Total pages: 129412<br>
&gt; [=C2=A0 =C2=A0 0.000000] Kernel command line: root=3DPARTUUID=3D rootw=
ait rw earlycon<br>
&gt; console=3DttyO0,115200n8,115200<br>
&gt; [=C2=A0 =C2=A0 0.000000] Dentry cache hash table entries: 65536 (order=
: 6, 262144<br>
&gt; bytes, linear)<br>
&gt; [=C2=A0 =C2=A0 0.000000] Inode-cache hash table entries: 32768 (order:=
 5, 131072<br>
&gt; bytes, linear)<br>
&gt; [=C2=A0 =C2=A0 0.000000] mem auto-init: stack:all(zero), heap alloc:on=
, heap free:off<br>
&gt; [=C2=A0 =C2=A0 0.000000] Memory: 442892K/522240K available (16384K ker=
nel code, 1686K<br>
&gt; rwdata, 4440K rodata, 1024K init, 455K bss, 30196K reserved, 49152K<br=
>
&gt; cma-reserved, 0K highmem)<br>
&gt; [=C2=A0 =C2=A0 0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=
=3D0, CPUs=3D1, Nodes=3D1<br>
&gt; [=C2=A0 =C2=A0 0.000000] ftrace: allocating 50610 entries in 149 pages=
<br>
&gt; [=C2=A0 =C2=A0 0.000000] ftrace: allocated 149 pages with 4 groups<br>
&gt; [=C2=A0 =C2=A0 0.000000] trace event string verifier disabled<br>
&gt; [=C2=A0 =C2=A0 0.000000] rcu: Preemptible hierarchical RCU implementat=
ion.<br>
&gt; [=C2=A0 =C2=A0 0.000000] rcu:=C2=A0 =C2=A0 =C2=A0RCU restricting CPUs =
from NR_CPUS=3D2 to nr_cpu_ids=3D1.<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 Trampoline variant of Tasks RCU enabled=
.<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 Rude variant of Tasks RCU enabled.<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 Tracing variant of Tasks RCU enabled.<b=
r>
&gt; [=C2=A0 =C2=A0 0.000000] rcu: RCU calculated value of scheduler-enlist=
ment delay is<br>
&gt; 25 jiffies.<br>
&gt; [=C2=A0 =C2=A0 0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=
=3D16, nr_cpu_ids=3D1<br>
&gt; [=C2=A0 =C2=A0 0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: =
16<br>
&gt; [=C2=A0 =C2=A0 0.000000] IRQ: Found an INTC at 0x(ptrval) (revision 5.=
0) with 128<br>
&gt; interrupts<br>
&gt; [=C2=A0 =C2=A0 0.000000] rcu: srcu_init: Setting srcu_struct sizes bas=
ed on<br>
&gt; contention.<br>
&gt; [=C2=A0 =C2=A0 0.000000] TI gptimer clocksource: always-on /ocp/interc=
onnect@44c00000<br>
&gt; /segment@200000/target-module@31000<br>
&gt; [=C2=A0 =C2=A0 0.000002] sched_clock: 32 bits at 24MHz, resolution 41n=
s, wraps every<br>
&gt; 89478484971ns<br>
&gt; [=C2=A0 =C2=A0 0.008068] clocksource: dmtimer: mask: 0xffffffff max_cy=
cles:<br>
&gt; 0xffffffff, max_idle_ns: 79635851949 ns<br>
&gt; [=C2=A0 =C2=A0 0.018002] TI gptimer clockevent: 24000000 Hz at<br>
&gt; /ocp/interconnect@48000000/segment@0/target-module@40000<br>
&gt; [=C2=A0 =C2=A0 0.029329] Console: colour dummy device 80x30<br>
&gt; [=C2=A0 =C2=A0 0.034029] WARNING: Your &#39;console=3DttyO0&#39; has b=
een replaced by &#39;ttyS0&#39;<br>
&gt; [=C2=A0 =C2=A0 0.040765] This ensures that you still see kernel messag=
es. Please<br>
&gt; [=C2=A0 =C2=A0 0.047223] update your kernel commandline.<br>
&gt; [=C2=A0 =C2=A0 0.051587] Calibrating delay loop... 995.32 BogoMIPS (lp=
j=3D1990656)<br>
&gt; [=C2=A0 =C2=A0 0.074478] CPU: Testing write buffer coherency: ok<br>
&gt; [=C2=A0 =C2=A0 0.079591] CPU0: Spectre v2: using BPIALL workaround<br>
&gt; [=C2=A0 =C2=A0 0.084801] pid_max: default: 32768 minimum: 301<br>
&gt; [=C2=A0 =C2=A0 0.090028] LSM: Security Framework initializing<br>
&gt; [=C2=A0 =C2=A0 0.094923] landlock: Up and running.<br>
&gt; [=C2=A0 =C2=A0 0.098710] Yama: becoming mindful.<br>
&gt; [=C2=A0 =C2=A0 0.102614] AppArmor: AppArmor initialized<br>
&gt; [=C2=A0 =C2=A0 0.106865] TOMOYO Linux initialized<br>
&gt; [=C2=A0 =C2=A0 0.110599] LSM support for eBPF active<br>
&gt; [=C2=A0 =C2=A0 0.114831] Mount-cache hash table entries: 1024 (order: =
0, 4096 bytes,<br>
&gt; linear)<br>
&gt; [=C2=A0 =C2=A0 0.122385] Mountpoint-cache hash table entries: 1024 (or=
der: 0, 4096<br>
&gt; bytes, linear)<br>
&gt; [=C2=A0 =C2=A0 0.134142] cblist_init_generic: Setting adjustable numbe=
r of callback<br>
&gt; queues.<br>
&gt; [=C2=A0 =C2=A0 0.141692] cblist_init_generic: Setting shift to 0 and l=
im to 1.<br>
&gt; [=C2=A0 =C2=A0 0.148206] cblist_init_generic: Setting adjustable numbe=
r of callback<br>
&gt; queues.<br>
&gt; [=C2=A0 =C2=A0 0.155687] cblist_init_generic: Setting shift to 0 and l=
im to 1.<br>
&gt; [=C2=A0 =C2=A0 0.162178] cblist_init_generic: Setting adjustable numbe=
r of callback<br>
&gt; queues.<br>
&gt; [=C2=A0 =C2=A0 0.169653] cblist_init_generic: Setting shift to 0 and l=
im to 1.<br>
&gt; [=C2=A0 =C2=A0 0.176195] Setting up static identity map for 0x80100000=
 - 0x80100060<br>
&gt; [=C2=A0 =C2=A0 0.183196] rcu: Hierarchical SRCU implementation.<br>
&gt; [=C2=A0 =C2=A0 0.188174] rcu:=C2=A0 =C2=A0 =C2=A0Max phase no-delay in=
stances is 1000.<br>
&gt; [=C2=A0 =C2=A0 0.195209] EFI services will not be available.<br>
&gt; [=C2=A0 =C2=A0 0.200736] smp: Bringing up secondary CPUs ...<br>
&gt; [=C2=A0 =C2=A0 0.205481] smp: Brought up 1 node, 1 CPU<br>
&gt; [=C2=A0 =C2=A0 0.209628] SMP: Total of 1 processors activated (995.32 =
BogoMIPS).<br>
&gt; [=C2=A0 =C2=A0 0.216099] CPU: All CPU(s) started in SVC mode.<br>
&gt; [=C2=A0 =C2=A0 0.221891] devtmpfs: initialized<br>
&gt; [=C2=A0 =C2=A0 0.248887] VFP support v0.3: implementor 41 architecture=
 3 part 30<br>
&gt; variant c rev 3<br>
&gt; [=C2=A0 =C2=A0 0.257438] clocksource: jiffies: mask: 0xffffffff max_cy=
cles:<br>
&gt; 0xffffffff, max_idle_ns: 7645041785100000 ns<br>
&gt; [=C2=A0 =C2=A0 0.267544] futex hash table entries: 256 (order: 2, 1638=
4 bytes, linear)<br>
&gt; [=C2=A0 =C2=A0 0.279749] pinctrl core: initialized pinctrl subsystem<b=
r>
&gt; [=C2=A0 =C2=A0 0.286562] DMI not present or invalid.<br>
&gt; [=C2=A0 =C2=A0 0.291573] NET: Registered PF_NETLINK/PF_ROUTE protocol =
family<br>
&gt; [=C2=A0 =C2=A0 0.306527] DMA: preallocated 256 KiB pool for atomic coh=
erent<br>
&gt; allocations<br>
&gt; [=C2=A0 =C2=A0 0.314286] audit: initializing netlink subsys (disabled)=
<br>
&gt; [=C2=A0 =C2=A0 0.321360] thermal_sys: Registered thermal governor &#39=
;fair_share&#39;<br>
&gt; [=C2=A0 =C2=A0 0.321384] thermal_sys: Registered thermal governor &#39=
;bang_bang&#39;<br>
&gt; [=C2=A0 =C2=A0 0.327762] audit: type=3D2000 audit(0.232:1): state=3Din=
itialized<br>
&gt; audit_enabled=3D0 res=3D1<br>
&gt; [=C2=A0 =C2=A0 0.341952] thermal_sys: Registered thermal governor &#39=
;step_wise&#39;<br>
&gt; [=C2=A0 =C2=A0 0.341961] thermal_sys: Registered thermal governor &#39=
;user_space&#39;<br>
&gt; [=C2=A0 =C2=A0 0.348159] thermal_sys: Registered thermal governor &#39=
;power_allocator&#39;<br>
&gt; [=C2=A0 =C2=A0 0.354588] cpuidle: using governor ladder<br>
&gt; [=C2=A0 =C2=A0 0.365590] cpuidle: using governor menu<br>
&gt; [=C2=A0 =C2=A0 0.392937] hw-breakpoint: debug architecture 0x4 unsuppo=
rted.<br>
&gt; [=C2=A0 =C2=A0 0.413611] kprobes: kprobe jump-optimization is enabled.=
 All kprobes<br>
&gt; are optimized if possible.<br>
&gt; [=C2=A0 =C2=A0 0.441354] raid6: skipped pq benchmark and selected neon=
x8<br>
&gt; [=C2=A0 =C2=A0 0.452017] raid6: using neon recovery algorithm<br>
&gt; [=C2=A0 =C2=A0 0.468087] iommu: Default domain type: Translated<br>
&gt; [=C2=A0 =C2=A0 0.473185] iommu: DMA domain TLB invalidation policy: st=
rict mode<br>
&gt; [=C2=A0 =C2=A0 0.489780] SCSI subsystem initialized<br>
&gt; [=C2=A0 =C2=A0 0.501001] usbcore: registered new interface driver usbf=
s<br>
&gt; [=C2=A0 =C2=A0 0.512146] usbcore: registered new interface driver hub<=
br>
&gt; [=C2=A0 =C2=A0 0.524089] usbcore: registered new device driver usb<br>
&gt; [=C2=A0 =C2=A0 0.536781] pps_core: LinuxPPS API ver. 1 registered<br>
&gt; [=C2=A0 =C2=A0 0.548015] pps_core: Software ver. 5.3.6 - Copyright 200=
5-2007 Rodolfo<br>
&gt; Giometti &lt;<a href=3D"mailto:giometti@linux.it" target=3D"_blank">gi=
ometti@linux.it</a>&gt;<br>
&gt; [=C2=A0 =C2=A0 0.564043] PTP clock support registered<br>
&gt; [=C2=A0 =C2=A0 0.577552] NetLabel: Initializing<br>
&gt; [=C2=A0 =C2=A0 0.588018] NetLabel:=C2=A0 domain hash size =3D 128<br>
&gt; [=C2=A0 =C2=A0 0.592525] NetLabel:=C2=A0 protocols =3D UNLABELED CIPSO=
v4 CALIPSO<br>
&gt; [=C2=A0 =C2=A0 0.604158] NetLabel:=C2=A0 unlabeled traffic allowed by =
default<br>
&gt; [=C2=A0 =C2=A0 0.620692] clocksource: Switched to clocksource dmtimer<=
br>
&gt; [=C2=A0 =C2=A0 0.634086] VFS: Disk quotas dquot_6.6.0<br>
&gt; [=C2=A0 =C2=A0 0.644882] VFS: Dquot-cache hash table entries: 1024 (or=
der 0, 4096<br>
&gt; bytes)<br>
&gt; [=C2=A0 =C2=A0 0.656972] FS-Cache: Loaded<br>
&gt; [=C2=A0 =C2=A0 0.664821] CacheFiles: Loaded<br>
&gt; [=C2=A0 =C2=A0 0.673204] AppArmor: AppArmor Filesystem Enabled<br>
&gt; [=C2=A0 =C2=A0 0.704059] NET: Registered PF_INET protocol family<br>
&gt; [=C2=A0 =C2=A0 0.717040] IP idents hash table entries: 8192 (order: 4,=
 65536 bytes,<br>
&gt; linear)<br>
&gt; [=C2=A0 =C2=A0 0.734482] tcp_listen_portaddr_hash hash table entries: =
512 (order: 0,<br>
&gt; 4096 bytes, linear)<br>
&gt; [=C2=A0 =C2=A0 0.752899] Table-perturb hash table entries: 65536 (orde=
r: 6, 262144<br>
&gt; bytes, linear)<br>
&gt; [=C2=A0 =C2=A0 0.768718] TCP established hash table entries: 4096 (ord=
er: 2, 16384<br>
&gt; bytes, linear)<br>
&gt; [=C2=A0 =C2=A0 0.784765] TCP bind hash table entries: 4096 (order: 4, =
65536 bytes,<br>
&gt; linear)<br>
&gt; [=C2=A0 =C2=A0 0.800775] TCP: Hash tables configured (established 4096=
 bind 4096)<br>
&gt; [=C2=A0 =C2=A0 0.813054] MPTCP token hash table entries: 512 (order: 1=
, 8192 bytes,<br>
&gt; linear)<br>
&gt; [=C2=A0 =C2=A0 0.828795] UDP hash table entries: 256 (order: 1, 8192 b=
ytes, linear)<br>
&gt; [=C2=A0 =C2=A0 0.844723] UDP-Lite hash table entries: 256 (order: 1, 8=
192 bytes,<br>
&gt; linear)<br>
&gt; [=C2=A0 =C2=A0 0.857230] NET: Registered PF_UNIX/PF_LOCAL protocol fam=
ily<br>
&gt; [=C2=A0 =C2=A0 0.873449] RPC: Registered named UNIX socket transport m=
odule.<br>
&gt; [=C2=A0 =C2=A0 0.884695] RPC: Registered udp transport module.<br>
&gt; [=C2=A0 =C2=A0 0.892688] RPC: Registered tcp transport module.<br>
&gt; [=C2=A0 =C2=A0 0.904698] RPC: Registered tcp NFSv4.1 backchannel trans=
port module.<br>
&gt; [=C2=A0 =C2=A0 0.916707] NET: Registered PF_XDP protocol family<br>
&gt; [=C2=A0 =C2=A0 2.057584] Initialise system trusted keyrings<br>
&gt; [=C2=A0 =C2=A0 2.064353] workingset: timestamp_bits=3D14 max_order=3D1=
7 bucket_order=3D3<br>
&gt; [=C2=A0 =C2=A0 2.081692] zbud: loaded<br>
&gt; [=C2=A0 =C2=A0 2.089227] NFS: Registering the id_resolver key type<br>
&gt; [=C2=A0 =C2=A0 2.094600] Key type id_resolver registered<br>
&gt; [=C2=A0 =C2=A0 2.098937] Key type id_legacy registered<br>
&gt; [=C2=A0 =C2=A0 2.103293] nfs4filelayout_init: NFSv4 File Layout Driver=
 Registering...<br>
&gt; [=C2=A0 =C2=A0 2.110222] nfs4flexfilelayout_init: NFSv4 Flexfile Layou=
t Driver<br>
&gt; Registering...<br>
&gt; [=C2=A0 =C2=A0 2.117932] jffs2: version 2.2. (NAND) (SUMMARY)=C2=A0 =
=C2=A9 2001-2006 Red Hat,<br>
&gt; Inc.<br>
&gt; [=C2=A0 =C2=A0 2.126320] fuse: init (API version 7.37)<br>
&gt; [=C2=A0 =C2=A0 2.223398] NET: Registered PF_ALG protocol family<br>
&gt; [=C2=A0 =C2=A0 2.228520] xor: measuring software checksum speed<br>
&gt; [=C2=A0 =C2=A0 2.241238]=C2=A0 =C2=A0 arm4regs=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 :=C2=A0 1270 MB/sec<br>
&gt; [=C2=A0 =C2=A0 2.254710]=C2=A0 =C2=A0 8regs=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0:=C2=A0 1099 MB/sec<br>
&gt; [=C2=A0 =C2=A0 2.268180]=C2=A0 =C2=A0 32regs=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 :=C2=A0 1099 MB/sec<br>
&gt; [=C2=A0 =C2=A0 2.278200]=C2=A0 =C2=A0 neon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 :=C2=A0 1783 MB/sec<br>
&gt; [=C2=A0 =C2=A0 2.282696] xor: using function: neon (1783 MB/sec)<br>
&gt; [=C2=A0 =C2=A0 2.287741] Key type asymmetric registered<br>
&gt; [=C2=A0 =C2=A0 2.291976] Asymmetric key parser &#39;x509&#39; register=
ed<br>
&gt; [=C2=A0 =C2=A0 2.299642] alg: self-tests for CTR-KDF (hmac(sha256)) pa=
ssed<br>
&gt; [=C2=A0 =C2=A0 2.306168] Block layer SCSI generic (bsg) driver version=
 0.4 loaded<br>
&gt; (major 244)<br>
&gt; [=C2=A0 =C2=A0 2.314270] io scheduler mq-deadline registered<br>
&gt; [=C2=A0 =C2=A0 2.326615] Serial: 8250/16550 driver, 6 ports, IRQ shari=
ng disabled<br>
&gt; [=C2=A0 =C2=A0 2.354956] loop: module loaded<br>
&gt; [=C2=A0 =C2=A0 2.358858] SPI driver tps6594 has no spi_device_id for t=
i,tps6594-q1<br>
&gt; [=C2=A0 =C2=A0 2.365541] SPI driver tps6594 has no spi_device_id for t=
i,tps6593-q1<br>
&gt; [=C2=A0 =C2=A0 2.372185] SPI driver tps6594 has no spi_device_id for t=
i,lp8764-q1<br>
&gt; [=C2=A0 =C2=A0 2.383380] usbcore: registered new interface driver smsc=
95xx<br>
&gt; [=C2=A0 =C2=A0 2.393632] i2c_dev: i2c /dev entries driver<br>
&gt; [=C2=A0 =C2=A0 2.398311] Driver for 1-wire Dallas network protocol.<br=
>
&gt; [=C2=A0 =C2=A0 2.405002] softdog: initialized. soft_noboot=3D0 soft_ma=
rgin=3D60 sec<br>
&gt; soft_panic=3D0 (nowayout=3D0)<br>
&gt; [=C2=A0 =C2=A0 2.413734] softdog:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 soft_reboot_cmd=3D&lt;not set&gt;<br>
&gt; soft_active_on_boot=3D0<br>
&gt; [=C2=A0 =C2=A0 2.422541] cpuidle: enable-method property &#39;ti,am335=
2&#39; found operations<br>
&gt; [=C2=A0 =C2=A0 2.430352] sdhci: Secure Digital Host Controller Interfa=
ce driver<br>
&gt; [=C2=A0 =C2=A0 2.436776] sdhci: Copyright(c) Pierre Ossman<br>
&gt; [=C2=A0 =C2=A0 2.441277] sdhci-pltfm: SDHCI platform and OF driver hel=
per<br>
&gt; [=C2=A0 =C2=A0 2.447615] ledtrig-cpu: registered to indicate activity =
on CPUs<br>
&gt; [=C2=A0 =C2=A0 2.454533] hid: raw HID events driver (C) Jiri Kosina<br=
>
&gt; [=C2=A0 =C2=A0 2.460601] usbcore: registered new interface driver usbh=
id<br>
&gt; [=C2=A0 =C2=A0 2.466401] usbhid: USB HID core driver<br>
&gt; [=C2=A0 =C2=A0 2.472766] NET: Registered PF_INET6 protocol family<br>
&gt; [=C2=A0 =C2=A0 2.482755] Segment Routing with IPv6<br>
&gt; [=C2=A0 =C2=A0 2.486926] In-situ OAM (IOAM) with IPv6<br>
&gt; [=C2=A0 =C2=A0 2.491263] mip6: Mobile IPv6<br>
&gt; [=C2=A0 =C2=A0 2.494566] NET: Registered PF_PACKET protocol family<br>
&gt; [=C2=A0 =C2=A0 2.500227] Key type dns_resolver registered<br>
&gt; [=C2=A0 =C2=A0 2.504771] mpls_gso: MPLS GSO support<br>
&gt; [=C2=A0 =C2=A0 2.508856] ThumbEE CPU extension supported.<br>
&gt; [=C2=A0 =C2=A0 2.513298] Registering SWP/SWPB emulation handler<br>
&gt; [=C2=A0 =C2=A0 2.518251] omap_voltage_late_init: Voltage driver suppor=
t not added<br>
&gt; [=C2=A0 =C2=A0 2.526359] registered taskstats version 1<br>
&gt; [=C2=A0 =C2=A0 2.530792] Loading compiled-in X.509 certificates<br>
&gt; [=C2=A0 =C2=A0 2.536739] zswap: loaded using pool lzo/zbud<br>
&gt; [=C2=A0 =C2=A0 2.542631] Key type .fscrypt registered<br>
&gt; [=C2=A0 =C2=A0 2.546840] Key type fscrypt-provisioning registered<br>
&gt; [=C2=A0 =C2=A0 2.561788] Btrfs loaded, crc32c=3Dcrc32c-generic, zoned=
=3Dyes, fsverity=3Dyes<br>
&gt; [=C2=A0 =C2=A0 2.571469] Key type encrypted registered<br>
&gt; [=C2=A0 =C2=A0 2.575883] AppArmor: AppArmor sha1 policy hashing enable=
d<br>
&gt; [=C2=A0 =C2=A0 2.581759] ima: No TPM chip found, activating TPM-bypass=
!<br>
&gt; [=C2=A0 =C2=A0 2.587664] ima: Allocated hash algorithm: sha256<br>
&gt; [=C2=A0 =C2=A0 2.592803] ima: No architecture policies found<br>
&gt; [=C2=A0 =C2=A0 2.597661] evm: Initialising EVM extended attributes:<br=
>
&gt; [=C2=A0 =C2=A0 2.602985] evm: security.selinux<br>
&gt; [=C2=A0 =C2=A0 2.606412] evm: security.SMACK64 (disabled)<br>
&gt; [=C2=A0 =C2=A0 2.610825] evm: security.SMACK64EXEC (disabled)<br>
&gt; [=C2=A0 =C2=A0 2.615587] evm: security.SMACK64TRANSMUTE (disabled)<br>
&gt; [=C2=A0 =C2=A0 2.620799] evm: security.SMACK64MMAP (disabled)<br>
&gt; [=C2=A0 =C2=A0 2.625560] evm: security.apparmor<br>
&gt; [=C2=A0 =C2=A0 2.629071] evm: security.ima<br>
&gt; [=C2=A0 =C2=A0 2.632121] evm: security.capability<br>
&gt; [=C2=A0 =C2=A0 2.635810] evm: HMAC attrs: 0x1<br>
&gt; [=C2=A0 =C2=A0 2.683301] remoteproc remoteproc0: wkup_m3 is available<=
br>
&gt; [=C2=A0 =C2=A0 2.702524] pinctrl-single 44e10800.pinmux: 142 pins, siz=
e 568<br>
&gt; [=C2=A0 =C2=A0 2.715024] ti-sysc: probe of 44e31000.target-module fail=
ed with error<br>
&gt; -16<br>
&gt; [=C2=A0 =C2=A0 2.726119] omap_wdt: OMAP Watchdog Timer Rev 0x01: initi=
al timeout 60<br>
&gt; sec<br>
&gt; [=C2=A0 =C2=A0 2.737737] omap_rtc 44e3e000.rtc: registered as rtc0<br>
&gt; [=C2=A0 =C2=A0 2.743061] omap_rtc 44e3e000.rtc: setting system clock t=
o<br>
&gt; 2000-01-01T00:00:00 UTC (946684800)<br>
&gt; [=C2=A0 =C2=A0 2.763281] ti-sysc: probe of 48040000.target-module fail=
ed with error<br>
&gt; -16<br>
&gt; [=C2=A0 =C2=A0 2.785171] gpio gpiochip0: (gpio-0-31): not an immutable=
 chip, please<br>
&gt; consider fixing it!<br>
&gt; [=C2=A0 =C2=A0 2.794444] OMAP GPIO hardware version 0.1<br>
&gt; [=C2=A0 =C2=A0 2.805375] omap-mailbox 480c8000.mailbox: omap mailbox r=
ev 0x400<br>
&gt; [=C2=A0 =C2=A0 2.818643] at24 2-0054: supply vcc not found, using dumm=
y regulator<br>
&gt; [=C2=A0 =C2=A0 2.856849] at24 2-0055: supply vcc not found, using dumm=
y regulator<br>
&gt; [=C2=A0 =C2=A0 2.892531] at24 2-0056: supply vcc not found, using dumm=
y regulator<br>
&gt; [=C2=A0 =C2=A0 2.928560] at24 2-0057: supply vcc not found, using dumm=
y regulator<br>
&gt; [=C2=A0 =C2=A0 2.964125] omap_i2c 4819c000.i2c: bus 2 rev0.11 at 100 k=
Hz<br>
&gt; [=C2=A0 =C2=A0 2.975562] gpio gpiochip1: (gpio-32-63): not an immutabl=
e chip, please<br>
&gt; consider fixing it!<br>
&gt; [=C2=A0 =C2=A0 2.987140] gpio gpiochip2: (gpio-64-95): not an immutabl=
e chip, please<br>
&gt; consider fixing it!<br>
&gt; [=C2=A0 =C2=A0 3.001969] sdhci-omap 481d8000.mmc: supply pbias not fou=
nd, using dummy<br>
&gt; regulator<br>
&gt; [=C2=A0 =C2=A0 3.018359] sdhci-omap 481d8000.mmc: supply vqmmc not fou=
nd, using dummy<br>
&gt; regulator<br>
&gt; [=C2=A0 =C2=A0 3.028511] omap_rng 48310000.rng: Random Number Generato=
r ver. 20<br>
&gt; [=C2=A0 =C2=A0 3.035855] random: crng init done<br>
&gt; [=C2=A0 =C2=A0 3.092730] davinci_mdio 4a101000.mdio: davinci mdio revi=
sion 1.6, bus<br>
&gt; freq 1000000<br>
&gt; [=C2=A0 =C2=A0 3.126125] SMSC LAN8710/LAN8720: probe of 4a101000.mdio:=
00 failed with<br>
&gt; error -5<br>
&gt; [=C2=A0 =C2=A0 3.133894] davinci_mdio 4a101000.mdio: phy[0]: device 4a=
101000.mdio:00,<br>
&gt; driver SMSC LAN8710/LAN8720<br>
&gt; [=C2=A0 =C2=A0 3.144040] cpsw-switch 4a100000.switch: initialized cpsw=
 ale version 1.4<br>
&gt; [=C2=A0 =C2=A0 3.151110] cpsw-switch 4a100000.switch: ALE Table size 1=
024<br>
&gt; [=C2=A0 =C2=A0 3.157084] cpsw-switch 4a100000.switch: cpts: overflow c=
heck period<br>
&gt; 1250 (jiffies)<br>
&gt; [=C2=A0 =C2=A0 3.165001] cpsw-switch 4a100000.switch: CPTS: ref_clk_fr=
eq:250000000<br>
&gt; calc_mult:2147483648 calc_shift:29 error:0 nsec/sec<br>
&gt; [=C2=A0 =C2=A0 3.176410] cpsw-switch 4a100000.switch: Detected MACID =
=3D<br>
&gt; 68:5e:1c:03:07:bf<br>
&gt; [=C2=A0 =C2=A0 3.185575] cpsw-switch 4a100000.switch: initialized (reg=
s 0x4a100000,<br>
&gt; pool size 256) hw_ver:0019010C 1.12 (0)<br>
&gt; [=C2=A0 =C2=A0 3.210379] debugfs: Directory &#39;49000000.dma&#39; wit=
h parent &#39;dmaengine&#39;<br>
&gt; already present!<br>
&gt; [=C2=A0 =C2=A0 3.218638] edma 49000000.dma: TI EDMA DMA engine driver<=
br>
&gt; [=C2=A0 =C2=A0 3.230547] am335x-phy-driver 47401300.usb-phy: supply vc=
c not found,<br>
&gt; using dummy regulator<br>
&gt; [=C2=A0 =C2=A0 3.239674] am335x-phy-driver 47401300.usb-phy: dummy sup=
plies not<br>
&gt; allowed for exclusive requests<br>
&gt; [=C2=A0 =C2=A0 3.255611] am335x-phy-driver 47401b00.usb-phy: supply vc=
c not found,<br>
&gt; using dummy regulator<br>
&gt; [=C2=A0 =C2=A0 3.264906] am335x-phy-driver 47401b00.usb-phy: dummy sup=
plies not<br>
&gt; allowed for exclusive requests<br>
&gt; [=C2=A0 =C2=A0 3.288119] musb-hdrc musb-hdrc.1: MUSB HDRC host driver<=
br>
&gt; [=C2=A0 =C2=A0 3.293805] musb-hdrc musb-hdrc.1: new USB bus registered=
, assigned bus<br>
&gt; number 1<br>
&gt; [=C2=A0 =C2=A0 3.301785] usb usb1: New USB device found, idVendor=3D1d=
6b,<br>
&gt; idProduct=3D0002, bcdDevice=3D 6.01<br>
&gt; [=C2=A0 =C2=A0 3.310336] usb usb1: New USB device strings: Mfr=3D3, Pr=
oduct=3D2,<br>
&gt; SerialNumber=3D1<br>
&gt; [=C2=A0 =C2=A0 3.317791] usb usb1: Product: MUSB HDRC host driver<br>
&gt; [=C2=A0 =C2=A0 3.322915] usb usb1: Manufacturer: Linux 6.1.69-ti musb-=
hcd<br>
&gt; [=C2=A0 =C2=A0 3.328755] usb usb1: SerialNumber: musb-hdrc.1<br>
&gt; [=C2=A0 =C2=A0 3.334399] hub 1-0:1.0: USB hub found<br>
&gt; [=C2=A0 =C2=A0 3.338446] hub 1-0:1.0: 1 port detected<br>
&gt; [=C2=A0 =C2=A0 3.364408] omap-sham 53100000.sham: hw accel on OMAP rev=
 4.3<br>
&gt; [=C2=A0 =C2=A0 3.370789] omap-sham 53100000.sham: will run requests pu=
mp with<br>
&gt; realtime priority<br>
&gt; [=C2=A0 =C2=A0 3.382899] omap-aes 53500000.aes: OMAP AES hw accel rev:=
 3.2<br>
&gt; [=C2=A0 =C2=A0 3.389523] omap-aes 53500000.aes: will run requests pump=
 with realtime<br>
&gt; priority<br>
&gt; [=C2=A0 =C2=A0 3.405436] hw perfevents: enabled with armv7_cortex_a8 P=
MU driver, 5<br>
&gt; counters available<br>
&gt; [=C2=A0 =C2=A0 3.419147] l3-aon-clkctrl:0000:0: failed to disable<br>
&gt; [=C2=A0 =C2=A0 3.427855] gpio gpiochip3: (gpio-96-127): not an immutab=
le chip, please<br>
&gt; consider fixing it!<br>
&gt; [=C2=A0 =C2=A0 3.439204] 44e09000.serial: ttyS0 at MMIO 0x44e09000 (ir=
q =3D 41,<br>
&gt; base_baud =3D 3000000) is a 8250<br>
&gt; [=C2=A0 =C2=A0 3.448493] printk: console [ttyS0] enabled<br>
&gt; [=C2=A0 =C2=A0 3.448493] printk: console [ttyS0] enabled<br>
&gt; [=C2=A0 =C2=A0 3.457110] printk: bootconsole [omap8250] disabled<br>
&gt; [=C2=A0 =C2=A0 3.457110] printk: bootconsole [omap8250] disabled<br>
&gt; [=C2=A0 =C2=A0 3.493448] tps65217-pmic: Failed to locate of_node [id: =
-1]<br>
&gt; [=C2=A0 =C2=A0 3.510500] tps65217-bl: Failed to locate of_node [id: -1=
]<br>
&gt; [=C2=A0 =C2=A0 3.520003] tps65217 0-0024: TPS65217 ID 0xe version 1.2<=
br>
&gt; [=C2=A0 =C2=A0 3.527310] at24 0-0050: 32768 byte 24c256 EEPROM, writab=
le, 1<br>
&gt; bytes/write<br>
&gt; [=C2=A0 =C2=A0 3.534718] i2c 0-0070: Fixed dependency cycle(s) with<br=
>
&gt; /ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0<br=
>
&gt; /port/endpoint@0<br>
&gt; [=C2=A0 =C2=A0 3.667523] tda998x 0-0070: found TDA19988<br>
&gt; [=C2=A0 =C2=A0 3.675108] omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 k=
Hz<br>
&gt; [=C2=A0 =C2=A0 3.683307] omap_gpio 44e07000.gpio: Could not set line 6=
 debounce to<br>
&gt; 200000 microseconds (-22)<br>
&gt; [=C2=A0 =C2=A0 3.693654] tilcdc 4830e000.lcdc: bound 0-0070 (ops 0xc11=
bf9a8)<br>
&gt; [=C2=A0 =C2=A0 3.699748] sdhci-omap 48060000.mmc: Got CD GPIO<br>
&gt; [=C2=A0 =C2=A0 3.705997] [drm] Initialized tilcdc 1.0.0 20121205 for 4=
830e000.lcdc on<br>
&gt; minor 0<br>
&gt; [=C2=A0 =C2=A0 3.713860] sdhci-omap 48060000.mmc: supply pbias not fou=
nd, using dummy<br>
&gt; regulator<br>
&gt; [=C2=A0 =C2=A0 3.723323] sdhci-omap 48060000.mmc: supply vqmmc not fou=
nd, using dummy<br>
&gt; regulator<br>
&gt; [=C2=A0 =C2=A0 3.757212] mmc0: SDHCI controller on 48060000.mmc [48060=
000.mmc] using<br>
&gt; External DMA<br>
&gt; [=C2=A0 =C2=A0 3.828717] mmc0: new high speed SDHC card at address aaa=
a<br>
&gt; [=C2=A0 =C2=A0 3.833620] mmcblk0: mmc0:aaaa SD32G 29.7 GiB<br>
&gt; [=C2=A0 =C2=A0 3.837419]=C2=A0 mmcblk0: p1 p2<br>
&gt; [=C2=A0 =C2=A0 3.839151] Console: switching to colour frame buffer dev=
ice 160x64<br>
&gt; [=C2=A0 =C2=A0 3.868128] tilcdc 4830e000.lcdc: [drm] fb0: tilcdcdrmfb =
frame buffer<br>
&gt; device<br>
&gt; [=C2=A0 =C2=A0 3.878981] sdhci-omap 481d8000.mmc: supply pbias not fou=
nd, using dummy<br>
&gt; regulator<br>
&gt; [=C2=A0 =C2=A0 3.891295] tps6521x_pwrbutton tps65217-pwrbutton: DMA ma=
sk not set<br>
&gt; [=C2=A0 =C2=A0 3.899587] sdhci-omap 481d8000.mmc: supply vqmmc not fou=
nd, using dummy<br>
&gt; regulator<br>
&gt; [=C2=A0 =C2=A0 3.910419] input: tps65217_pwrbutton as<br>
&gt; /devices/platform/ocp/44c00000.interconnect/44c00000.interconnect:segm=
ent@200000<br>
&gt; /44e0b000.target-module/44e0b000.i2c/i2c-0/0-0<br>
&gt; [=C2=A0 =C2=A0 3.952837] mmc1: SDHCI controller on 481d8000.mmc [481d8=
000.mmc] using<br>
&gt; External DMA<br>
&gt; [=C2=A0 =C2=A0 3.961253] VFS: PARTUUID=3D is invalid.<br>
&gt; [=C2=A0 =C2=A0 3.961253] Expected PARTUUID=3D&lt;valid-uuid-id&gt;[/PA=
RTNROFF=3D%d]<br>
&gt; [=C2=A0 =C2=A0 3.970800] Disabling rootwait; root=3D is invalid.<br>
&gt; [=C2=A0 =C2=A0 3.977324] /dev/root: Can&#39;t open blockdev<br>
&gt; [=C2=A0 =C2=A0 3.981716] VFS: Cannot open root device &quot;PARTUUID=
=3D&quot; or<br>
&gt; unknown-block(0,0): error -6<br>
&gt; [=C2=A0 =C2=A0 3.989649] Please append a correct &quot;root=3D&quot; b=
oot option; here are the<br>
&gt; available partitions:<br>
&gt; [=C2=A0 =C2=A0 3.998200] b300=C2=A0 =C2=A0 =C2=A0 =C2=A0 31166976 mmcb=
lk0<br>
&gt; [=C2=A0 =C2=A0 3.998216]=C2=A0 driver: mmcblk<br>
&gt; [=C2=A0 =C2=A0 4.005313]=C2=A0 =C2=A0b301=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 131072 mmcblk0p1 076c4a2a-01<br>
&gt; [=C2=A0 =C2=A0 4.005328]<br>
&gt; [=C2=A0 =C2=A0 4.012322]=C2=A0 =C2=A0b302=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02027747 mmcblk0p2 076c4a2a-02<br>
&gt; [=C2=A0 =C2=A0 4.012334]<br>
&gt; [=C2=A0 =C2=A0 4.019437] Kernel panic - not syncing: VFS: Unable to mo=
unt root fs on<br>
&gt; unknown-block(0,0)<br>
&gt; [=C2=A0 =C2=A0 4.027753] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.1=
.69-ti #1<br>
&gt; [=C2=A0 =C2=A0 4.033966] Hardware name: Generic AM33XX (Flattened Devi=
ce Tree)<br>
&gt; [=C2=A0 =C2=A0 4.040101]=C2=A0 unwind_backtrace from show_stack+0x18/0=
x1c<br>
&gt; [=C2=A0 =C2=A0 4.045389]=C2=A0 show_stack from dump_stack_lvl+0x40/0x4=
c<br>
&gt; [=C2=A0 =C2=A0 4.050478]=C2=A0 dump_stack_lvl from panic+0x11c/0x35c<b=
r>
&gt; [=C2=A0 =C2=A0 4.055310]=C2=A0 panic from mount_block_root+0x158/0x1f4=
<br>
&gt; [=C2=A0 =C2=A0 4.060314]=C2=A0 mount_block_root from prepare_namespace=
+0x158/0x194<br>
&gt; [=C2=A0 =C2=A0 4.066358]=C2=A0 prepare_namespace from kernel_init_free=
able+0x254/0x268<br>
&gt; [=C2=A0 =C2=A0 4.072750]=C2=A0 kernel_init_freeable from kernel_init+0=
x20/0x13c<br>
&gt; [=C2=A0 =C2=A0 4.078531]=C2=A0 kernel_init from ret_from_fork+0x14/0x2=
8<br>
&gt; [=C2=A0 =C2=A0 4.083614] Exception stack(0xe0009fb0 to 0xe0009ff8)<br>
&gt; [=C2=A0 =C2=A0 4.088692] 9fa0:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A000000000 00000000<br>
&gt; 00000000 00000000<br>
&gt; [=C2=A0 =C2=A0 4.096909] 9fc0: 00000000 00000000 00000000 00000000 000=
00000 00000000<br>
&gt; 00000000 00000000<br>
&gt; [=C2=A0 =C2=A0 4.105124] 9fe0: 00000000 00000000 00000000 00000000 000=
00013 00000000<br>
&gt; [=C2=A0 =C2=A0 4.111788] ---[ end Kernel panic - not syncing: VFS: Una=
ble to mount<br>
&gt; root fs on unknown-block(0,0) ]---<br>
</blockquote></div>

--0000000000005611b10618707c6c--

