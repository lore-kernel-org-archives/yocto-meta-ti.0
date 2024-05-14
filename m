Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE3CC04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 20:24:58 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.4087.1715718291420395744
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 May 2024 13:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BRYRBTtn;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: joel.winarske@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-53fa455cd94so4831785a12.2
        for <meta-ti@lists.yoctoproject.org>; Tue, 14 May 2024 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715718291; x=1716323091; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vmUwg+r9IpxJlDnxM6VTREkBfsogD4xVn3U+Vcm/1cU=;
        b=BRYRBTtnbn0/8a2Get2BzWscT2rFnH2g32Y4XUryaZd6obVYF/ai42Y2+3/emLjOD8
         XBEZ/aQLdTP41+eGETh2N/hVke+XT6XMP1UTMmKbsRvLVZpTJVCIPtsuskSMoTQ0VRkK
         V0SRLlTxW3R6LmM89c7+zSyi37+0yLB2PqVSM/eop0FJ/8PY3ZjWKIEK+5DFlRlyB3zV
         /Ry07O0o3wVNd7ngsEPLPyHqVcak3KRXhVzW0GQRc+ZTcPWziCdyUPiDpM3za7wkytan
         okkQwZ73/8+u8VspkeKCCx31J+HCex+LbWezM7mtztY5HX5tMKs7wcvIKmdbyDGMc05F
         P/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715718291; x=1716323091;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vmUwg+r9IpxJlDnxM6VTREkBfsogD4xVn3U+Vcm/1cU=;
        b=KyXHAKNBduMszMLi+DMDKxwa5QOFI9vk4e9xywlORwN+0gSUYfSlFqvot6bCIwBGBN
         Q02hHgOK7pGNl5NMvGEeNbHcyEcdWOmuYoyvNroRnXG6Qp530Q6UyTLKVF/K8p/jIcGR
         ziZgMTcv7xQSOT+nQt20TywmkX3sj4KPQw3OKhut9K9l65tSwYlhnZ1+onuebRFu0r1X
         rajbFZ6xUbrs8dphn2WndaLAET3BTynB697sAdjQ2mG99b2qLTsquUO6iUbhyt6lUTUX
         k3UQodPcGw9L5f7RF5s/6VU1tb20zToTgQ8alZxKsGZ7r2Q5UQE8o7BfKG3hlhjuUPs8
         HE3A==
X-Gm-Message-State: AOJu0YyS/E0pi5+75jIN42B5rJAcUzgjXNr2HvHVdVKPBHr4+ra7QKth
	6HCLR+atswx0DXzg4diinRprzo53QGhSOIiAT4MQOBExYuLmYqczaWdKfa+ebrgHKFBBkorOrZ/
	vQfnNxsPBpjAyCDqpnwXZ5GLwRpxTchxk
X-Google-Smtp-Source: AGHT+IFPtKmG8mireL4Kb8duAb/VOVNIyQ0rby/HNcxX4LaR4gcl+lo7XgxGuYOAwGug6jJLLLaTUmu8TL0QIRApF7M=
X-Received: by 2002:a17:90a:bb89:b0:2b9:c7ad:c99f with SMTP id
 98e67ed59e1d1-2b9c7adca08mr445908a91.9.1715718289949; Tue, 14 May 2024
 13:24:49 -0700 (PDT)
MIME-Version: 1.0
From: Joel Winarske <joel.winarske@gmail.com>
Date: Tue, 14 May 2024 13:24:37 -0700
Message-ID: <CABKMkPJ8grzYqQv22xU4pEKSxhoxx0voSSt_KzGT-13xyDQN0A@mail.gmail.com>
Subject: beagle bone black - scarthgap
To: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000350e5506186fcb42"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 May 2024 20:24:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17656

--000000000000350e5506186fcb42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What's the status of bbb on scarthgap?

Three weeks or so ago it would boot, only SGX driver was not loading.

Today I get a kernel panic.  Last week Scott Murray was saying to set
kernel preference to 6.1, which appears to be the default now.

I would appreciate any assistance with this.


U-Boot SPL 2019.04-00002-g31a8ae0206 (May 13 2020 - 09:26:17 -0500)
Trying to boot from MMC2
Loading Environment from EXT4...
** Unable to use mmc 0:1 for loading the env **


U-Boot 2019.04-00002-g31a8ae0206 (May 13 2020 - 09:26:17 -0500), Build:
jenkins-github_Bootloader-Builder-139

CPU  : AM335X-GP rev 2.1
I2C:   ready
DRAM:  512 MiB
No match for driver 'omap_hsmmc'
No match for driver 'omap_hsmmc'
Some drivers were not found
Reset Source: Power-on reset has occurred.
RTC 32KCLK Source: External.
MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
Loading Environment from EXT4...
** Unable to use mmc 0:1 for loading the env **
Board: BeagleBone Black
<ethaddr> not set. Validating first E-fuse MAC
BeagleBone Black:
BeagleBone: cape eeprom: i2c_probe: 0x54:
BeagleBone: cape eeprom: i2c_probe: 0x55:
BeagleBone: cape eeprom: i2c_probe: 0x56:
BeagleBone: cape eeprom: i2c_probe: 0x57:
Net:   eth0: MII MODE
cpsw, usb_ether
Press SPACE to abort autoboot in 0 seconds
board_name=3D[A335BNLT] ...
board_rev=3D[00C0] ...
switch to partitions #0, OK
mmc0 is current device
SD/MMC found on device 0
switch to partitions #0, OK
mmc0 is current device
Scanning mmc 0:1...
Found /extlinux/extlinux.conf
Retrieving file: /extlinux/extlinux.conf
218 bytes read in 6 ms (35.2 KiB/s)
1:      Poky (Yocto Project Reference Distro)
Retrieving file: /extlinux/../zImage
12653056 bytes read in 800 ms (15.1 MiB/s)
append: root=3DPARTUUID=3D rootwait rw earlycon console=3DttyO0,115200n8,11=
5200
Retrieving file: /extlinux/../am335x-boneblack.dtb
99078 bytes read in 13 ms (7.3 MiB/s)
## Flattened Device Tree blob at 88000000
   Booting using the fdt blob at 0x88000000
   Loading Device Tree to 8ffe4000, end 8ffff305 ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.1.69-ti (oe-user@oe-host)
