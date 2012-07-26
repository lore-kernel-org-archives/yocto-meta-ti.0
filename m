Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F6EBE01412
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2012 18:32:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7631852AA9; Thu, 26 Jul 2012 01:32:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120726013212.7631852AA9@arago-project.org>
Date: Thu, 26 Jul 2012 01:32:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: enable more tracing features for beaglebone
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
X-List-Received-Date: Thu, 26 Jul 2012 01:32:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 751040122dad1e1036ff32b716e9f40be010c2b3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=751040122dad1e1036ff32b716e9f40be010c2b3

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Sat Jul 14 15:38:07 2012 +0200

linux-ti33x-psp 3.2: enable more tracing features for beaglebone

This makes powertop 2.0 happy

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |   20 ++++++++++++++------
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    2 +-
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index 8e8a1c5..5964380 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -108,7 +108,7 @@ CONFIG_NET_NS=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_MM_OWNER=y
 # CONFIG_SYSFS_DEPRECATED is not set
-# CONFIG_RELAY is not set
+CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE=""
 CONFIG_RD_GZIP=y
@@ -144,7 +144,7 @@ CONFIG_PERF_USE_VMALLOC=y
 # Kernel Performance Events And Counters
 #
 CONFIG_PERF_EVENTS=y
-# CONFIG_PERF_COUNTERS is not set
+CONFIG_PERF_COUNTERS=y
 # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
 CONFIG_VM_EVENT_COUNTERS=y
 CONFIG_COMPAT_BRK=y
@@ -152,6 +152,7 @@ CONFIG_SLAB=y
 # CONFIG_SLUB is not set
 # CONFIG_SLOB is not set
 CONFIG_PROFILING=y
+CONFIG_TRACEPOINTS=y
 CONFIG_OPROFILE=m
 CONFIG_HAVE_OPROFILE=y
 # CONFIG_KPROBES is not set
@@ -784,6 +785,7 @@ CONFIG_DNS_RESOLVER=y
 # Network testing
 #
 # CONFIG_NET_PKTGEN is not set
+# CONFIG_NET_DROP_MONITOR is not set
 # CONFIG_HAMRADIO is not set
 CONFIG_CAN=y
 CONFIG_CAN_RAW=y
@@ -1408,7 +1410,6 @@ CONFIG_TOUCHSCREEN_ADS7846=y
 # CONFIG_TOUCHSCREEN_INEXIO is not set
 # CONFIG_TOUCHSCREEN_MK712 is not set
 # CONFIG_TOUCHSCREEN_PENMOUNT is not set
-CONFIG_TOUCHSCREEN_EDT_FT5X06=y
 # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
 # CONFIG_TOUCHSCREEN_TOUCHWIN is not set
 CONFIG_TOUCHSCREEN_TI_TSCADC=y
@@ -3404,6 +3405,7 @@ CONFIG_TIMER_STATS=y
 # CONFIG_LOCK_STAT is not set
 # CONFIG_DEBUG_ATOMIC_SLEEP is not set
 # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+CONFIG_STACKTRACE=y
 # CONFIG_DEBUG_STACK_USAGE is not set
 # CONFIG_DEBUG_KOBJECT is not set
 # CONFIG_DEBUG_BUGVERBOSE is not set
@@ -3426,23 +3428,29 @@ CONFIG_TIMER_STATS=y
 # CONFIG_LATENCYTOP is not set
 # CONFIG_SYSCTL_SYSCALL_CHECK is not set
 # CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_NOP_TRACER=y
 CONFIG_HAVE_FUNCTION_TRACER=y
 CONFIG_HAVE_DYNAMIC_FTRACE=y
 CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
 CONFIG_HAVE_C_RECORDMCOUNT=y
 CONFIG_RING_BUFFER=y
+CONFIG_EVENT_TRACING=y
+CONFIG_EVENT_POWER_TRACING_DEPRECATED=y
+CONFIG_CONTEXT_SWITCH_TRACER=y
 CONFIG_RING_BUFFER_ALLOW_SWAP=y
+CONFIG_TRACING=y
+CONFIG_GENERIC_TRACER=y
 CONFIG_TRACING_SUPPORT=y
 CONFIG_FTRACE=y
 # CONFIG_FUNCTION_TRACER is not set
 # CONFIG_IRQSOFF_TRACER is not set
 # CONFIG_SCHED_TRACER is not set
-# CONFIG_ENABLE_DEFAULT_TRACERS is not set
 CONFIG_BRANCH_PROFILE_NONE=y
 # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
 # CONFIG_PROFILE_ALL_BRANCHES is not set
 # CONFIG_STACK_TRACER is not set
-# CONFIG_BLK_DEV_IO_TRACE is not set
+CONFIG_BLK_DEV_IO_TRACE=y
+# CONFIG_FTRACE_STARTUP_TEST is not set
 # CONFIG_RING_BUFFER_BENCHMARK is not set
 # CONFIG_DYNAMIC_DEBUG is not set
 # CONFIG_DMA_API_DEBUG is not set
@@ -3588,7 +3596,7 @@ CONFIG_CRYPTO_LZO=y
 CONFIG_CRYPTO_HW=y
 # CONFIG_CRYPTO_DEV_OMAP_SHAM is not set
 # CONFIG_CRYPTO_DEV_OMAP_AES is not set
-# CONFIG_BINARY_PRINTF is not set
+CONFIG_BINARY_PRINTF=y
 
 #
 # Library routines
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 083f36a..eab3127 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.21", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "g+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "h+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 


