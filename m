Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51B4CE011AF
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2012 13:14:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0E5C652AB2; Wed, 17 Oct 2012 20:14:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121017201401.0E5C652AB2@arago-project.org>
Date: Wed, 17 Oct 2012 20:14:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: update beaglebone defconfig
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
X-List-Received-Date: Wed, 17 Oct 2012 20:14:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: 61a334523ee8b8f701d54ef4f01f860877f3e369
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=61a334523ee8b8f701d54ef4f01f860877f3e369

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Aug 30 09:56:13 2012 +0200

linux-ti33x-psp 3.2: update beaglebone defconfig

* Add more RTC modules
* Disable cgroup controllers with a lot of overhead

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>

---

 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |  128 ++++++++++----------
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    2 +-
 2 files changed, 65 insertions(+), 65 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index 5964380..74b0051 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -1,6 +1,6 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Linux/arm 3.2.21 Kernel Configuration
+# Linux/arm 3.2.28 Kernel Configuration
 #
 CONFIG_ARM=y
 CONFIG_HAVE_PWM=y
@@ -85,20 +85,16 @@ CONFIG_CGROUPS=y
 # CONFIG_CGROUP_DEBUG is not set
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_DEVICE=y
-CONFIG_CPUSETS=y
-CONFIG_PROC_PID_CPUSET=y
+# CONFIG_CPUSETS is not set
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_RESOURCE_COUNTERS=y
-CONFIG_CGROUP_MEM_RES_CTLR=y
-CONFIG_CGROUP_MEM_RES_CTLR_SWAP=y
-CONFIG_CGROUP_MEM_RES_CTLR_SWAP_ENABLED=y
-CONFIG_CGROUP_PERF=y
+# CONFIG_CGROUP_MEM_RES_CTLR is not set
+# CONFIG_CGROUP_PERF is not set
 CONFIG_CGROUP_SCHED=y
 CONFIG_FAIR_GROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
 CONFIG_RT_GROUP_SCHED=y
-CONFIG_BLK_CGROUP=y
-# CONFIG_DEBUG_BLK_CGROUP is not set
+# CONFIG_BLK_CGROUP is not set
 CONFIG_NAMESPACES=y
 CONFIG_UTS_NS=y
 CONFIG_IPC_NS=y
@@ -106,7 +102,6 @@ CONFIG_USER_NS=y
 CONFIG_PID_NS=y
 CONFIG_NET_NS=y
 CONFIG_SCHED_AUTOGROUP=y
-CONFIG_MM_OWNER=y
 # CONFIG_SYSFS_DEPRECATED is not set
 CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
@@ -182,7 +177,6 @@ CONFIG_LBDAF=y
 CONFIG_BLK_DEV_BSG=y
 # CONFIG_BLK_DEV_BSGLIB is not set
 CONFIG_BLK_DEV_INTEGRITY=y
-CONFIG_BLK_DEV_THROTTLING=y
 
 #
 # IO Schedulers
@@ -190,7 +184,6 @@ CONFIG_BLK_DEV_THROTTLING=y
 CONFIG_IOSCHED_NOOP=y
 CONFIG_IOSCHED_DEADLINE=y
 CONFIG_IOSCHED_CFQ=y
-CONFIG_CFQ_GROUP_IOSCHED=y
 # CONFIG_DEFAULT_DEADLINE is not set
 CONFIG_DEFAULT_CFQ=y
 # CONFIG_DEFAULT_NOOP is not set
@@ -446,7 +439,6 @@ CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
 CONFIG_NEED_PER_CPU_KM=y
 # CONFIG_CLEANCACHE is not set
 CONFIG_FORCE_MAX_ZONEORDER=11
-# CONFIG_LEDS is not set
 CONFIG_ALIGNMENT_TRAP=y
 # CONFIG_UACCESS_WITH_MEMCPY is not set
 # CONFIG_SECCOMP is not set
@@ -480,9 +472,9 @@ CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_TABLE=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_STAT_DETAILS=y
-# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
 # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
-CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
 # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
 # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
 CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
@@ -1532,6 +1524,7 @@ CONFIG_PRINTER=m
 CONFIG_HW_RANDOM=y
 # CONFIG_HW_RANDOM_TIMERIOMEM is not set
 # CONFIG_HW_RANDOM_VIRTIO is not set