(arm-poky-linux-gnueabi-gcc (GCC) 13.2.0, GNU ld (GNU Binutils)
2.42.0.20240216) #1 SMP PREEMPT Mon Jan 29 18:204
[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7),
cr=3D10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] OF: fdt: Machine model: TI AM335x BeagleBone Black
[    0.000000] earlycon: omap8250 at MMIO 0x44e09000 (options '')
[    0.000000] printk: bootconsole [omap8250] enabled
[    0.000000] Memory policy: Data cache writeback
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 48 MiB at 0x9c800000
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000080000000-0x000000009fdfffff]
[    0.000000]   HighMem  empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x000000009fdfffff]
[    0.000000] Initmem setup node 0 [mem
0x0000000080000000-0x000000009fdfffff]
[    0.000000] CPU: All CPU(s) started in SVC mode.
[    0.000000] AM335X ES2.1 (sgx neon)
[    0.000000] percpu: Embedded 18 pages/cpu s41428 r8192 d24108 u73728
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 12941=
2
[    0.000000] Kernel command line: root=3DPARTUUID=3D rootwait rw earlycon
console=3DttyO0,115200n8,115200
[    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144
bytes, linear)
[    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072
bytes, linear)
[    0.000000] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.000000] Memory: 442892K/522240K available (16384K kernel code, 1686K
rwdata, 4440K rodata, 1024K init, 455K bss, 30196K reserved, 49152K
cma-reserved, 0K highmem)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1
[    0.000000] ftrace: allocating 50610 entries in 149 pages
[    0.000000] ftrace: allocated 149 pages with 4 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D2 to nr_cpu_ids=
=3D1.
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is
25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D1
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] IRQ: Found an INTC at 0x(ptrval) (revision 5.0) with 128
interrupts
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on
contention.
[    0.000000] TI gptimer clocksource: always-on /ocp/interconnect@44c00000
/segment@200000/target-module@31000
[    0.000002] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every
89478484971ns
[    0.008068] clocksource: dmtimer: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 79635851949 ns
[    0.018002] TI gptimer clockevent: 24000000 Hz at
/ocp/interconnect@48000000/segment@0/target-module@40000
[    0.029329] Console: colour dummy device 80x30
[    0.034029] WARNING: Your 'console=3DttyO0' has been replaced by 'ttyS0'
[    0.040765] This ensures that you still see kernel messages. Please
[    0.047223] update your kernel commandline.
[    0.051587] Calibrating delay loop... 995.32 BogoMIPS (lpj=3D1990656)
[    0.074478] CPU: Testing write buffer coherency: ok
[    0.079591] CPU0: Spectre v2: using BPIALL workaround
[    0.084801] pid_max: default: 32768 minimum: 301
[    0.090028] LSM: Security Framework initializing
[    0.094923] landlock: Up and running.
[    0.098710] Yama: becoming mindful.
[    0.102614] AppArmor: AppArmor initialized
[    0.106865] TOMOYO Linux initialized
[    0.110599] LSM support for eBPF active
[    0.114831] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes,
linear)
[    0.122385] Mountpoint-cache hash table entries: 1024 (order: 0, 4096
bytes, linear)
[    0.134142] cblist_init_generic: Setting adjustable number of callback
queues.
[    0.141692] cblist_init_generic: Setting shift to 0 and lim to 1.
[    0.148206] cblist_init_generic: Setting adjustable number of callback
queues.
[    0.155687] cblist_init_generic: Setting shift to 0 and lim to 1.
[    0.162178] cblist_init_generic: Setting adjustable number of callback
queues.
[    0.169653] cblist_init_generic: Setting shift to 0 and lim to 1.
[    0.176195] Setting up static identity map for 0x80100000 - 0x80100060
[    0.183196] rcu: Hierarchical SRCU implementation.
[    0.188174] rcu:     Max phase no-delay instances is 1000.
[    0.195209] EFI services will not be available.
[    0.200736] smp: Bringing up secondary CPUs ...
[    0.205481] smp: Brought up 1 node, 1 CPU
[    0.209628] SMP: Total of 1 processors activated (995.32 BogoMIPS).
[    0.216099] CPU: All CPU(s) started in SVC mode.
[    0.221891] devtmpfs: initialized
[    0.248887] VFP support v0.3: implementor 41 architecture 3 part 30
variant c rev 3
[    0.257438] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.267544] futex hash table entries: 256 (order: 2, 16384 bytes, linear=
)
[    0.279749] pinctrl core: initialized pinctrl subsystem
[    0.286562] DMI not present or invalid.
[    0.291573] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.306527] DMA: preallocated 256 KiB pool for atomic coherent
allocations
[    0.314286] audit: initializing netlink subsys (disabled)
[    0.321360] thermal_sys: Registered thermal governor 'fair_share'
[    0.321384] thermal_sys: Registered thermal governor 'bang_bang'
[    0.327762] audit: type=3D2000 audit(0.232:1): state=3Dinitialized
audit_enabled=3D0 res=3D1
[    0.341952] thermal_sys: Registered thermal governor 'step_wise'
[    0.341961] thermal_sys: Registered thermal governor 'user_space'
[    0.348159] thermal_sys: Registered thermal governor 'power_allocator'
[    0.354588] cpuidle: using governor ladder
[    0.365590] cpuidle: using governor menu
[    0.392937] hw-breakpoint: debug architecture 0x4 unsupported.
[    0.413611] kprobes: kprobe jump-optimization is enabled. All kprobes
are optimized if possible.
[    0.441354] raid6: skipped pq benchmark and selected neonx8
[    0.452017] raid6: using neon recovery algorithm
[    0.468087] iommu: Default domain type: Translated
[    0.473185] iommu: DMA domain TLB invalidation policy: strict mode
[    0.489780] SCSI subsystem initialized
[    0.501001] usbcore: registered new interface driver usbfs
[    0.512146] usbcore: registered new interface driver hub
[    0.524089] usbcore: registered new device driver usb
[    0.536781] pps_core: LinuxPPS API ver. 1 registered
[    0.548015] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti@linux.it>
[    0.564043] PTP clock support registered
[    0.577552] NetLabel: Initializing
[    0.588018] NetLabel:  domain hash size =3D 128
[    0.592525] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.604158] NetLabel:  unlabeled traffic allowed by default
[    0.620692] clocksource: Switched to clocksource dmtimer
[    0.634086] VFS: Disk quotas dquot_6.6.0
[    0.644882] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096
bytes)
[    0.656972] FS-Cache: Loaded
[    0.664821] CacheFiles: Loaded
[    0.673204] AppArmor: AppArmor Filesystem Enabled
[    0.704059] NET: Registered PF_INET protocol family
[    0.717040] IP idents hash table entries: 8192 (order: 4, 65536 bytes,
linear)
[    0.734482] tcp_listen_portaddr_hash hash table entries: 512 (order: 0,
4096 bytes, linear)
[    0.752899] Table-perturb hash table entries: 65536 (order: 6, 262144
bytes, linear)
[    0.768718] TCP established hash table entries: 4096 (order: 2, 16384
bytes, linear)
[    0.784765] TCP bind hash table entries: 4096 (order: 4, 65536 bytes,
linear)
[    0.800775] TCP: Hash tables configured (established 4096 bind 4096)
[    0.813054] MPTCP token hash table entries: 512 (order: 1, 8192 bytes,
linear)
[    0.828795] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.844723] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes,
linear)
[    0.857230] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.873449] RPC: Registered named UNIX socket transport module.
[    0.884695] RPC: Registered udp transport module.
[    0.892688] RPC: Registered tcp transport module.
[    0.904698] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.916707] NET: Registered PF_XDP protocol family
[    2.057584] Initialise system trusted keyrings
[    2.064353] workingset: timestamp_bits=3D14 max_order=3D17 bucket_order=
=3D3
[    2.081692] zbud: loaded
[    2.089227] NFS: Registering the id_resolver key type
[    2.094600] Key type id_resolver registered
[    2.098937] Key type id_legacy registered
[    2.103293] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    2.110222] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
Registering...
[    2.117932] jffs2: version 2.2. (NAND) (SUMMARY)  =C2=A9 2001-2006 Red H=
at,
Inc.
[    2.126320] fuse: init (API version 7.37)
[    2.223398] NET: Registered PF_ALG protocol family
[    2.228520] xor: measuring software checksum speed
[    2.241238]    arm4regs        :  1270 MB/sec
[    2.254710]    8regs           :  1099 MB/sec
[    2.268180]    32regs          :  1099 MB/sec
[    2.278200]    neon            :  1783 MB/sec
[    2.282696] xor: using function: neon (1783 MB/sec)
[    2.287741] Key type asymmetric registered
[    2.291976] Asymmetric key parser 'x509' registered
[    2.299642] alg: self-tests for CTR-KDF (hmac(sha256)) passed
[    2.306168] Block layer SCSI generic (bsg) driver version 0.4 loaded
(major 244)
[    2.314270] io scheduler mq-deadline registered
[    2.326615] Serial: 8250/16550 driver, 6 ports, IRQ sharing disabled
[    2.354956] loop: module loaded
[    2.358858] SPI driver tps6594 has no spi_device_id for ti,tps6594-q1
[    2.365541] SPI driver tps6594 has no spi_device_id for ti,tps6593-q1
[    2.372185] SPI driver tps6594 has no spi_device_id for ti,lp8764-q1
[    2.383380] usbcore: registered new interface driver smsc95xx
[    2.393632] i2c_dev: i2c /dev entries driver
[    2.398311] Driver for 1-wire Dallas network protocol.
[    2.405002] softdog: initialized. soft_noboot=3D0 soft_margin=3D60 sec
soft_panic=3D0 (nowayout=3D0)
[    2.413734] softdog:              soft_reboot_cmd=3D<not set>
soft_active_on_boot=3D0
[    2.422541] cpuidle: enable-method property 'ti,am3352' found operations
[    2.430352] sdhci: Secure Digital Host Controller Interface driver
[    2.436776] sdhci: Copyright(c) Pierre Ossman
[    2.441277] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.447615] ledtrig-cpu: registered to indicate activity on CPUs
[    2.454533] hid: raw HID events driver (C) Jiri Kosina
[    2.460601] usbcore: registered new interface driver usbhid
[    2.466401] usbhid: USB HID core driver
[    2.472766] NET: Registered PF_INET6 protocol family
[    2.482755] Segment Routing with IPv6
[    2.486926] In-situ OAM (IOAM) with IPv6
[    2.491263] mip6: Mobile IPv6
[    2.494566] NET: Registered PF_PACKET protocol family
[    2.500227] Key type dns_resolver registered
[    2.504771] mpls_gso: MPLS GSO support
[    2.508856] ThumbEE CPU extension supported.
[    2.513298] Registering SWP/SWPB emulation handler
[    2.518251] omap_voltage_late_init: Voltage driver support not added
[    2.526359] registered taskstats version 1
[    2.530792] Loading compiled-in X.509 certificates
[    2.536739] zswap: loaded using pool lzo/zbud
[    2.542631] Key type .fscrypt registered
[    2.546840] Key type fscrypt-provisioning registered
[    2.561788] Btrfs loaded, crc32c=3Dcrc32c-generic, zoned=3Dyes, fsverity=
=3Dyes
[    2.571469] Key type encrypted registered
[    2.575883] AppArmor: AppArmor sha1 policy hashing enabled
[    2.581759] ima: No TPM chip found, activating TPM-bypass!
[    2.587664] ima: Allocated hash algorithm: sha256
[    2.592803] ima: No architecture policies found
[    2.597661] evm: Initialising EVM extended attributes:
[    2.602985] evm: security.selinux
[    2.606412] evm: security.SMACK64 (disabled)
[    2.610825] evm: security.SMACK64EXEC (disabled)
[    2.615587] evm: security.SMACK64TRANSMUTE (disabled)
[    2.620799] evm: security.SMACK64MMAP (disabled)
[    2.625560] evm: security.apparmor
[    2.629071] evm: security.ima
[    2.632121] evm: security.capability
[    2.635810] evm: HMAC attrs: 0x1
[    2.683301] remoteproc remoteproc0: wkup_m3 is available
[    2.702524] pinctrl-single 44e10800.pinmux: 142 pins, size 568
[    2.715024] ti-sysc: probe of 44e31000.target-module failed with error
-16
[    2.726119] omap_wdt: OMAP Watchdog Timer Rev 0x01: initial timeout 60
sec
[    2.737737] omap_rtc 44e3e000.rtc: registered as rtc0
[    2.743061] omap_rtc 44e3e000.rtc: setting system clock to
2000-01-01T00:00:00 UTC (946684800)
[    2.763281] ti-sysc: probe of 48040000.target-module failed with error
-16
[    2.785171] gpio gpiochip0: (gpio-0-31): not an immutable chip, please
consider fixing it!
[    2.794444] OMAP GPIO hardware version 0.1
[    2.805375] omap-mailbox 480c8000.mailbox: omap mailbox rev 0x400
[    2.818643] at24 2-0054: supply vcc not found, using dummy regulator
[    2.856849] at24 2-0055: supply vcc not found, using dummy regulator
[    2.892531] at24 2-0056: supply vcc not found, using dummy regulator
[    2.928560] at24 2-0057: supply vcc not found, using dummy regulator
[    2.964125] omap_i2c 4819c000.i2c: bus 2 rev0.11 at 100 kHz
[    2.975562] gpio gpiochip1: (gpio-32-63): not an immutable chip, please
consider fixing it!
[    2.987140] gpio gpiochip2: (gpio-64-95): not an immutable chip, please
consider fixing it!
[    3.001969] sdhci-omap 481d8000.mmc: supply pbias not found, using dummy
regulator
[    3.018359] sdhci-omap 481d8000.mmc: supply vqmmc not found, using dummy
regulator
[    3.028511] omap_rng 48310000.rng: Random Number Generator ver. 20
[    3.035855] random: crng init done
[    3.092730] davinci_mdio 4a101000.mdio: davinci mdio revision 1.6, bus
freq 1000000
[    3.126125] SMSC LAN8710/LAN8720: probe of 4a101000.mdio:00 failed with
error -5
[    3.133894] davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00,
driver SMSC LAN8710/LAN8720
[    3.144040] cpsw-switch 4a100000.switch: initialized cpsw ale version 1.=
4
[    3.151110] cpsw-switch 4a100000.switch: ALE Table size 1024
[    3.157084] cpsw-switch 4a100000.switch: cpts: overflow check period
1250 (jiffies)
[    3.165001] cpsw-switch 4a100000.switch: CPTS: ref_clk_freq:250000000
calc_mult:2147483648 calc_shift:29 error:0 nsec/sec
[    3.176410] cpsw-switch 4a100000.switch: Detected MACID =3D
68:5e:1c:03:07:bf
[    3.185575] cpsw-switch 4a100000.switch: initialized (regs 0x4a100000,
pool size 256) hw_ver:0019010C 1.12 (0)
[    3.210379] debugfs: Directory '49000000.dma' with parent 'dmaengine'
already present!
[    3.218638] edma 49000000.dma: TI EDMA DMA engine driver
[    3.230547] am335x-phy-driver 47401300.usb-phy: supply vcc not found,
using dummy regulator
[    3.239674] am335x-phy-driver 47401300.usb-phy: dummy supplies not
allowed for exclusive requests
[    3.255611] am335x-phy-driver 47401b00.usb-phy: supply vcc not found,
using dummy regulator
[    3.264906] am335x-phy-driver 47401b00.usb-phy: dummy supplies not
allowed for exclusive requests
[    3.288119] musb-hdrc musb-hdrc.1: MUSB HDRC host driver
[    3.293805] musb-hdrc musb-hdrc.1: new USB bus registered, assigned bus
number 1
[    3.301785] usb usb1: New USB device found, idVendor=3D1d6b,
idProduct=3D0002, bcdDevice=3D 6.01
[    3.310336] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    3.317791] usb usb1: Product: MUSB HDRC host driver
[    3.322915] usb usb1: Manufacturer: Linux 6.1.69-ti musb-hcd
[    3.328755] usb usb1: SerialNumber: musb-hdrc.1
[    3.334399] hub 1-0:1.0: USB hub found
[    3.338446] hub 1-0:1.0: 1 port detected
[    3.364408] omap-sham 53100000.sham: hw accel on OMAP rev 4.3
[    3.370789] omap-sham 53100000.sham: will run requests pump with
realtime priority
[    3.382899] omap-aes 53500000.aes: OMAP AES hw accel rev: 3.2
[    3.389523] omap-aes 53500000.aes: will run requests pump with realtime
priority
[    3.405436] hw perfevents: enabled with armv7_cortex_a8 PMU driver, 5
counters available
[    3.419147] l3-aon-clkctrl:0000:0: failed to disable
[    3.427855] gpio gpiochip3: (gpio-96-127): not an immutable chip, please
consider fixing it!
[    3.439204] 44e09000.serial: ttyS0 at MMIO 0x44e09000 (irq =3D 41,
base_baud =3D 3000000) is a 8250
[    3.448493] printk: console [ttyS0] enabled
[    3.448493] printk: console [ttyS0] enabled
[    3.457110] printk: bootconsole [omap8250] disabled
[    3.457110] printk: bootconsole [omap8250] disabled
[    3.493448] tps65217-pmic: Failed to locate of_node [id: -1]
[    3.510500] tps65217-bl: Failed to locate of_node [id: -1]
[    3.520003] tps65217 0-0024: TPS65217 ID 0xe version 1.2
[    3.527310] at24 0-0050: 32768 byte 24c256 EEPROM, writable, 1
bytes/write
[    3.534718] i2c 0-0070: Fixed dependency cycle(s) with
/ocp/interconnect@48000000/segment@300000/target-module@e000/lcdc@0
/port/endpoint@0
[    3.667523] tda998x 0-0070: found TDA19988
[    3.675108] omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 kHz
[    3.683307] omap_gpio 44e07000.gpio: Could not set line 6 debounce to
200000 microseconds (-22)
[    3.693654] tilcdc 4830e000.lcdc: bound 0-0070 (ops 0xc11bf9a8)
[    3.699748] sdhci-omap 48060000.mmc: Got CD GPIO
[    3.705997] [drm] Initialized tilcdc 1.0.0 20121205 for 4830e000.lcdc on
minor 0
[    3.713860] sdhci-omap 48060000.mmc: supply pbias not found, using dummy
regulator
[    3.723323] sdhci-omap 48060000.mmc: supply vqmmc not found, using dummy
regulator
[    3.757212] mmc0: SDHCI controller on 48060000.mmc [48060000.mmc] using
External DMA
[    3.828717] mmc0: new high speed SDHC card at address aaaa
[    3.833620] mmcblk0: mmc0:aaaa SD32G 29.7 GiB
[    3.837419]  mmcblk0: p1 p2
[    3.839151] Console: switching to colour frame buffer device 160x64
[    3.868128] tilcdc 4830e000.lcdc: [drm] fb0: tilcdcdrmfb frame buffer
device
[    3.878981] sdhci-omap 481d8000.mmc: supply pbias not found, using dummy
regulator
[    3.891295] tps6521x_pwrbutton tps65217-pwrbutton: DMA mask not set
[    3.899587] sdhci-omap 481d8000.mmc: supply vqmmc not found, using dummy
regulator
[    3.910419] input: tps65217_pwrbutton as
/devices/platform/ocp/44c00000.interconnect/44c00000.interconnect:segment@2=
00000
/44e0b000.target-module/44e0b000.i2c/i2c-0/0-0
[    3.952837] mmc1: SDHCI controller on 481d8000.mmc [481d8000.mmc] using
External DMA
[    3.961253] VFS: PARTUUID=3D is invalid.
[    3.961253] Expected PARTUUID=3D<valid-uuid-id>[/PARTNROFF=3D%d]
[    3.970800] Disabling rootwait; root=3D is invalid.
[    3.977324] /dev/root: Can't open blockdev
[    3.981716] VFS: Cannot open root device "PARTUUID=3D" or
unknown-block(0,0): error -6
[    3.989649] Please append a correct "root=3D" boot option; here are the
available partitions:
[    3.998200] b300        31166976 mmcblk0
[    3.998216]  driver: mmcblk
[    4.005313]   b301          131072 mmcblk0p1 076c4a2a-01
[    4.005328]
[    4.012322]   b302         2027747 mmcblk0p2 076c4a2a-02
[    4.012334]
[    4.019437] Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)
[    4.027753] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.1.69-ti #1
[    4.033966] Hardware name: Generic AM33XX (Flattened Device Tree)
[    4.040101]  unwind_backtrace from show_stack+0x18/0x1c
[    4.045389]  show_stack from dump_stack_lvl+0x40/0x4c
[    4.050478]  dump_stack_lvl from panic+0x11c/0x35c
[    4.055310]  panic from mount_block_root+0x158/0x1f4
[    4.060314]  mount_block_root from prepare_namespace+0x158/0x194
[    4.066358]  prepare_namespace from kernel_init_freeable+0x254/0x268
[    4.072750]  kernel_init_freeable from kernel_init+0x20/0x13c
[    4.078531]  kernel_init from ret_from_fork+0x14/0x28
[    4.083614] Exception stack(0xe0009fb0 to 0xe0009ff8)
[    4.088692] 9fa0:                                     00000000 00000000
00000000 00000000
[    4.096909] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
[    4.105124] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    4.111788] ---[ end Kernel panic - not syncing: VFS: Unable to mount
root fs on unknown-block(0,0) ]---

