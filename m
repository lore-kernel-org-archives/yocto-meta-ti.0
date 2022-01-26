Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.21291.1643238551010098969
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 71EBF40CC2;
	Wed, 26 Jan 2022 23:09:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CgKR-m6_nVoA; Wed, 26 Jan 2022 23:09:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 56DEA40CC8;
	Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CF571174738;
	Wed, 26 Jan 2022 18:09:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 16/19] kselftests: remove outdated version in favor of upstream
Date: Wed, 26 Jan 2022 18:08:56 -0500
Message-Id: <1643238539-20686-17-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Newer versions of Linux kernel selftests are available from meta-oe.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../files/0001-selftests-add-ptp-to-TARGETS.patch  |  25 ---
 ...reakpoints-allow-to-cross-compile-for-aar.patch |  32 ----
 .../files/0001-selftests-gpio-use-pkg-config.patch |  53 ------
 ...-to-override-CC-in-the-top-level-Makefile.patch |  22 ---
 ...ts-net-use-LDLIBS-to-link-against-libnuma.patch |  24 ---
 ...omp-use-LDLIBS-to-link-against-libpthread.patch |  23 ---
 .../0001-selftests-sigaltstack-fix-packaging.patch |  26 ---
 ...ers-use-LDLIBS-to-link-against-libpthread.patch |  23 ---
 recipes-kernel/kselftests/kselftests_4.10.bb       | 190 ---------------------
 9 files changed, 418 deletions(-)
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-add-ptp-to-TARGETS.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-breakpoints-allow-to-cross-compile-for-aar.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-gpio-use-pkg-config.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-lib-allow-to-override-CC-in-the-top-level-Makefile.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-net-use-LDLIBS-to-link-against-libnuma.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-seccomp-use-LDLIBS-to-link-against-libpthread.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-sigaltstack-fix-packaging.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-timers-use-LDLIBS-to-link-against-libpthread.patch
 delete mode 100644 recipes-kernel/kselftests/kselftests_4.10.bb