+# CONFIG_NVRAM is not set
 # CONFIG_R3964 is not set
 CONFIG_RAW_DRIVER=m
 CONFIG_MAX_RAW_DEVS=256
@@ -2431,6 +2424,7 @@ CONFIG_BACKLIGHT_PWM=y
 # CONFIG_BACKLIGHT_ADP8860 is not set
 # CONFIG_BACKLIGHT_ADP8870 is not set
 # CONFIG_BACKLIGHT_TLC59108 is not set
+CONFIG_BACKLIGHT_TPS65217=y
 
 #
 # Display device support
@@ -2868,6 +2862,7 @@ CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_BACKLIGHT=y
+# CONFIG_LEDS_TRIGGER_CPU is not set
 CONFIG_LEDS_TRIGGER_GPIO=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 
@@ -2893,56 +2888,57 @@ CONFIG_RTC_INTF_DEV=y
 #
 # I2C RTC drivers
 #
-# CONFIG_RTC_DRV_DS1307 is not set
-# CONFIG_RTC_DRV_DS1374 is not set
-# CONFIG_RTC_DRV_DS1672 is not set
-# CONFIG_RTC_DRV_DS3232 is not set
-# CONFIG_RTC_DRV_MAX6900 is not set
-# CONFIG_RTC_DRV_RS5C372 is not set
-# CONFIG_RTC_DRV_ISL1208 is not set
-# CONFIG_RTC_DRV_ISL12022 is not set
-# CONFIG_RTC_DRV_X1205 is not set
-# CONFIG_RTC_DRV_PCF8563 is not set
-# CONFIG_RTC_DRV_PCF8583 is not set
-# CONFIG_RTC_DRV_M41T80 is not set
-# CONFIG_RTC_DRV_BQ32K is not set
-CONFIG_RTC_DRV_TWL4030=y
-# CONFIG_RTC_DRV_S35390A is not set
-# CONFIG_RTC_DRV_FM3130 is not set
-# CONFIG_RTC_DRV_RX8581 is not set
-# CONFIG_RTC_DRV_RX8025 is not set
-# CONFIG_RTC_DRV_EM3027 is not set
-# CONFIG_RTC_DRV_RV3029C2 is not set
+CONFIG_RTC_DRV_DS1307=m
+CONFIG_RTC_DRV_DS1374=m
+CONFIG_RTC_DRV_DS1672=m
+CONFIG_RTC_DRV_DS3232=m
+CONFIG_RTC_DRV_MAX6900=m
+CONFIG_RTC_DRV_RS5C372=m
+CONFIG_RTC_DRV_ISL1208=m
+CONFIG_RTC_DRV_ISL12022=m
+CONFIG_RTC_DRV_X1205=m
+CONFIG_RTC_DRV_PCF8563=m
+CONFIG_RTC_DRV_PCF8583=m
+CONFIG_RTC_DRV_M41T80=m
+CONFIG_RTC_DRV_M41T80_WDT=y
+CONFIG_RTC_DRV_BQ32K=m
+CONFIG_RTC_DRV_TWL4030=m
+CONFIG_RTC_DRV_S35390A=m
+CONFIG_RTC_DRV_FM3130=m
+CONFIG_RTC_DRV_RX8581=m
+CONFIG_RTC_DRV_RX8025=m
+CONFIG_RTC_DRV_EM3027=m
+CONFIG_RTC_DRV_RV3029C2=m
 
 #
 # SPI RTC drivers
 #
-# CONFIG_RTC_DRV_M41T93 is not set
-# CONFIG_RTC_DRV_M41T94 is not set
-# CONFIG_RTC_DRV_DS1305 is not set
-# CONFIG_RTC_DRV_DS1390 is not set
-# CONFIG_RTC_DRV_MAX6902 is not set
-# CONFIG_RTC_DRV_R9701 is not set
-# CONFIG_RTC_DRV_RS5C348 is not set
-# CONFIG_RTC_DRV_DS3234 is not set
-# CONFIG_RTC_DRV_PCF2123 is not set
+CONFIG_RTC_DRV_M41T93=m
+CONFIG_RTC_DRV_M41T94=m
+CONFIG_RTC_DRV_DS1305=m
+CONFIG_RTC_DRV_DS1390=m
+CONFIG_RTC_DRV_MAX6902=m
+CONFIG_RTC_DRV_R9701=m
+CONFIG_RTC_DRV_RS5C348=m
+CONFIG_RTC_DRV_DS3234=m
+CONFIG_RTC_DRV_PCF2123=m
 
 #
 # Platform RTC drivers
 #