--000000000000350e5506186fcb42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>What&#39;s the status of bbb on scarthgap?</div><div>=
<br></div><div>Three weeks or so ago it would boot, only SGX driver was not=
 loading.</div><div><br></div><div>Today I get a kernel panic.=C2=A0 Last w=
eek Scott Murray was saying to set kernel preference to 6.1, which appears =
to be the default now.<br></div><div><br></div><div>I would appreciate any =
assistance with this.</div><div><br></div><div><br>U-Boot SPL 2019.04-00002=
-g31a8ae0206 (May 13 2020 - 09:26:17 -0500)<br>Trying to boot from MMC2<br>=
Loading Environment from EXT4... <br>** Unable to use mmc 0:1 for loading t=
he env **<br><br><br>U-Boot 2019.04-00002-g31a8ae0206 (May 13 2020 - 09:26:=
17 -0500), Build: jenkins-github_Bootloader-Builder-139<br><br>CPU =C2=A0: =
AM335X-GP rev 2.1<br>I2C: =C2=A0 ready<br>DRAM: =C2=A0512 MiB<br>No match f=
or driver &#39;omap_hsmmc&#39;<br>No match for driver &#39;omap_hsmmc&#39;<=
br>Some drivers were not found<br>Reset Source: Power-on reset has occurred=
.<br>RTC 32KCLK Source: External.<br>MMC: =C2=A0 OMAP SD/MMC: 0, OMAP SD/MM=
C: 1<br>Loading Environment from EXT4... <br>** Unable to use mmc 0:1 for l=
oading the env **<br>Board: BeagleBone Black<br>&lt;ethaddr&gt; not set. Va=
lidating first E-fuse MAC<br>BeagleBone Black:<br>BeagleBone: cape eeprom: =
i2c_probe: 0x54:<br>BeagleBone: cape eeprom: i2c_probe: 0x55:<br>BeagleBone=
: cape eeprom: i2c_probe: 0x56:<br>BeagleBone: cape eeprom: i2c_probe: 0x57=
:<br>Net: =C2=A0 eth0: MII MODE<br>cpsw, usb_ether<br>Press SPACE to abort =
autoboot in 0 seconds<br>board_name=3D[A335BNLT] ...<br>board_rev=3D[00C0] =
...<br>switch to partitions #0, OK<br>mmc0 is current device<br>SD/MMC foun=
d on device 0<br>switch to partitions #0, OK<br>mmc0 is current device<br>S=
canning mmc 0:1...<br>Found /extlinux/extlinux.conf<br>Retrieving file: /ex=
tlinux/extlinux.conf<br>218 bytes read in 6 ms (35.2 KiB/s)<br>1: =C2=A0 =
=C2=A0 =C2=A0Poky (Yocto Project Reference Distro)<br>Retrieving file: /ext=
linux/../zImage<br>12653056 bytes read in 800 ms (15.1 MiB/s)<br>append: ro=
ot=3DPARTUUID=3D rootwait rw earlycon console=3DttyO0,115200n8,115200<br>Re=
trieving file: /extlinux/../am335x-boneblack.dtb<br>99078 bytes read in 13 =
ms (7.3 MiB/s)<br>## Flattened Device Tree blob at 88000000<br>=C2=A0 =C2=
=A0Booting using the fdt blob at 0x88000000<br>=C2=A0 =C2=A0Loading Device =
Tree to 8ffe4000, end 8ffff305 ... OK<br><br>Starting kernel ...<br><br>[ =
=C2=A0 =C2=A00.000000] Booting Linux on physical CPU 0x0<br>[ =C2=A0 =C2=A0=
0.000000] Linux version 6.1.69-ti (oe-user@oe-host) (arm-poky-linux-gnueabi=
-gcc (GCC) 13.2.0, GNU ld (GNU Binutils) 2.42.0.20240216) #1 SMP PREEMPT Mo=
n Jan 29 18:204<br>[ =C2=A0 =C2=A00.000000] CPU: ARMv7 Processor [413fc082]=
 revision 2 (ARMv7), cr=3D10c5387d<br>[ =C2=A0 =C2=A00.000000] CPU: PIPT / =
