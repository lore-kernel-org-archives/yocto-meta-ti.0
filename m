Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17522E00348
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:34 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id d41so1131520eek.35
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=jg/8yvsRsR6iXAeRbF+0CgIqAf9I1Ll3bqOV2JFZAJ8=;
	b=WJ4zFgGon4dEQBjim2m0/AdqYskemhKsQn/ZOhyNn4j51RMjE5gTWROvRhvGoQmFkO
	Ii1zvoTZoyMva07WwxsLbK9tUu9Htuvgzby/mExH1jrzrppN6k/1RN5HvRxyEkDUqD8g
	ojn7M6u18lrOqXz03iWs73BxukYYjMZjlgRA4e55afX+cNZfiJJ19evO5fWN0IVO9rfG
	6xrHstV5Hmp/At7AqAK9CP79J4H8g76z7NVOOXmfx72Ue/VMQJz9fm0QRG5n51j5l2oM
	T0iB39sniAGD0m5YHTm5+B+pF87wAZHQAl1h4LwvKjUZosbUaNT9YnoFBq4LWCwIfMk/
	d/Dg==
Received: by 10.14.194.198 with SMTP id m46mr1518788een.13.1343581774683;
	Sun, 29 Jul 2012 10:09:34 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id d48sm21562422eeo.10.2012.07.29.10.09.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jul 2012 10:09:33 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sun, 29 Jul 2012 19:08:32 +0200
Message-Id: <1343581714-20397-10-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
References: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmKgYq2bZShJKqtwTKrmZhUFoK9ImtPeXm1O3xeSrANfkQQ/0EG4br2G04kdgRPvy+E7f9y
Subject: [PATCH][for-denzil 10/12] linux-ti33x-psp 3.2: enable more tracing features for beaglebone
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
X-List-Received-Date: Sun, 29 Jul 2012 17:09:35 -0000

This makes powertop 2.0 happy

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
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
 
-- 
1.7.10