-# CONFIG_RTC_DRV_CMOS is not set
-# CONFIG_RTC_DRV_DS1286 is not set
-# CONFIG_RTC_DRV_DS1511 is not set
-# CONFIG_RTC_DRV_DS1553 is not set
-# CONFIG_RTC_DRV_DS1742 is not set
-# CONFIG_RTC_DRV_STK17TA8 is not set
-# CONFIG_RTC_DRV_M48T86 is not set
-# CONFIG_RTC_DRV_M48T35 is not set
-# CONFIG_RTC_DRV_M48T59 is not set
-# CONFIG_RTC_DRV_MSM6242 is not set
-# CONFIG_RTC_DRV_BQ4802 is not set
-# CONFIG_RTC_DRV_RP5C01 is not set
-# CONFIG_RTC_DRV_V3020 is not set
+CONFIG_RTC_DRV_CMOS=m
+CONFIG_RTC_DRV_DS1286=m
+CONFIG_RTC_DRV_DS1511=m
+CONFIG_RTC_DRV_DS1553=m
+CONFIG_RTC_DRV_DS1742=m
+CONFIG_RTC_DRV_STK17TA8=m
+CONFIG_RTC_DRV_M48T86=m
+CONFIG_RTC_DRV_M48T35=m
+CONFIG_RTC_DRV_M48T59=m
+CONFIG_RTC_DRV_MSM6242=m
+CONFIG_RTC_DRV_BQ4802=m
+CONFIG_RTC_DRV_RP5C01=m
+CONFIG_RTC_DRV_V3020=m
 
 #
 # on-CPU RTC drivers
@@ -2963,11 +2959,14 @@ CONFIG_VIRTIO_RING=m
 # CONFIG_VIRTIO_BALLOON is not set
 CONFIG_VIRTIO_MMIO=m
 CONFIG_STAGING=y
-# CONFIG_USBIP_CORE is not set
+CONFIG_USBIP_CORE=m
+CONFIG_USBIP_VHCI_HCD=m
+CONFIG_USBIP_HOST=m
+# CONFIG_USBIP_DEBUG is not set
 CONFIG_W35UND=m
 CONFIG_PRISM2_USB=m
 # CONFIG_ECHO is not set
-# CONFIG_ASUS_OLED is not set
+CONFIG_ASUS_OLED=m
 # CONFIG_PANEL is not set
 CONFIG_R8712U=m
 CONFIG_RTS5139=m
@@ -3109,8 +3108,9 @@ CONFIG_IIO_DUMMY_EVGEN=m
 CONFIG_IIO_SIMPLE_DUMMY=m
 CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
 CONFIG_IIO_SIMPLE_DUMMY_BUFFER=y
-# CONFIG_XVMALLOC is not set
-# CONFIG_ZRAM is not set
+CONFIG_XVMALLOC=y
+CONFIG_ZRAM=m
+# CONFIG_ZRAM_DEBUG is not set
 # CONFIG_FB_SM7XX is not set
 # CONFIG_TIDSPBRIDGE is not set
 CONFIG_USB_ENESTORAGE=m
@@ -3122,7 +3122,7 @@ CONFIG_USB_ENESTORAGE=m
 #
 # CONFIG_SPEAKUP is not set
 # CONFIG_TOUCHSCREEN_CLEARPAD_TM1217 is not set
-# CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4 is not set
+CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4=m
 CONFIG_STAGING_MEDIA=y
 CONFIG_DVB_AS102=m
 CONFIG_EASYCAP=m
@@ -3564,9 +3564,9 @@ CONFIG_CRYPTO_SHA1=m
 #
 # Ciphers
 #
-CONFIG_CRYPTO_AES=m
+CONFIG_CRYPTO_AES=y
 # CONFIG_CRYPTO_ANUBIS is not set
-CONFIG_CRYPTO_ARC4=m
+CONFIG_CRYPTO_ARC4=y
 # CONFIG_CRYPTO_BLOWFISH is not set
 # CONFIG_CRYPTO_CAMELLIA is not set
 # CONFIG_CRYPTO_CAST5 is not set
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 2bc6081..4200d03 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.28", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 