VIPT nonaliasing data cache, VIPT aliasing instruction cache<br>[ =C2=A0 =
=C2=A00.000000] OF: fdt: Machine model: TI AM335x BeagleBone Black<br>[ =C2=
=A0 =C2=A00.000000] earlycon: omap8250 at MMIO 0x44e09000 (options &#39;&#3=
9;)<br>[ =C2=A0 =C2=A00.000000] printk: bootconsole [omap8250] enabled<br>[=
 =C2=A0 =C2=A00.000000] Memory policy: Data cache writeback<br>[ =C2=A0 =C2=
=A00.000000] efi: UEFI not found.<br>[ =C2=A0 =C2=A00.000000] cma: Reserved=
 48 MiB at 0x9c800000<br>[ =C2=A0 =C2=A00.000000] Zone ranges:<br>[ =C2=A0 =
=C2=A00.000000] =C2=A0 Normal =C2=A0 [mem 0x0000000080000000-0x000000009fdf=
ffff]<br>[ =C2=A0 =C2=A00.000000] =C2=A0 HighMem =C2=A0empty<br>[ =C2=A0 =
=C2=A00.000000] Movable zone start for each node<br>[ =C2=A0 =C2=A00.000000=
] Early memory node ranges<br>[ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0=
: [mem 0x0000000080000000-0x000000009fdfffff]<br>[ =C2=A0 =C2=A00.000000] I=
nitmem setup node 0 [mem 0x0000000080000000-0x000000009fdfffff]<br>[ =C2=A0=
 =C2=A00.000000] CPU: All CPU(s) started in SVC mode.<br>[ =C2=A0 =C2=A00.0=
00000] AM335X ES2.1 (sgx neon)<br>[ =C2=A0 =C2=A00.000000] percpu: Embedded=
 18 pages/cpu s41428 r8192 d24108 u73728<br>[ =C2=A0 =C2=A00.000000] Built =
1 zonelists, mobility grouping on.=C2=A0 Total pages: 129412<br>[ =C2=A0 =
=C2=A00.000000] Kernel command line: root=3DPARTUUID=3D rootwait rw earlyco=
n console=3DttyO0,115200n8,115200<br>[ =C2=A0 =C2=A00.000000] Dentry cache =
hash table entries: 65536 (order: 6, 262144 bytes, linear)<br>[ =C2=A0 =C2=
=A00.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 bytes,=
 linear)<br>[ =C2=A0 =C2=A00.000000] mem auto-init: stack:all(zero), heap a=
lloc:on, heap free:off<br>[ =C2=A0 =C2=A00.000000] Memory: 442892K/522240K =
available (16384K kernel code, 1686K rwdata, 4440K rodata, 1024K init, 455K=
 bss, 30196K reserved, 49152K cma-reserved, 0K highmem)<br>[ =C2=A0 =C2=A00=
.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=
=3D1<br>[ =C2=A0 =C2=A00.000000] ftrace: allocating 50610 entries in 149 pa=
ges<br>[ =C2=A0 =C2=A00.000000] ftrace: allocated 149 pages with 4 groups<b=
r>[ =C2=A0 =C2=A00.000000] trace event string verifier disabled<br>[ =C2=A0=
 =C2=A00.000000] rcu: Preemptible hierarchical RCU implementation.<br>[ =C2=
=A0 =C2=A00.000000] rcu: =C2=A0 =C2=A0 RCU restricting CPUs from NR_CPUS=3D=
2 to nr_cpu_ids=3D1.<br>[ =C2=A0 =C2=A00.000000] =C2=A0Trampoline variant o=
f Tasks RCU enabled.<br>[ =C2=A0 =C2=A00.000000] =C2=A0Rude variant of Task=
s RCU enabled.<br>[ =C2=A0 =C2=A00.000000] =C2=A0Tracing variant of Tasks R=
CU enabled.<br>[ =C2=A0 =C2=A00.000000] rcu: RCU calculated value of schedu=
ler-enlistment delay is 25 jiffies.<br>[ =C2=A0 =C2=A00.000000] rcu: Adjust=
ing geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D1<br>[ =C2=A0 =C2=A00.0=
00000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16<br>[ =C2=A0 =C2=A00.=
000000] IRQ: Found an INTC at 0x(ptrval) (revision 5.0) with 128 interrupts=
<br>[ =C2=A0 =C2=A00.000000] rcu: srcu_init: Setting srcu_struct sizes base=
d on contention.<br>[ =C2=A0 =C2=A00.000000] TI gptimer clocksource: always=
-on /ocp/interconnect@44c00000/segment@200000/target-module@31000<br>[ =C2=
=A0 =C2=A00.000002] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps e=
very 89478484971ns<br>[ =C2=A0 =C2=A00.008068] clocksource: dmtimer: mask: =
0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635851949 ns<br>[ =C2=A0 =
=C2=A00.018002] TI gptimer clockevent: 24000000 Hz at /ocp/interconnect@480=
00000/segment@0/target-module@40000<br>[ =C2=A0 =C2=A00.029329] Console: co=
lour dummy device 80x30<br>[ =C2=A0 =C2=A00.034029] WARNING: Your &#39;cons=
ole=3DttyO0&#39; has been replaced by &#39;ttyS0&#39;<br>[ =C2=A0 =C2=A00.0=
40765] This ensures that you still see kernel messages. Please<br>[ =C2=A0 =
=C2=A00.047223] update your kernel commandline.<br>[ =C2=A0 =C2=A00.051587]=
 Calibrating delay loop... 995.32 BogoMIPS (lpj=3D1990656)<br>[ =C2=A0 =C2=
=A00.074478] CPU: Testing write buffer coherency: ok<br>[ =C2=A0 =C2=A00.07=
9591] CPU0: Spectre v2: using BPIALL workaround<br>[ =C2=A0 =C2=A00.084801]=
 pid_max: default: 32768 minimum: 301<br>[ =C2=A0 =C2=A00.090028] LSM: Secu=
rity Framework initializing<br>[ =C2=A0 =C2=A00.094923] landlock: Up and ru=
nning.<br>[ =C2=A0 =C2=A00.098710] Yama: becoming mindful.<br>[ =C2=A0 =C2=
=A00.102614] AppArmor: AppArmor initialized<br>[ =C2=A0 =C2=A00.106865] TOM=
OYO Linux initialized<br>[ =C2=A0 =C2=A00.110599] LSM support for eBPF acti=
ve<br>[ =C2=A0 =C2=A00.114831] Mount-cache hash table entries: 1024 (order:=
 0, 4096 bytes, linear)<br>[ =C2=A0 =C2=A00.122385] Mountpoint-cache hash t=
able entries: 1024 (order: 0, 4096 bytes, linear)<br>[ =C2=A0 =C2=A00.13414=
2] cblist_init_generic: Setting adjustable number of callback queues.<br>[ =
=C2=A0 =C2=A00.141692] cblist_init_generic: Setting shift to 0 and lim to 1=
.<br>[ =C2=A0 =C2=A00.148206] cblist_init_generic: Setting adjustable numbe=
r of callback queues.<br>[ =C2=A0 =C2=A00.155687] cblist_init_generic: Sett=
ing shift to 0 and lim to 1.<br>[ =C2=A0 =C2=A00.162178] cblist_init_generi=
c: Setting adjustable number of callback queues.<br>[ =C2=A0 =C2=A00.169653=
] cblist_init_generic: Setting shift to 0 and lim to 1.<br>[ =C2=A0 =C2=A00=
.176195] Setting up static identity map for 0x80100000 - 0x80100060<br>[ =
=C2=A0 =C2=A00.183196] rcu: Hierarchical SRCU implementation.<br>[ =C2=A0 =
=C2=A00.188174] rcu: =C2=A0 =C2=A0 Max phase no-delay instances is 1000.<br=
>[ =C2=A0 =C2=A00.195209] EFI services will not be available.<br>[ =C2=A0 =
=C2=A00.200736] smp: Bringing up secondary CPUs ...<br>[ =C2=A0 =C2=A00.205=
481] smp: Brought up 1 node, 1 CPU<br>[ =C2=A0 =C2=A00.209628] SMP: Total o=
f 1 processors activated (995.32 BogoMIPS).<br>[ =C2=A0 =C2=A00.216099] CPU=
: All CPU(s) started in SVC mode.<br>[ =C2=A0 =C2=A00.221891] devtmpfs: ini=
tialized<br>[ =C2=A0 =C2=A00.248887] VFP support v0.3: implementor 41 archi=
tecture 3 part 30 variant c rev 3<br>[ =C2=A0 =C2=A00.257438] clocksource: =
jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 764504178510=
0000 ns<br>[ =C2=A0 =C2=A00.267544] futex hash table entries: 256 (order: 2=
, 16384 bytes, linear)<br>[ =C2=A0 =C2=A00.279749] pinctrl core: initialize=
d pinctrl subsystem<br>[ =C2=A0 =C2=A00.286562] DMI not present or invalid.=
<br>[ =C2=A0 =C2=A00.291573] NET: Registered PF_NETLINK/PF_ROUTE protocol f=
amily<br>[ =C2=A0 =C2=A00.306527] DMA: preallocated 256 KiB pool for atomic=
 coherent allocations<br>[ =C2=A0 =C2=A00.314286] audit: initializing netli=
nk subsys (disabled)<br>[ =C2=A0 =C2=A00.321360] thermal_sys: Registered th=
ermal governor &#39;fair_share&#39;<br>[ =C2=A0 =C2=A00.321384] thermal_sys=
: Registered thermal governor &#39;bang_bang&#39;<br>[ =C2=A0 =C2=A00.32776=
2] audit: type=3D2000 audit(0.232:1): state=3Dinitialized audit_enabled=3D0=
 res=3D1<br>[ =C2=A0 =C2=A00.341952] thermal_sys: Registered thermal govern=
or &#39;step_wise&#39;<br>[ =C2=A0 =C2=A00.341961] thermal_sys: Registered =
thermal governor &#39;user_space&#39;<br>[ =C2=A0 =C2=A00.348159] thermal_s=
ys: Registered thermal governor &#39;power_allocator&#39;<br>[ =C2=A0 =C2=
=A00.354588] cpuidle: using governor ladder<br>[ =C2=A0 =C2=A00.365590] cpu=
idle: using governor menu<br>[ =C2=A0 =C2=A00.392937] hw-breakpoint: debug =
architecture 0x4 unsupported.<br>[ =C2=A0 =C2=A00.413611] kprobes: kprobe j=
ump-optimization is enabled. All kprobes are optimized if possible.<br>[ =
=C2=A0 =C2=A00.441354] raid6: skipped pq benchmark and selected neonx8<br>[=
 =C2=A0 =C2=A00.452017] raid6: using neon recovery algorithm<br>[ =C2=A0 =
=C2=A00.468087] iommu: Default domain type: Translated <br>[ =C2=A0 =C2=A00=
.473185] iommu: DMA domain TLB invalidation policy: strict mode <br>[ =C2=
=A0 =C2=A00.489780] SCSI subsystem initialized<br>[ =C2=A0 =C2=A00.501001] =
usbcore: registered new interface driver usbfs<br>[ =C2=A0 =C2=A00.512146] =
usbcore: registered new interface driver hub<br>[ =C2=A0 =C2=A00.524089] us=
bcore: registered new device driver usb<br>[ =C2=A0 =C2=A00.536781] pps_cor=
e: LinuxPPS API ver. 1 registered<br>[ =C2=A0 =C2=A00.548015] pps_core: Sof=
tware ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti &lt;<a href=3D"mail=
to:giometti@linux.it">giometti@linux.it</a>&gt;<br>[ =C2=A0 =C2=A00.564043]=
 PTP clock support registered<br>[ =C2=A0 =C2=A00.577552] NetLabel: Initial=