diff --git a/recipes-kernel/kselftests/files/0001-selftests-add-ptp-to-TARGETS.patch b/recipes-kernel/kselftests/files/0001-selftests-add-ptp-to-TARGETS.patch
deleted file mode 100644
index 4c4a00e..0000000
--- a/recipes-kernel/kselftests/files/0001-selftests-add-ptp-to-TARGETS.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 9e1b0f0d7148524c226befdef90849f9e143ef66 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Fri, 17 May 2019 18:20:21 +0000
-Subject: [PATCH] selftests: add "ptp" to TARGETS
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- tools/testing/selftests/Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
-index 831022b1..6bd7cf81 100644
---- a/tools/testing/selftests/Makefile
-+++ b/tools/testing/selftests/Makefile
-@@ -20,6 +20,7 @@ TARGETS += net
- TARGETS += nsfs
- TARGETS += powerpc
- TARGETS += pstore
-+TARGETS += ptp
- TARGETS += ptrace
- TARGETS += seccomp
- TARGETS += sigaltstack
--- 
-2.17.1
-
diff --git a/recipes-kernel/kselftests/files/0001-selftests-breakpoints-allow-to-cross-compile-for-aar.patch b/recipes-kernel/kselftests/files/0001-selftests-breakpoints-allow-to-cross-compile-for-aar.patch
deleted file mode 100644
index 8b7aa25..0000000
--- a/recipes-kernel/kselftests/files/0001-selftests-breakpoints-allow-to-cross-compile-for-aar.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 607192f42d65e17f55fc6e85c00019bf71b18770 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fathi.boudra@linaro.org>
-Date: Wed, 22 Mar 2017 19:47:32 +0200
-Subject: [PATCH 1/1] selftests: breakpoints: allow to cross-compile for
- aarch64/arm64
-
-To build breakpoint_test_arm64, ARCH value is only tested for "aarch64".
-It covers only the native build because it's computed from uname -m output.
-For cross-compilation, ARCH is set to arm64 and prevent to cross-compile
-the test.
-Fix the test to allow both native and cross-compilation of the test.
-
-Note: glibc is missing several of the TRAP_* constants in the userspace
-      definitions. Specifically TRAP_BRANCH and TRAP_HWBKPT.
-      See https://sourceware.org/bugzilla/show_bug.cgi?id=21286
-
-Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
----
- tools/testing/selftests/breakpoints/Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/tools/testing/selftests/breakpoints/Makefile
-+++ b/tools/testing/selftests/breakpoints/Makefile
-@@ -5,7 +5,7 @@ ARCH ?= $(shell echo $(uname_M) | sed -e
- ifeq ($(ARCH),x86)
- TEST_PROGS := breakpoint_test
- endif
--ifeq ($(ARCH),aarch64)
-+ifneq (,$(filter $(ARCH),aarch64 arm64))
- TEST_PROGS := breakpoint_test_arm64
- endif
- 
diff --git a/recipes-kernel/kselftests/files/0001-selftests-gpio-use-pkg-config.patch b/recipes-kernel/kselftests/files/0001-selftests-gpio-use-pkg-config.patch
deleted file mode 100644
index 0d0bfc7..0000000
--- a/recipes-kernel/kselftests/files/0001-selftests-gpio-use-pkg-config.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From: Fathi Boudra <fathi.boudra@linaro.org>
-Subject: [PATCH] selftests: gpio: use pkg-config
-
-Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
----
----
- tools/testing/selftests/gpio/Makefile |   31 ++++++++++++++++++-------------
- 1 file changed, 18 insertions(+), 13 deletions(-)
-
---- a/tools/testing/selftests/gpio/Makefile
-+++ b/tools/testing/selftests/gpio/Makefile
-@@ -1,23 +1,28 @@
-+CFLAGS += -O2 -g -std=gnu99 -Wall
-+CFLAGS += -I../../../../usr/include/
-+CFLAGS += $(shell pkg-config --cflags mount)
-+LDLIBS += $(shell pkg-config --libs mount)
- 
- TEST_PROGS := gpio-mockup.sh
--TEST_FILES := gpio-mockup-sysfs.sh $(BINARIES)
--BINARIES := gpio-mockup-chardev
-+TEST_PROGS_EXTENDED := gpio-mockup-chardev
-+TEST_FILES := gpio-mockup-sysfs.sh
- 
--include ../lib.mk
-+GPIODIR := ../../../gpio
-+GPIOOBJ := gpio-utils.o
-+GPIOINC := gpio.h
- 
--all: $(BINARIES)
-+all: $(GPIOINC) $(TEST_PROGS_EXTENDED)
- 
- clean:
--	$(RM) $(BINARIES)
--
--CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
--LDLIBS += -lmount -I/usr/include/libmount
-+	$(RM) $(TEST_PROGS_EXTENDED)
-+	$(MAKE) -C $(GPIODIR) clean
- 
--$(BINARIES): ../../../gpio/gpio-utils.o ../../../../usr/include/linux/gpio.h
-+include ../lib.mk
- 
--../../../gpio/gpio-utils.o:
--	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
-+$(TEST_PROGS_EXTENDED): $(GPIODIR)/$(GPIOOBJ)
- 
--../../../../usr/include/linux/gpio.h:
--	make -C ../../../.. headers_install INSTALL_HDR_PATH=$(shell pwd)/../../../../usr/
-+$(GPIODIR)/$(GPIOOBJ):
-+	$(MAKE) -C $(GPIODIR)
- 
-+$(GPIOINC):
-+	$(MAKE) -C ../../../.. headers_install
diff --git a/recipes-kernel/kselftests/files/0001-selftests-lib-allow-to-override-CC-in-the-top-level-Makefile.patch b/recipes-kernel/kselftests/files/0001-selftests-lib-allow-to-override-CC-in-the-top-level-Makefile.patch
deleted file mode 100644
index 9d48fd5..0000000
--- a/recipes-kernel/kselftests/files/0001-selftests-lib-allow-to-override-CC-in-the-top-level-Makefile.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 2e93b68257aa88ccdc127ca119304a5f4c76b7c5 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fathi.boudra@linaro.org>
-Date: Wed, 22 Mar 2017 17:36:53 +0200
-Subject: [PATCH] selftests: lib: allow to override CC in the top-level Makefile
-
-Relax CC assignment to allow to override CC in the top-level Makefile.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- tools/testing/selftests/lib.mk |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/tools/testing/selftests/lib.mk
-+++ b/tools/testing/selftests/lib.mk
-@@ -1,6 +1,6 @@
- # This mimics the top-level Makefile. We do it explicitly here so that this
- # Makefile can operate with or without the kbuild infrastructure.
--CC := $(CROSS_COMPILE)gcc
-+CC ?= $(CROSS_COMPILE)gcc
- 
- define RUN_TESTS
- 	@for TEST in $(TEST_PROGS); do \
diff --git a/recipes-kernel/kselftests/files/0001-selftests-net-use-LDLIBS-to-link-against-libnuma.patch b/recipes-kernel/kselftests/files/0001-selftests-net-use-LDLIBS-to-link-against-libnuma.patch
deleted file mode 100644
index da5ac00..0000000
--- a/recipes-kernel/kselftests/files/0001-selftests-net-use-LDLIBS-to-link-against-libnuma.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Subject: [PATCH] selftests: net: use LDLIBS to link against libnuma
-
-Use the same fixup as used for timers test:
-use LDLIBS to properly link against libnuma.
-
-Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
----
- tools/testing/selftests/net/Makefile |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/tools/testing/selftests/net/Makefile
-+++ b/tools/testing/selftests/net/Makefile
-@@ -9,9 +9,9 @@ NET_PROGS += reuseport_bpf reuseport_bpf
- NET_PROGS += reuseport_dualstack
- 
- all: $(NET_PROGS)
--reuseport_bpf_numa: LDFLAGS += -lnuma
-+reuseport_bpf_numa: LDLIBS += -lnuma
- %: %.c
--	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
-+	$(CC) $(CFLAGS) $(LDLIBS) -o $@ $^
- 
- TEST_PROGS := run_netsocktests run_afpackettests test_bpf.sh
- TEST_FILES := $(NET_PROGS)
diff --git a/recipes-kernel/kselftests/files/0001-selftests-seccomp-use-LDLIBS-to-link-against-libpthread.patch b/recipes-kernel/kselftests/files/0001-selftests-seccomp-use-LDLIBS-to-link-against-libpthread.patch
deleted file mode 100644
index 447a61b..0000000
--- a/recipes-kernel/kselftests/files/0001-selftests-seccomp-use-LDLIBS-to-link-against-libpthread.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 0fd29435ce41d60cdb3b5e06e491500ddc54a86b Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fathi.boudra@linaro.org>
-Date: Wed, 22 Mar 2017 17:39:37 +0200
-Subject: [PATCH] selftests: seccomp: use LDLIBS to link against libpthread
-
-Use the same fixup as used for timers test:
-use LDLIBS to properly link against libpthread.
-
-Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
----
- tools/testing/selftests/seccomp/Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/tools/testing/selftests/seccomp/Makefile
-+++ b/tools/testing/selftests/seccomp/Makefile
-@@ -1,6 +1,6 @@
- TEST_PROGS := seccomp_bpf
- CFLAGS += -Wl,-no-as-needed -Wall
--LDFLAGS += -lpthread
-+LDLIBS += -lpthread
- 
- all: $(TEST_PROGS)
- 
diff --git a/recipes-kernel/kselftests/files/0001-selftests-sigaltstack-fix-packaging.patch b/recipes-kernel/kselftests/files/0001-selftests-sigaltstack-fix-packaging.patch
deleted file mode 100644
index 4cc5907..0000000
--- a/recipes-kernel/kselftests/files/0001-selftests-sigaltstack-fix-packaging.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b0448d7816ca561b6470dc50fc1621aec2620f57 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fathi.boudra@linaro.org>
-Date: Wed, 22 Mar 2017 17:40:11 +0200
-Subject: [PATCH] selftests: sigaltstack: fix packaging
-
-sigaltstack was not using TEST_PROGS resulting in binary not being installed.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- tools/testing/selftests/sigaltstack/Makefile |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- a/tools/testing/selftests/sigaltstack/Makefile
-+++ b/tools/testing/selftests/sigaltstack/Makefile
-@@ -1,8 +1,8 @@
- CFLAGS = -Wall
--BINARIES = sas
--all: $(BINARIES)
-+TEST_PROGS = sas
-+all: $(TEST_PROGS)
- 
- include ../lib.mk
- 
- clean:
--	rm -rf $(BINARIES)
-+	rm -rf $(TEST_PROGS)
diff --git a/recipes-kernel/kselftests/files/0001-selftests-timers-use-LDLIBS-to-link-against-libpthread.patch b/recipes-kernel/kselftests/files/0001-selftests-timers-use-LDLIBS-to-link-against-libpthread.patch
deleted file mode 100644
index 9f12c6c..0000000
--- a/recipes-kernel/kselftests/files/0001-selftests-timers-use-LDLIBS-to-link-against-libpthread.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From b0448d7816ca561b6470dc50fc1621aec2620f57 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fathi.boudra@linaro.org>
-Date: Wed, 22 Mar 2017 17:40:11 +0200
-Subject: [PATCH] selftests: timers: use LDLIBS to link against libpthread
-
-use LDLIBS to properly link against libpthread.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- tools/testing/selftests/timers/Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/tools/testing/selftests/timers/Makefile
-+++ b/tools/testing/selftests/timers/Makefile
-@@ -1,7 +1,7 @@
- CC = $(CROSS_COMPILE)gcc
- BUILD_FLAGS = -DKTEST
- CFLAGS += -O3 -Wl,-no-as-needed -Wall $(BUILD_FLAGS)
--LDFLAGS += -lrt -lpthread
-+LDLIBS += -lrt -lpthread
- 
- # these are all "safe" tests that don't modify
- # system time or require escalated privledges
diff --git a/recipes-kernel/kselftests/kselftests_4.10.bb b/recipes-kernel/kselftests/kselftests_4.10.bb
deleted file mode 100644
index 5cd72f9..0000000
--- a/recipes-kernel/kselftests/kselftests_4.10.bb
+++ /dev/null
@@ -1,190 +0,0 @@
-SUMMARY = "Linux Kernel Selftests"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-SRC_URI = "\
-    https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz \
-    file://0001-selftests-lib-allow-to-override-CC-in-the-top-level-Makefile.patch \
-    file://0001-selftests-timers-use-LDLIBS-to-link-against-libpthread.patch \
-    file://0001-selftests-sigaltstack-fix-packaging.patch \
-    file://0001-selftests-seccomp-use-LDLIBS-to-link-against-libpthread.patch \
-    file://0001-selftests-gpio-use-pkg-config.patch \
-    file://0001-selftests-net-use-LDLIBS-to-link-against-libnuma.patch \
-    file://0001-selftests-breakpoints-allow-to-cross-compile-for-aar.patch;apply=no \
-    file://0001-selftests-add-ptp-to-TARGETS.patch \
-"
-
-SRC_URI[md5sum] = "b5e7f6b9b2fe1b6cc7bc56a3a0bfc090"
-SRC_URI[sha256sum] = "3c95d9f049bd085e5c346d2c77f063b8425f191460fcd3ae9fe7e94e0477dc4b"
-
-S = "${WORKDIR}/linux-${PV}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEPENDS = "libcap libcap-ng popt rsync-native util-linux pkgconfig-native \
-"
-
-inherit kernel-arch
-
-EXTRA_OEMAKE += "V=1 -C ${S}/tools/testing/selftests INSTALL_PATH=${D}${bindir}/kselftests CC="${CC}" LD="${LD}""
-
-do_compile () {
-	# Make sure to install the user space API used by some tests
-	# but not properly declared as a build dependency
-	${MAKE} -C ${S} headers_install
-	oe_runmake
-}
-
-do_install () {
-	oe_runmake install
-	chown -R root:root ${D}
-	# fixup run_kselftest.sh due to spurious lines starting by "make[1]:"
-	sed -i '/^make/d' ${D}${bindir}/kselftests/run_kselftest.sh
-}
-
-PACKAGE_BEFORE_PN = " \
-	${PN}-bpf \
-	${PN}-breakpoints \
-	${PN}-capabilities \
-	${PN}-cpu-hotplug \
-	${PN}-efivarfs \
-	${PN}-exec \
-	${PN}-firmware \
-	${PN}-ftrace \
-	${PN}-futex \
-	${PN}-gpio \
-	${PN}-ipc \
-	${PN}-kcmp \
-	${PN}-lib \
-	${PN}-membarrier \
-	${PN}-memfd \
-	${PN}-memory-hotplug \
-	${PN}-mount \
-	${PN}-mqueue \
-	${PN}-net \
-	${PN}-nsfs \
-	${PN}-powerpc \
-	${PN}-pstore \
-	${PN}-ptp \
-	${PN}-ptrace \
-	${PN}-seccomp \
-	${PN}-sigaltstack \
-	${PN}-size \
-	${PN}-static-keys \
-	${PN}-sync \
-	${PN}-sysctl \
-	${PN}-timers \
-	${PN}-user \
-	${PN}-vm \
-	${PN}-x86 \
-	${PN}-zram \
-"
-
-FILES:${PN}-bpf = "${bindir}/kselftests/bpf"
-FILES:${PN}-breakpoints = "${bindir}/kselftests/breakpoints"
-FILES:${PN}-capabilities = "${bindir}/kselftests/capabilities"
-FILES:${PN}-cpu-hotplug = "${bindir}/kselftests/cpu-hotplug"
-FILES:${PN}-efivarfs = "${bindir}/kselftests/efivarfs"
-FILES:${PN}-exec = "${bindir}/kselftests/exec"
-FILES:${PN}-firmware = "${bindir}/kselftests/firmware"
-FILES:${PN}-ftrace = "${bindir}/kselftests/ftrace"
-FILES:${PN}-futex = "${bindir}/kselftests/futex"
-FILES:${PN}-gpio = "${bindir}/kselftests/gpio"
-FILES:${PN}-ipc = "${bindir}/kselftests/ipc"
-FILES:${PN}-kcmp = "${bindir}/kselftests/kcmp"
-FILES:${PN}-lib = "${bindir}/kselftests/lib"
-FILES:${PN}-membarrier = "${bindir}/kselftests/membarrier"
-FILES:${PN}-memfd = "${bindir}/kselftests/memfd"
-FILES:${PN}-memory-hotplug = "${bindir}/kselftests/memory-hotplug"
-FILES:${PN}-mount = "${bindir}/kselftests/mount"
-FILES:${PN}-mqueue = "${bindir}/kselftests/mqueue"
-FILES:${PN}-net = "${bindir}/kselftests/net"
-FILES:${PN}-nsfs = "${bindir}/kselftests/nsfs"
-FILES:${PN}-powerpc = "${bindir}/kselftests/powerpc"
-FILES:${PN}-pstore = "${bindir}/kselftests/pstore"
-FILES:${PN}-ptp = "${bindir}/kselftests/ptp"
-FILES:${PN}-ptrace = "${bindir}/kselftests/ptrace"
-FILES:${PN}-seccomp = "${bindir}/kselftests/seccomp"
-FILES:${PN}-sigaltstack = "${bindir}/kselftests/sigaltstack"
-FILES:${PN}-size = "${bindir}/kselftests/size"
-FILES:${PN}-static-keys = "${bindir}/kselftests/static_keys"
-FILES:${PN}-sync = "${bindir}/kselftests/sync"
-FILES:${PN}-sysctl = "${bindir}/kselftests/sysctl"
-FILES:${PN}-timers = "${bindir}/kselftests/timers"
-FILES:${PN}-user = "${bindir}/kselftests/user"
-FILES:${PN}-vm = "${bindir}/kselftests/vm"
-FILES:${PN}-x86 = "${bindir}/kselftests/x86"
-FILES:${PN}-zram = "${bindir}/kselftests/zram"
-FILES:${PN}-dbg += "${bindir}/kselftests/*/.debug"
-
-# FIXME bpf target is failing to build and need to be fixed:
-# In file included from test_verifier.c:23:0:
-# ../../../../usr/include/linux/bpf_perf_event.h:14:17: error: field 'regs' has incomplete type
-#   struct pt_regs regs;
-#                  ^~~~
-# make[1]: *** [test_verifier] Error 1
-ALLOW_EMPTY:${PN}-bpf = "1"
-
-# gcc 7.x fails to build seccomp
-ALLOW_EMPTY:${PN}-seccomp = "1"
-
-# FIXME net target builds most of the binaries, but reuseport_bpf_numa depends on libnuma,
-# which is not availbale on ARM, failing entire test case
-ALLOW_EMPTY:${PN}-net = "1"
-
-RDEPENDS:${PN}-cpu-hotplug += "bash"
-RDEPENDS:${PN}-efivarfs += "bash"
-RDEPENDS:${PN}-futex += "bash ncurses"
-RDEPENDS:${PN}-gpio += "bash"
-RDEPENDS:${PN}-memory-hotplug += "bash"
-RDEPENDS:${PN}-net += "bash"
-RDEPENDS:${PN}-vm += "bash sudo"
-RDEPENDS:${PN}-zram += "bash bc"
-RDEPENDS:${PN} += "bash \
-	${PN}-bpf \
-	${PN}-capabilities \
-	${PN}-cpu-hotplug \
-	${PN}-efivarfs \
-	${PN}-exec \
-	${PN}-firmware \
-	${PN}-ftrace \
-	${PN}-futex \
-	${PN}-gpio \
-	${PN}-kcmp \
-	${PN}-lib \
-	${PN}-membarrier \
-	${PN}-memfd \
-	${PN}-memory-hotplug \
-	${PN}-mount \
-	${PN}-mqueue \
-	${PN}-net \
-	${PN}-nsfs \
-	${PN}-pstore \
-	${PN}-ptp \
-	${PN}-ptrace \
-	${PN}-seccomp \
-	${PN}-sigaltstack \
-	${PN}-size \
-	${PN}-static-keys \
-	${PN}-sync \
-	${PN}-sysctl \
-	${PN}-timers \
-	${PN}-user \
-	${PN}-vm \
-	${PN}-zram \
-"
-
-RDEPENDS:${PN}:append:aarch64 = " ${PN}-breakpoints ${PN}-ipc"
-RDEPENDS:${PN}:append:x86 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
-RDEPENDS:${PN}:append:x86-64 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
-RDEPENDS:${PN}:append:powerpc = " ${PN}-powerpc"
-RDEPENDS:${PN}:append:powerpc64 = " ${PN}-powerpc"
-
-INSANE_SKIP:${PN} = "already-stripped"
-INSANE_SKIP:${PN}-exec = "ldflags"
-INSANE_SKIP:${PN}-ipc = "ldflags"
-INSANE_SKIP:${PN}-mount = "ldflags"
-INSANE_SKIP:${PN}-vm = "ldflags"
-
-COMPATIBLE_MACHINE:riscv64 = "(null)"
-COMPATIBLE_MACHINE:riscv32 = "(null)"
-- 
2.7.4