izing<br>[ =C2=A0 =C2=A00.588018] NetLabel: =C2=A0domain hash size =3D 128<=
br>[ =C2=A0 =C2=A00.592525] NetLabel: =C2=A0protocols =3D UNLABELED CIPSOv4=
 CALIPSO<br>[ =C2=A0 =C2=A00.604158] NetLabel: =C2=A0unlabeled traffic allo=
wed by default<br>[ =C2=A0 =C2=A00.620692] clocksource: Switched to clockso=
urce dmtimer<br>[ =C2=A0 =C2=A00.634086] VFS: Disk quotas dquot_6.6.0<br>[ =
=C2=A0 =C2=A00.644882] VFS: Dquot-cache hash table entries: 1024 (order 0, =
4096 bytes)<br>[ =C2=A0 =C2=A00.656972] FS-Cache: Loaded<br>[ =C2=A0 =C2=A0=
0.664821] CacheFiles: Loaded<br>[ =C2=A0 =C2=A00.673204] AppArmor: AppArmor=
 Filesystem Enabled<br>[ =C2=A0 =C2=A00.704059] NET: Registered PF_INET pro=
tocol family<br>[ =C2=A0 =C2=A00.717040] IP idents hash table entries: 8192=
 (order: 4, 65536 bytes, linear)<br>[ =C2=A0 =C2=A00.734482] tcp_listen_por=
taddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)<br>[ =C2=
=A0 =C2=A00.752899] Table-perturb hash table entries: 65536 (order: 6, 2621=
44 bytes, linear)<br>[ =C2=A0 =C2=A00.768718] TCP established hash table en=
tries: 4096 (order: 2, 16384 bytes, linear)<br>[ =C2=A0 =C2=A00.784765] TCP=
 bind hash table entries: 4096 (order: 4, 65536 bytes, linear)<br>[ =C2=A0 =
=C2=A00.800775] TCP: Hash tables configured (established 4096 bind 4096)<br=
>[ =C2=A0 =C2=A00.813054] MPTCP token hash table entries: 512 (order: 1, 81=
92 bytes, linear)<br>[ =C2=A0 =C2=A00.828795] UDP hash table entries: 256 (=
order: 1, 8192 bytes, linear)<br>[ =C2=A0 =C2=A00.844723] UDP-Lite hash tab=
le entries: 256 (order: 1, 8192 bytes, linear)<br>[ =C2=A0 =C2=A00.857230] =
NET: Registered PF_UNIX/PF_LOCAL protocol family<br>[ =C2=A0 =C2=A00.873449=
] RPC: Registered named UNIX socket transport module.<br>[ =C2=A0 =C2=A00.8=
84695] RPC: Registered udp transport module.<br>[ =C2=A0 =C2=A00.892688] RP=
C: Registered tcp transport module.<br>[ =C2=A0 =C2=A00.904698] RPC: Regist=
ered tcp NFSv4.1 backchannel transport module.<br>[ =C2=A0 =C2=A00.916707] =
NET: Registered PF_XDP protocol family<br>[ =C2=A0 =C2=A02.057584] Initiali=
se system trusted keyrings<br>[ =C2=A0 =C2=A02.064353] workingset: timestam=
p_bits=3D14 max_order=3D17 bucket_order=3D3<br>[ =C2=A0 =C2=A02.081692] zbu=
d: loaded<br>[ =C2=A0 =C2=A02.089227] NFS: Registering the id_resolver key =
type<br>[ =C2=A0 =C2=A02.094600] Key type id_resolver registered<br>[ =C2=
=A0 =C2=A02.098937] Key type id_legacy registered<br>[ =C2=A0 =C2=A02.10329=
3] nfs4filelayout_init: NFSv4 File Layout Driver Registering...<br>[ =C2=A0=
 =C2=A02.110222] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Regi=
stering...<br>[ =C2=A0 =C2=A02.117932] jffs2: version 2.2. (NAND) (SUMMARY)=
 =C2=A0=C2=A9 2001-2006 Red Hat, Inc.<br>[ =C2=A0 =C2=A02.126320] fuse: ini=
t (API version 7.37)<br>[ =C2=A0 =C2=A02.223398] NET: Registered PF_ALG pro=
tocol family<br>[ =C2=A0 =C2=A02.228520] xor: measuring software checksum s=
peed<br>[ =C2=A0 =C2=A02.241238] =C2=A0 =C2=A0arm4regs =C2=A0 =C2=A0 =C2=A0=
 =C2=A0: =C2=A01270 MB/sec<br>[ =C2=A0 =C2=A02.254710] =C2=A0 =C2=A08regs =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : =C2=A01099 MB/sec<br>[ =C2=A0 =C2=A02.=
268180] =C2=A0 =C2=A032regs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: =C2=A01099 =
MB/sec<br>[ =C2=A0 =C2=A02.278200] =C2=A0 =C2=A0neon =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0: =C2=A01783 MB/sec<br>[ =C2=A0 =C2=A02.282696] xor: us=
ing function: neon (1783 MB/sec)<br>[ =C2=A0 =C2=A02.287741] Key type asymm=
etric registered<br>[ =C2=A0 =C2=A02.291976] Asymmetric key parser &#39;x50=
9&#39; registered<br>[ =C2=A0 =C2=A02.299642] alg: self-tests for CTR-KDF (=
hmac(sha256)) passed<br>[ =C2=A0 =C2=A02.306168] Block layer SCSI generic (=
bsg) driver version 0.4 loaded (major 244)<br>[ =C2=A0 =C2=A02.314270] io s=
cheduler mq-deadline registered<br>[ =C2=A0 =C2=A02.326615] Serial: 8250/16=
550 driver, 6 ports, IRQ sharing disabled<br>[ =C2=A0 =C2=A02.354956] loop:=
 module loaded<br>[ =C2=A0 =C2=A02.358858] SPI driver tps6594 has no spi_de=
vice_id for ti,tps6594-q1<br>[ =C2=A0 =C2=A02.365541] SPI driver tps6594 ha=
s no spi_device_id for ti,tps6593-q1<br>[ =C2=A0 =C2=A02.372185] SPI driver=
 tps6594 has no spi_device_id for ti,lp8764-q1<br>[ =C2=A0 =C2=A02.383380] =
usbcore: registered new interface driver smsc95xx<br>[ =C2=A0 =C2=A02.39363=
2] i2c_dev: i2c /dev entries driver<br>[ =C2=A0 =C2=A02.398311] Driver for =
1-wire Dallas network protocol.<br>[ =C2=A0 =C2=A02.405002] softdog: initia=
lized. soft_noboot=3D0 soft_margin=3D60 sec soft_panic=3D0 (nowayout=3D0)<b=
r>[ =C2=A0 =C2=A02.413734] softdog: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0soft_reboot_cmd=3D&lt;not set&gt; soft_active_on_boot=3D0<br>[ =
=C2=A0 =C2=A02.422541] cpuidle: enable-method property &#39;ti,am3352&#39; =
found operations<br>[ =C2=A0 =C2=A02.430352] sdhci: Secure Digital Host Con=
troller Interface driver<br>[ =C2=A0 =C2=A02.436776] sdhci: Copyright(c) Pi=
erre Ossman<br>[ =C2=A0 =C2=A02.441277] sdhci-pltfm: SDHCI platform and OF =
driver helper<br>[ =C2=A0 =C2=A02.447615] ledtrig-cpu: registered to indica=
te activity on CPUs<br>[ =C2=A0 =C2=A02.454533] hid: raw HID events driver =
(C) Jiri Kosina<br>[ =C2=A0 =C2=A02.460601] usbcore: registered new interfa=
ce driver usbhid<br>[ =C2=A0 =C2=A02.466401] usbhid: USB HID core driver<br=
>[ =C2=A0 =C2=A02.472766] NET: Registered PF_INET6 protocol family<br>[ =C2=
=A0 =C2=A02.482755] Segment Routing with IPv6<br>[ =C2=A0 =C2=A02.486926] I=
n-situ OAM (IOAM) with IPv6<br>[ =C2=A0 =C2=A02.491263] mip6: Mobile IPv6<b=
r>[ =C2=A0 =C2=A02.494566] NET: Registered PF_PACKET protocol family<br>[ =
=C2=A0 =C2=A02.500227] Key type dns_resolver registered<br>[ =C2=A0 =C2=A02=
.504771] mpls_gso: MPLS GSO support<br>[ =C2=A0 =C2=A02.508856] ThumbEE CPU=
 extension supported.<br>[ =C2=A0 =C2=A02.513298] Registering SWP/SWPB emul=
ation handler<br>[ =C2=A0 =C2=A02.518251] omap_voltage_late_init: Voltage d=
river support not added<br>[ =C2=A0 =C2=A02.526359] registered taskstats ve=
rsion 1<br>[ =C2=A0 =C2=A02.530792] Loading compiled-in X.509 certificates<=
br>[ =C2=A0 =C2=A02.536739] zswap: loaded using pool lzo/zbud<br>[ =C2=A0 =
=C2=A02.542631] Key type .fscrypt registered<br>[ =C2=A0 =C2=A02.546840] Ke=
y type fscrypt-provisioning registered<br>[ =C2=A0 =C2=A02.561788] Btrfs lo=
aded, crc32c=3Dcrc32c-generic, zoned=3Dyes, fsverity=3Dyes<br>[ =C2=A0 =C2=
=A02.571469] Key type encrypted registered<br>[ =C2=A0 =C2=A02.575883] AppA=
rmor: AppArmor sha1 policy hashing enabled<br>[ =C2=A0 =C2=A02.581759] ima:=
 No TPM chip found, activating TPM-bypass!<br>[ =C2=A0 =C2=A02.587664] ima:=
 Allocated hash algorithm: sha256<br>[ =C2=A0 =C2=A02.592803] ima: No archi=
tecture policies found<br>[ =C2=A0 =C2=A02.597661] evm: Initialising EVM ex=
tended attributes:<br>[ =C2=A0 =C2=A02.602985] evm: security.selinux<br>[ =
=C2=A0 =C2=A02.606412] evm: security.SMACK64 (disabled)<br>[ =C2=A0 =C2=A02=
.610825] evm: security.SMACK64EXEC (disabled)<br>[ =C2=A0 =C2=A02.615587] e=
vm: security.SMACK64TRANSMUTE (disabled)<br>[ =C2=A0 =C2=A02.620799] evm: s=
ecurity.SMACK64MMAP (disabled)<br>[ =C2=A0 =C2=A02.625560] evm: security.ap=
parmor<br>[ =C2=A0 =C2=A02.629071] evm: security.ima<br>[ =C2=A0 =C2=A02.63=
2121] evm: security.capability<br>[ =C2=A0 =C2=A02.635810] evm: HMAC attrs:=
 0x1<br>[ =C2=A0 =C2=A02.683301] remoteproc remoteproc0: wkup_m3 is availab=
le<br>[ =C2=A0 =C2=A02.702524] pinctrl-single 44e10800.pinmux: 142 pins, si=
ze 568<br>[ =C2=A0 =C2=A02.715024] ti-sysc: probe of 44e31000.target-module=
 failed with error -16<br>[ =C2=A0 =C2=A02.726119] omap_wdt: OMAP Watchdog =
Timer Rev 0x01: initial timeout 60 sec<br>[ =C2=A0 =C2=A02.737737] omap_rtc=
 44e3e000.rtc: registered as rtc0<br>[ =C2=A0 =C2=A02.743061] omap_rtc 44e3=
e000.rtc: setting system clock to 2000-01-01T00:00:00 UTC (946684800)<br>[ =
=C2=A0 =C2=A02.763281] ti-sysc: probe of 48040000.target-module failed with=
 error -16<br>[ =C2=A0 =C2=A02.785171] gpio gpiochip0: (gpio-0-31): not an =
immutable chip, please consider fixing it!<br>[ =C2=A0 =C2=A02.794444] OMAP=
 GPIO hardware version 0.1<br>[ =C2=A0 =C2=A02.805375] omap-mailbox 480c800=
0.mailbox: omap mailbox rev 0x400<br>[ =C2=A0 =C2=A02.818643] at24 2-0054: =
supply vcc not found, using dummy regulator<br>[ =C2=A0 =C2=A02.856849] at2=
4 2-0055: supply vcc not found, using dummy regulator<br>[ =C2=A0 =C2=A02.8=
92531] at24 2-0056: supply vcc not found, using dummy regulator<br>[ =C2=A0=
 =C2=A02.928560] at24 2-0057: supply vcc not found, using dummy regulator<b=
r>[ =C2=A0 =C2=A02.964125] omap_i2c 4819c000.i2c: bus 2 rev0.11 at 100 kHz<=
br>[ =C2=A0 =C2=A02.975562] gpio gpiochip1: (gpio-32-63): not an immutable =
chip, please consider fixing it!<br>[ =C2=A0 =C2=A02.987140] gpio gpiochip2=
: (gpio-64-95): not an immutable chip, please consider fixing it!<br>[ =C2=
=A0 =C2=A03.001969] sdhci-omap 481d8000.mmc: supply pbias not found, using =
dummy regulator<br>[ =C2=A0 =C2=A03.018359] sdhci-omap 481d8000.mmc: supply=
 vqmmc not found, using dummy regulator<br>[ =C2=A0 =C2=A03.028511] omap_rn=
g 48310000.rng: Random Number Generator ver. 20<br>[ =C2=A0 =C2=A03.035855]=
 random: crng init done<br>[ =C2=A0 =C2=A03.092730] davinci_mdio 4a101000.m=
dio: davinci mdio revision 1.6, bus freq 1000000<br>[ =C2=A0 =C2=A03.126125=
] SMSC LAN8710/LAN8720: probe of 4a101000.mdio:00 failed with error -5<br>[=
 =C2=A0 =C2=A03.133894] davinci_mdio 4a101000.mdio: phy[0]: device 4a101000=
.mdio:00, driver SMSC LAN8710/LAN8720<br>[ =C2=A0 =C2=A03.144040] cpsw-swit=
ch 4a100000.switch: initialized cpsw ale version 1.4<br>[ =C2=A0 =C2=A03.15=
1110] cpsw-switch 4a100000.switch: ALE Table size 1024<br>[ =C2=A0 =C2=A03.=
157084] cpsw-switch 4a100000.switch: cpts: overflow check period 1250 (jiff=
ies)<br>[ =C2=A0 =C2=A03.165001] cpsw-switch 4a100000.switch: CPTS: ref_clk=
_freq:250000000 calc_mult:2147483648 calc_shift:29 error:0 nsec/sec<br>[ =
=C2=A0 =C2=A03.176410] cpsw-switch 4a100000.switch: Detected MACID =3D 68:5=
e:1c:03:07:bf<br>[ =C2=A0 =C2=A03.185575] cpsw-switch 4a100000.switch: init=
ialized (regs 0x4a100000, pool size 256) hw_ver:0019010C 1.12 (0)<br>[ =C2=
=A0 =C2=A03.210379] debugfs: Directory &#39;49000000.dma&#39; with parent &=
#39;dmaengine&#39; already present!<br>[ =C2=A0 =C2=A03.218638] edma 490000=
00.dma: TI EDMA DMA engine driver<br>[ =C2=A0 =C2=A03.230547] am335x-phy-dr=
iver 47401300.usb-phy: supply vcc not found, using dummy regulator<br>[ =C2=
=A0 =C2=A03.239674] am335x-phy-driver 47401300.usb-phy: dummy supplies not =
allowed for exclusive requests<br>[ =C2=A0 =C2=A03.255611] am335x-phy-drive=
r 47401b00.usb-phy: supply vcc not found, using dummy regulator<br>[ =C2=A0=
 =C2=A03.264906] am335x-phy-driver 47401b00.usb-phy: dummy supplies not all=
owed for exclusive requests<br>[ =C2=A0 =C2=A03.288119] musb-hdrc musb-hdrc=
.1: MUSB HDRC host driver<br>[ =C2=A0 =C2=A03.293805] musb-hdrc musb-hdrc.1=
: new USB bus registered, assigned bus number 1<br>[ =C2=A0 =C2=A03.301785]=
 usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDevi=
ce=3D 6.01<br>[ =C2=A0 =C2=A03.310336] usb usb1: New USB device strings: Mf=
r=3D3, Product=3D2, SerialNumber=3D1<br>[ =C2=A0 =C2=A03.317791] usb usb1: =
Product: MUSB HDRC host driver<br>[ =C2=A0 =C2=A03.322915] usb usb1: Manufa=
cturer: Linux 6.1.69-ti musb-hcd<br>[ =C2=A0 =C2=A03.328755] usb usb1: Seri=
alNumber: musb-hdrc.1<br>[ =C2=A0 =C2=A03.334399] hub 1-0:1.0: USB hub foun=
d<br>[ =C2=A0 =C2=A03.338446] hub 1-0:1.0: 1 port detected<br>[ =C2=A0 =C2=
=A03.364408] omap-sham 53100000.sham: hw accel on OMAP rev 4.3<br>[ =C2=A0 =
=C2=A03.370789] omap-sham 53100000.sham: will run requests pump with realti=
me priority<br>[ =C2=A0 =C2=A03.382899] omap-aes 53500000.aes: OMAP AES hw =
accel rev: 3.2<br>[ =C2=A0 =C2=A03.389523] omap-aes 53500000.aes: will run =
requests pump with realtime priority<br>[ =C2=A0 =C2=A03.405436] hw perfeve=
nts: enabled with armv7_cortex_a8 PMU driver, 5 counters available<br>[ =C2=
=A0 =C2=A03.419147] l3-aon-clkctrl:0000:0: failed to disable<br>[ =C2=A0 =
=C2=A03.427855] gpio gpiochip3: (gpio-96-127): not an immutable chip, pleas=
e consider fixing it!<br>[ =C2=A0 =C2=A03.439204] 44e09000.serial: ttyS0 at=
 MMIO 0x44e09000 (irq =3D 41, base_baud =3D 3000000) is a 8250<br>[ =C2=A0 =
=C2=A03.448493] printk: console [ttyS0] enabled<br>[ =C2=A0 =C2=A03.448493]=
 printk: console [ttyS0] enabled<br>[ =C2=A0 =C2=A03.457110] printk: bootco=
nsole [omap8250] disabled<br>[ =C2=A0 =C2=A03.457110] printk: bootconsole [=
omap8250] disabled<br>[ =C2=A0 =C2=A03.493448] tps65217-pmic: Failed to loc=
ate of_node [id: -1]<br>[ =C2=A0 =C2=A03.510500] tps65217-bl: Failed to loc=
ate of_node [id: -1]<br>[ =C2=A0 =C2=A03.520003] tps65217 0-0024: TPS65217 =
ID 0xe version 1.2<br>[ =C2=A0 =C2=A03.527310] at24 0-0050: 32768 byte 24c2=
56 EEPROM, writable, 1 bytes/write<br>[ =C2=A0 =C2=A03.534718] i2c 0-0070: =
Fixed dependency cycle(s) with /ocp/interconnect@48000000/segment@300000/ta=
rget-module@e000/lcdc@0/port/endpoint@0<br>[ =C2=A0 =C2=A03.667523] tda998x=
 0-0070: found TDA19988<br>[ =C2=A0 =C2=A03.675108] omap_i2c 44e0b000.i2c: =
bus 0 rev0.11 at 400 kHz<br>[ =C2=A0 =C2=A03.683307] omap_gpio 44e07000.gpi=
o: Could not set line 6 debounce to 200000 microseconds (-22)<br>[ =C2=A0 =
=C2=A03.693654] tilcdc 4830e000.lcdc: bound 0-0070 (ops 0xc11bf9a8)<br>[ =
=C2=A0 =C2=A03.699748] sdhci-omap 48060000.mmc: Got CD GPIO<br>[ =C2=A0 =C2=
=A03.705997] [drm] Initialized tilcdc 1.0.0 20121205 for 4830e000.lcdc on m=
inor 0<br>[ =C2=A0 =C2=A03.713860] sdhci-omap 48060000.mmc: supply pbias no=
t found, using dummy regulator<br>[ =C2=A0 =C2=A03.723323] sdhci-omap 48060=
000.mmc: supply vqmmc not found, using dummy regulator<br>[ =C2=A0 =C2=A03.=
757212] mmc0: SDHCI controller on 48060000.mmc [48060000.mmc] using Externa=
l DMA<br>[ =C2=A0 =C2=A03.828717] mmc0: new high speed SDHC card at address=
 aaaa<br>[ =C2=A0 =C2=A03.833620] mmcblk0: mmc0:aaaa SD32G 29.7 GiB <br>[ =
=C2=A0 =C2=A03.837419] =C2=A0mmcblk0: p1 p2<br>[ =C2=A0 =C2=A03.839151] Con=
sole: switching to colour frame buffer device 160x64<br>[ =C2=A0 =C2=A03.86=
8128] tilcdc 4830e000.lcdc: [drm] fb0: tilcdcdrmfb frame buffer device<br>[=
 =C2=A0 =C2=A03.878981] sdhci-omap 481d8000.mmc: supply pbias not found, us=
ing dummy regulator<br>[ =C2=A0 =C2=A03.891295] tps6521x_pwrbutton tps65217=
-pwrbutton: DMA mask not set<br>[ =C2=A0 =C2=A03.899587] sdhci-omap 481d800=
0.mmc: supply vqmmc not found, using dummy regulator<br>[ =C2=A0 =C2=A03.91=
0419] input: tps65217_pwrbutton as /devices/platform/ocp/44c00000.interconn=
ect/44c00000.interconnect:segment@200000/44e0b000.target-module/44e0b000.i2=
c/i2c-0/0-0<br>[ =C2=A0 =C2=A03.952837] mmc1: SDHCI controller on 481d8000.=
mmc [481d8000.mmc] using External DMA<br>[ =C2=A0 =C2=A03.961253] VFS: PART=
UUID=3D is invalid.<br>[ =C2=A0 =C2=A03.961253] Expected PARTUUID=3D&lt;val=
id-uuid-id&gt;[/PARTNROFF=3D%d]<br>[ =C2=A0 =C2=A03.970800] Disabling rootw=
ait; root=3D is invalid.<br>[ =C2=A0 =C2=A03.977324] /dev/root: Can&#39;t o=
pen blockdev<br>[ =C2=A0 =C2=A03.981716] VFS: Cannot open root device &quot=
;PARTUUID=3D&quot; or unknown-block(0,0): error -6<br>[ =C2=A0 =C2=A03.9896=
49] Please append a correct &quot;root=3D&quot; boot option; here are the a=
vailable partitions:<br>[ =C2=A0 =C2=A03.998200] b300 =C2=A0 =C2=A0 =C2=A0 =
=C2=A031166976 mmcblk0 <br>[ =C2=A0 =C2=A03.998216] =C2=A0driver: mmcblk<br=
>[ =C2=A0 =C2=A04.005313] =C2=A0 b301 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0131=
072 mmcblk0p1 076c4a2a-01<br>[ =C2=A0 =C2=A04.005328] <br>[ =C2=A0 =C2=A04.=
012322] =C2=A0 b302 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2027747 mmcblk0p2 076c4a2a-=
02<br>[ =C2=A0 =C2=A04.012334] <br>[ =C2=A0 =C2=A04.019437] Kernel panic - =
not syncing: VFS: Unable to mount root fs on unknown-block(0,0)<br>[ =C2=A0=
 =C2=A04.027753] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.1.69-ti #1<br>=
[ =C2=A0 =C2=A04.033966] Hardware name: Generic AM33XX (Flattened Device Tr=
ee)<br>[ =C2=A0 =C2=A04.040101] =C2=A0unwind_backtrace from show_stack+0x18=
/0x1c<br>[ =C2=A0 =C2=A04.045389] =C2=A0show_stack from dump_stack_lvl+0x40=
/0x4c<br>[ =C2=A0 =C2=A04.050478] =C2=A0dump_stack_lvl from panic+0x11c/0x3=
5c<br>[ =C2=A0 =C2=A04.055310] =C2=A0panic from mount_block_root+0x158/0x1f=
4<br>[ =C2=A0 =C2=A04.060314] =C2=A0mount_block_root from prepare_namespace=
+0x158/0x194<br>[ =C2=A0 =C2=A04.066358] =C2=A0prepare_namespace from kerne=
l_init_freeable+0x254/0x268<br>[ =C2=A0 =C2=A04.072750] =C2=A0kernel_init_f=
reeable from kernel_init+0x20/0x13c<br>[ =C2=A0 =C2=A04.078531] =C2=A0kerne=
l_init from ret_from_fork+0x14/0x28<br>[ =C2=A0 =C2=A04.083614] Exception s=
tack(0xe0009fb0 to 0xe0009ff8)<br>[ =C2=A0 =C2=A04.088692] 9fa0: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 00000000 00000000 00000000 000000=
00<br>[ =C2=A0 =C2=A04.096909] 9fc0: 00000000 00000000 00000000 00000000 00=
000000 00000000 00000000 00000000<br>[ =C2=A0 =C2=A04.105124] 9fe0: 0000000=
0 00000000 00000000 00000000 00000013 00000000<br>[ =C2=A0 =C2=A04.111788] =
---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknow=
n-block(0,0) ]---<br><br><br><h3 class=3D"gmail-iw"><span class=3D"gmail-qu=
" role=3D"gridcell" tabindex=3D"-1"><span class=3D"gmail-go"><br></span></s=
pan></h3></div></div>

--000000000000350e5506186fcb42--

