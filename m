Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65137E006CD; Tue, 28 Mar 2017 23:06:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9FBFAE00546
	for <meta-ti@yoctoproject.org>; Tue, 28 Mar 2017 23:06:28 -0700 (PDT)
Received: by mail-lf0-f45.google.com with SMTP id j90so2389654lfk.2
	for <meta-ti@yoctoproject.org>; Tue, 28 Mar 2017 23:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=gcIdhU/IOuCTK81HYTbKGROopveSW7DNe1qLies1NKk=;
	b=Q/JGpfeUJ4UqlrhHpbfPpq6TdqqVIGaNjB6bchmKQBq3p1/pN55Uv2nQSfLzUp+8r1
	5ckFTXfmyebojcAslqR7n97d/zQR3uIQw/TLij+gncHo0R+nhk9L1SXVWmUUDhbUhVtJ
	mtTuW+66sS6v/jyrUh4W33EUPGzO3nk+uF+HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gcIdhU/IOuCTK81HYTbKGROopveSW7DNe1qLies1NKk=;
	b=l8F6OJzurv76HIUDCxLW9vA6oxs2BlUznmWqtY4jsXO7t0oa2D1i21ko7rKX59cPAz
	Vl7XHYbraeMvznXr2ZBlhKR4xKVHJy2X3LK63CSVrKS31SP+7vhm3TmsKscFkaPk4lFS
	/vgK5tM6pFBkdAxApNwC44qHHk/nJoQn/WRqWMtdYZGhZ2gdeq48x6i2FIzi17CsgBMP
	/oSK8H6zzX53oBaeYh33GQ6FylK8XdnNVaF+qPRXqzcyhm0/yBXFch1RMDapaf4fpXHa
	li79cMvtaI9Ybir2W6kMJqnmlUFt3s6Yl1xy4N5d5ZAY4/R1IomoxG0pF/P3H3trcgrF
	0+7A==
X-Gm-Message-State: AFeK/H3BUR0RbxNgDl+kYd4Bbglv4/L9yZ0j2mGyDJmuxrWh0mQoOJedIglmojEp4iS1Ld2N
X-Received: by 10.25.22.101 with SMTP id m98mr10983194lfi.176.1490767587296;
	Tue, 28 Mar 2017 23:06:27 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	e13sm1097809lfb.14.2017.03.28.23.06.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Mar 2017 23:06:26 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-ti@yoctoproject.org
Date: Wed, 29 Mar 2017 09:06:27 +0300
Message-Id: <20170329060627.28169-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v3] kselftests: update to 4.10
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
X-List-Received-Date: Wed, 29 Mar 2017 06:06:33 -0000

* Adjust md5sum/sha256sum for the updated tarball
* Add new dependencies:
  - numactl, used by net tests (for libnuma)
  - util-linux, used by gpio tests (for libmount)
* Get rid of the TARGETS list, manually maintained. Rely on the top-level
  Makefile to call all the TARGETS. As a result, TARGETS isn't passed to
  EXTRA_OEMAKE anymore.
* Update EXTRA-OEMAKE:
  - pass V=1 to be more verbose in the logs
  - pass LD to fix gpio tests and avoid to use native linker causing a
    build failure in cross-compilation environment.
* Call headers_install in do_compile() to make sure to install the user
  space API used by some tests but not properly declared as a build
  dependency.
* Add new packages: bpf, gpio and sync tests.
* Allow empty package for bpf. It fails to build and need to be fixed.
* Add sudo to vm package RDEPENDS.
* Add breakpoints package on Aarch64. An arch specific test has been
  added, though it is currently broken due to missing TRAP_BRANCH and
  TRAP_HWBKPT definitions in glibc siginfo.
* Add ipc package on Aarch64.
* Get rid of do_configure() and convert the Makefiles fixes to patches,
  easier to upstream.
* Add patches to fix gpio and net tests. Also add a partial patch for
  breakpoints on Aarch64, not applied for now because we need the glibc
  fixes counterpart (see explanation above).

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---

Changes in v3:
 * Add the patches, missed to be included in v2.
 * Add sudo to vm package RDEPENDS.
 * Add ipc package on Aarch64.

Changes in v2:
 * Remove the workaround for broken gpio packaging and gpio-mockup-chardev
   binary installation. Fixed in 0001-selftests-gpio-use-pkg-config.patch
 * Reported by Denys Dmytriyenko, fix numctl DEPENDS as ARM doesn't support
   NUMA (not in COMPATIBLE_HOST).

 ...reakpoints-allow-to-cross-compile-for-aar.patch | 32 ++++++++
 .../files/0001-selftests-gpio-use-pkg-config.patch | 53 +++++++++++++
 ...-to-override-CC-in-the-top-level-Makefile.patch | 22 ++++++
 ...ts-net-use-LDLIBS-to-link-against-libnuma.patch | 24 ++++++
 ...omp-use-LDLIBS-to-link-against-libpthread.patch | 23 ++++++
 .../0001-selftests-sigaltstack-fix-packaging.patch | 26 ++++++
 ...ers-use-LDLIBS-to-link-against-libpthread.patch | 23 ++++++
 .../{kselftests_4.9.bb => kselftests_4.10.bb}      | 92 +++++++++-------------
 8 files changed, 241 insertions(+), 54 deletions(-)
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-breakpoints-allow-to-cross-compile-for-aar.patch
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-gpio-use-pkg-config.patch
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-lib-allow-to-override-CC-in-the-top-level-Makefile.patch
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-net-use-LDLIBS-to-link-against-libnuma.patch
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-seccomp-use-LDLIBS-to-link-against-libpthread.patch
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-sigaltstack-fix-packaging.patch
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-timers-use-LDLIBS-to-link-against-libpthread.patch
 rename recipes-kernel/kselftests/{kselftests_4.9.bb => kselftests_4.10.bb} (65%)

diff --git a/recipes-kernel/kselftests/files/0001-selftests-breakpoints-allow-to-cross-compile-for-aar.patch b/recipes-kernel/kselftests/files/0001-selftests-breakpoints-allow-to-cross-compile-for-aar.patch
new file mode 100644
index 00000000..8b7aa25a
--- /dev/null
+++ b/recipes-kernel/kselftests/files/0001-selftests-breakpoints-allow-to-cross-compile-for-aar.patch
@@ -0,0 +1,32 @@
+From 607192f42d65e17f55fc6e85c00019bf71b18770 Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fathi.boudra@linaro.org>
+Date: Wed, 22 Mar 2017 19:47:32 +0200
+Subject: [PATCH 1/1] selftests: breakpoints: allow to cross-compile for
+ aarch64/arm64
+
+To build breakpoint_test_arm64, ARCH value is only tested for "aarch64".
+It covers only the native build because it's computed from uname -m output.
+For cross-compilation, ARCH is set to arm64 and prevent to cross-compile
+the test.
+Fix the test to allow both native and cross-compilation of the test.
+
+Note: glibc is missing several of the TRAP_* constants in the userspace
+      definitions. Specifically TRAP_BRANCH and TRAP_HWBKPT.
+      See https://sourceware.org/bugzilla/show_bug.cgi?id=21286
+
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+---
+ tools/testing/selftests/breakpoints/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/tools/testing/selftests/breakpoints/Makefile
++++ b/tools/testing/selftests/breakpoints/Makefile
+@@ -5,7 +5,7 @@ ARCH ?= $(shell echo $(uname_M) | sed -e
+ ifeq ($(ARCH),x86)
+ TEST_PROGS := breakpoint_test
+ endif
+-ifeq ($(ARCH),aarch64)
++ifneq (,$(filter $(ARCH),aarch64 arm64))
+ TEST_PROGS := breakpoint_test_arm64
+ endif
+ 
diff --git a/recipes-kernel/kselftests/files/0001-selftests-gpio-use-pkg-config.patch b/recipes-kernel/kselftests/files/0001-selftests-gpio-use-pkg-config.patch
new file mode 100644
index 00000000..0d0bfc7e
--- /dev/null
+++ b/recipes-kernel/kselftests/files/0001-selftests-gpio-use-pkg-config.patch
@@ -0,0 +1,53 @@
+From: Fathi Boudra <fathi.boudra@linaro.org>
+Subject: [PATCH] selftests: gpio: use pkg-config
+
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+---
+---
+ tools/testing/selftests/gpio/Makefile |   31 ++++++++++++++++++-------------
+ 1 file changed, 18 insertions(+), 13 deletions(-)
+
+--- a/tools/testing/selftests/gpio/Makefile
++++ b/tools/testing/selftests/gpio/Makefile
+@@ -1,23 +1,28 @@
++CFLAGS += -O2 -g -std=gnu99 -Wall
++CFLAGS += -I../../../../usr/include/
++CFLAGS += $(shell pkg-config --cflags mount)
++LDLIBS += $(shell pkg-config --libs mount)
+ 
+ TEST_PROGS := gpio-mockup.sh
+-TEST_FILES := gpio-mockup-sysfs.sh $(BINARIES)
+-BINARIES := gpio-mockup-chardev
++TEST_PROGS_EXTENDED := gpio-mockup-chardev
++TEST_FILES := gpio-mockup-sysfs.sh
+ 
+-include ../lib.mk
++GPIODIR := ../../../gpio
++GPIOOBJ := gpio-utils.o
++GPIOINC := gpio.h
+ 
+-all: $(BINARIES)
++all: $(GPIOINC) $(TEST_PROGS_EXTENDED)
+ 
+ clean:
+-	$(RM) $(BINARIES)
+-
+-CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
+-LDLIBS += -lmount -I/usr/include/libmount
++	$(RM) $(TEST_PROGS_EXTENDED)
++	$(MAKE) -C $(GPIODIR) clean
+ 
+-$(BINARIES): ../../../gpio/gpio-utils.o ../../../../usr/include/linux/gpio.h
++include ../lib.mk
+ 
+-../../../gpio/gpio-utils.o:
+-	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
++$(TEST_PROGS_EXTENDED): $(GPIODIR)/$(GPIOOBJ)
+ 
+-../../../../usr/include/linux/gpio.h:
+-	make -C ../../../.. headers_install INSTALL_HDR_PATH=$(shell pwd)/../../../../usr/
++$(GPIODIR)/$(GPIOOBJ):
++	$(MAKE) -C $(GPIODIR)
+ 
++$(GPIOINC):
++	$(MAKE) -C ../../../.. headers_install
diff --git a/recipes-kernel/kselftests/files/0001-selftests-lib-allow-to-override-CC-in-the-top-level-Makefile.patch b/recipes-kernel/kselftests/files/0001-selftests-lib-allow-to-override-CC-in-the-top-level-Makefile.patch
new file mode 100644
index 00000000..9d48fd5d
--- /dev/null
+++ b/recipes-kernel/kselftests/files/0001-selftests-lib-allow-to-override-CC-in-the-top-level-Makefile.patch
@@ -0,0 +1,22 @@
+From 2e93b68257aa88ccdc127ca119304a5f4c76b7c5 Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fathi.boudra@linaro.org>
+Date: Wed, 22 Mar 2017 17:36:53 +0200
+Subject: [PATCH] selftests: lib: allow to override CC in the top-level Makefile
+
+Relax CC assignment to allow to override CC in the top-level Makefile.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ tools/testing/selftests/lib.mk |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/tools/testing/selftests/lib.mk
++++ b/tools/testing/selftests/lib.mk
+@@ -1,6 +1,6 @@
+ # This mimics the top-level Makefile. We do it explicitly here so that this
+ # Makefile can operate with or without the kbuild infrastructure.
+-CC := $(CROSS_COMPILE)gcc
++CC ?= $(CROSS_COMPILE)gcc
+ 
+ define RUN_TESTS
+ 	@for TEST in $(TEST_PROGS); do \
diff --git a/recipes-kernel/kselftests/files/0001-selftests-net-use-LDLIBS-to-link-against-libnuma.patch b/recipes-kernel/kselftests/files/0001-selftests-net-use-LDLIBS-to-link-against-libnuma.patch
new file mode 100644
index 00000000..da5ac00c
--- /dev/null
+++ b/recipes-kernel/kselftests/files/0001-selftests-net-use-LDLIBS-to-link-against-libnuma.patch
@@ -0,0 +1,24 @@
+Subject: [PATCH] selftests: net: use LDLIBS to link against libnuma
+
+Use the same fixup as used for timers test:
+use LDLIBS to properly link against libnuma.
+
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+---
+ tools/testing/selftests/net/Makefile |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/tools/testing/selftests/net/Makefile
++++ b/tools/testing/selftests/net/Makefile
+@@ -9,9 +9,9 @@ NET_PROGS += reuseport_bpf reuseport_bpf
+ NET_PROGS += reuseport_dualstack
+ 
+ all: $(NET_PROGS)
+-reuseport_bpf_numa: LDFLAGS += -lnuma
++reuseport_bpf_numa: LDLIBS += -lnuma
+ %: %.c
+-	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
++	$(CC) $(CFLAGS) $(LDLIBS) -o $@ $^
+ 
+ TEST_PROGS := run_netsocktests run_afpackettests test_bpf.sh
+ TEST_FILES := $(NET_PROGS)
diff --git a/recipes-kernel/kselftests/files/0001-selftests-seccomp-use-LDLIBS-to-link-against-libpthread.patch b/recipes-kernel/kselftests/files/0001-selftests-seccomp-use-LDLIBS-to-link-against-libpthread.patch
new file mode 100644
index 00000000..447a61bb
--- /dev/null
+++ b/recipes-kernel/kselftests/files/0001-selftests-seccomp-use-LDLIBS-to-link-against-libpthread.patch
@@ -0,0 +1,23 @@
+From 0fd29435ce41d60cdb3b5e06e491500ddc54a86b Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fathi.boudra@linaro.org>
+Date: Wed, 22 Mar 2017 17:39:37 +0200
+Subject: [PATCH] selftests: seccomp: use LDLIBS to link against libpthread
+
+Use the same fixup as used for timers test:
+use LDLIBS to properly link against libpthread.
+
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+---
+ tools/testing/selftests/seccomp/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/tools/testing/selftests/seccomp/Makefile
++++ b/tools/testing/selftests/seccomp/Makefile
+@@ -1,6 +1,6 @@
+ TEST_PROGS := seccomp_bpf
+ CFLAGS += -Wl,-no-as-needed -Wall
+-LDFLAGS += -lpthread
++LDLIBS += -lpthread
+ 
+ all: $(TEST_PROGS)
+ 
diff --git a/recipes-kernel/kselftests/files/0001-selftests-sigaltstack-fix-packaging.patch b/recipes-kernel/kselftests/files/0001-selftests-sigaltstack-fix-packaging.patch
new file mode 100644
index 00000000..4cc5907a
--- /dev/null
+++ b/recipes-kernel/kselftests/files/0001-selftests-sigaltstack-fix-packaging.patch
@@ -0,0 +1,26 @@
+From b0448d7816ca561b6470dc50fc1621aec2620f57 Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fathi.boudra@linaro.org>
+Date: Wed, 22 Mar 2017 17:40:11 +0200
+Subject: [PATCH] selftests: sigaltstack: fix packaging
+
+sigaltstack was not using TEST_PROGS resulting in binary not being installed.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ tools/testing/selftests/sigaltstack/Makefile |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- a/tools/testing/selftests/sigaltstack/Makefile
++++ b/tools/testing/selftests/sigaltstack/Makefile
+@@ -1,8 +1,8 @@
+ CFLAGS = -Wall
+-BINARIES = sas
+-all: $(BINARIES)
++TEST_PROGS = sas
++all: $(TEST_PROGS)
+ 
+ include ../lib.mk
+ 
+ clean:
+-	rm -rf $(BINARIES)
++	rm -rf $(TEST_PROGS)
diff --git a/recipes-kernel/kselftests/files/0001-selftests-timers-use-LDLIBS-to-link-against-libpthread.patch b/recipes-kernel/kselftests/files/0001-selftests-timers-use-LDLIBS-to-link-against-libpthread.patch
new file mode 100644
index 00000000..9f12c6ca
--- /dev/null
+++ b/recipes-kernel/kselftests/files/0001-selftests-timers-use-LDLIBS-to-link-against-libpthread.patch
@@ -0,0 +1,23 @@
+From b0448d7816ca561b6470dc50fc1621aec2620f57 Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fathi.boudra@linaro.org>
+Date: Wed, 22 Mar 2017 17:40:11 +0200
+Subject: [PATCH] selftests: timers: use LDLIBS to link against libpthread
+
+use LDLIBS to properly link against libpthread.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ tools/testing/selftests/timers/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/tools/testing/selftests/timers/Makefile
++++ b/tools/testing/selftests/timers/Makefile
+@@ -1,7 +1,7 @@
+ CC = $(CROSS_COMPILE)gcc
+ BUILD_FLAGS = -DKTEST
+ CFLAGS += -O3 -Wl,-no-as-needed -Wall $(BUILD_FLAGS)
+-LDFLAGS += -lrt -lpthread
++LDLIBS += -lrt -lpthread
+ 
+ # these are all "safe" tests that don't modify
+ # system time or require escalated privledges
diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.10.bb
similarity index 65%
rename from recipes-kernel/kselftests/kselftests_4.9.bb
rename to recipes-kernel/kselftests/kselftests_4.10.bb
index 9d3f1d73..9ae09a67 100644
--- a/recipes-kernel/kselftests/kselftests_4.9.bb
+++ b/recipes-kernel/kselftests/kselftests_4.10.bb
@@ -2,70 +2,36 @@ SUMMARY = "Linux Kernel Selftests"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-SRC_URI = "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz"
+SRC_URI = "\
+    https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz \
+    file://0001-selftests-lib-allow-to-override-CC-in-the-top-level-Makefile.patch \
+    file://0001-selftests-timers-use-LDLIBS-to-link-against-libpthread.patch \
+    file://0001-selftests-sigaltstack-fix-packaging.patch \
+    file://0001-selftests-seccomp-use-LDLIBS-to-link-against-libpthread.patch \
+    file://0001-selftests-gpio-use-pkg-config.patch \
+    file://0001-selftests-net-use-LDLIBS-to-link-against-libnuma.patch \
+    file://0001-selftests-breakpoints-allow-to-cross-compile-for-aar.patch;apply=no \
+"
 
-SRC_URI[md5sum] = "0a68ef3615c64bd5ee54a3320e46667d"
-SRC_URI[sha256sum] = "029098dcffab74875e086ae970e3828456838da6e0ba22ce3f64ef764f3d7f1a"
+SRC_URI[md5sum] = "b5e7f6b9b2fe1b6cc7bc56a3a0bfc090"
+SRC_URI[sha256sum] = "3c95d9f049bd085e5c346d2c77f063b8425f191460fcd3ae9fe7e94e0477dc4b"
 
 S = "${WORKDIR}/linux-${PV}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS = "libcap libcap-ng popt rsync-native"
-
-inherit kernel-arch
-
-# Filter out arch specific tests
-TARGETS = " \
-	${@bb.utils.contains_any("TARGET_ARCH", [ "x86", "x86-64" ], "breakpoints", "", d)} \
-	capabilities \
-	cpu-hotplug \
-	efivarfs \
-	exec \
-	firmware \
-	ftrace \
-	futex \
-	${@bb.utils.contains_any("TARGET_ARCH", [ "x86", "x86-64" ], "ipc", "", d)} \
-	kcmp \
-	lib \
-	membarrier \
-	memfd \
-	memory-hotplug \
-	mount \
-	mqueue \
-	net \
-	nsfs \
-	${@bb.utils.contains_any("TARGET_ARCH", [ "powerpc", "powerpc64" ], "powerpc", "", d)} \
-	pstore \
-	ptrace \
-	seccomp \
-	sigaltstack \
-	size \
-	static_keys \
-	sysctl \
-	timers \
-	user \
-	vm \
-	${@bb.utils.contains_any("TARGET_ARCH", [ "x86", "x86-64" ], "x86", "", d)} \
-	zram \
+DEPENDS = "libcap libcap-ng popt rsync-native util-linux \
+    ${@bb.utils.contains("TARGET_ARCH", "arm", "", "numactl", d)} \
 "
 
-EXTRA_OEMAKE += "-C tools/testing/selftests TARGETS="${TARGETS}" INSTALL_PATH=${D}${bindir}/kselftests CC="${CC}""
+inherit kernel-arch
 
-# Their Makefiles are so sloppy, let's clean up a bit
-do_configure () {
-	sed "s|^CC := .*||g" -i ${S}/tools/testing/selftests/lib.mk
-	sed "s|^CC = .*||g" -i ${S}/tools/testing/selftests/timers/Makefile
-	sed "s|^CC = .*||g" -i ${S}/tools/testing/selftests/memfd/Makefile
-	sed "s|^CC := .*||g" -i ${S}/tools/testing/selftests/powerpc/switch_endian/Makefile
-	sed "s|gcc|\$(CC)|g" -i ${S}/tools/testing/selftests/breakpoints/Makefile
-	sed "s|TARGETS|F_TARGETS|g" -i ${S}/tools/testing/selftests/futex/functional/Makefile
-	sed "s|^LDFLAGS += -lpthread|LDLIBS += -lpthread|g" -i ${S}/tools/testing/selftests/seccomp/Makefile
-	sed "s|^LDFLAGS += -lrt -lpthread|LDLIBS += -lrt -lpthread|g" -i ${S}/tools/testing/selftests/timers/Makefile
-	sed "s|BINARIES|TEST_PROGS|g" -i ${S}/tools/testing/selftests/sigaltstack/Makefile
-}
+EXTRA_OEMAKE += "V=1 -C ${S}/tools/testing/selftests INSTALL_PATH=${D}${bindir}/kselftests CC="${CC}" LD="${LD}""
 
 do_compile () {
+	# Make sure to install the user space API used by some tests
+	# but not properly declared as a build dependency
+	${MAKE} -C ${S} headers_install
 	oe_runmake
 }
 
@@ -77,6 +43,7 @@ do_install () {
 }
 
 PACKAGE_BEFORE_PN = " \
+	${PN}-bpf \
 	${PN}-breakpoints \
 	${PN}-capabilities \
 	${PN}-cpu-hotplug \
@@ -85,6 +52,7 @@ PACKAGE_BEFORE_PN = " \
 	${PN}-firmware \
 	${PN}-ftrace \
 	${PN}-futex \
+	${PN}-gpio \
 	${PN}-ipc \
 	${PN}-kcmp \
 	${PN}-lib \
@@ -102,6 +70,7 @@ PACKAGE_BEFORE_PN = " \
 	${PN}-sigaltstack \
 	${PN}-size \
 	${PN}-static-keys \
+	${PN}-sync \
 	${PN}-sysctl \
 	${PN}-timers \
 	${PN}-user \
@@ -110,6 +79,7 @@ PACKAGE_BEFORE_PN = " \
 	${PN}-zram \
 "
 
+FILES_${PN}-bpf = "${bindir}/kselftests/bpf"
 FILES_${PN}-breakpoints = "${bindir}/kselftests/breakpoints"
 FILES_${PN}-capabilities = "${bindir}/kselftests/capabilities"
 FILES_${PN}-cpu-hotplug = "${bindir}/kselftests/cpu-hotplug"
@@ -118,6 +88,7 @@ FILES_${PN}-exec = "${bindir}/kselftests/exec"
 FILES_${PN}-firmware = "${bindir}/kselftests/firmware"
 FILES_${PN}-ftrace = "${bindir}/kselftests/ftrace"
 FILES_${PN}-futex = "${bindir}/kselftests/futex"
+FILES_${PN}-gpio = "${bindir}/kselftests/gpio"
 FILES_${PN}-ipc = "${bindir}/kselftests/ipc"
 FILES_${PN}-kcmp = "${bindir}/kselftests/kcmp"
 FILES_${PN}-lib = "${bindir}/kselftests/lib"
@@ -135,6 +106,7 @@ FILES_${PN}-seccomp = "${bindir}/kselftests/seccomp"
 FILES_${PN}-sigaltstack = "${bindir}/kselftests/sigaltstack"
 FILES_${PN}-size = "${bindir}/kselftests/size"
 FILES_${PN}-static-keys = "${bindir}/kselftests/static_keys"
+FILES_${PN}-sync = "${bindir}/kselftests/sync"
 FILES_${PN}-sysctl = "${bindir}/kselftests/sysctl"
 FILES_${PN}-timers = "${bindir}/kselftests/timers"
 FILES_${PN}-user = "${bindir}/kselftests/user"
@@ -143,14 +115,23 @@ FILES_${PN}-x86 = "${bindir}/kselftests/x86"
 FILES_${PN}-zram = "${bindir}/kselftests/zram"
 FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
 
+# FIXME bpf target is failing to build and need to be fixed:
+# In file included from test_verifier.c:23:0:
+# ../../../../usr/include/linux/bpf_perf_event.h:14:17: error: field 'regs' has incomplete type
+#   struct pt_regs regs;
+#                  ^~~~
+# make[1]: *** [test_verifier] Error 1
+ALLOW_EMPTY_${PN}-bpf = "1"
+
 RDEPENDS_${PN}-cpu-hotplug += "bash"
 RDEPENDS_${PN}-efivarfs += "bash"
 RDEPENDS_${PN}-futex += "bash ncurses"
 RDEPENDS_${PN}-memory-hotplug += "bash"
 RDEPENDS_${PN}-net += "bash"
-RDEPENDS_${PN}-vm += "bash"
+RDEPENDS_${PN}-vm += "bash sudo"
 RDEPENDS_${PN}-zram += "bash"
 RDEPENDS_${PN} += "bash \
+	${PN}-bpf \
 	${PN}-capabilities \
 	${PN}-cpu-hotplug \
 	${PN}-efivarfs \
@@ -158,6 +139,7 @@ RDEPENDS_${PN} += "bash \
 	${PN}-firmware \
 	${PN}-ftrace \
 	${PN}-futex \
+	${PN}-gpio \
 	${PN}-kcmp \
 	${PN}-lib \
 	${PN}-membarrier \
@@ -173,6 +155,7 @@ RDEPENDS_${PN} += "bash \
 	${PN}-sigaltstack \
 	${PN}-size \
 	${PN}-static-keys \
+	${PN}-sync \
 	${PN}-sysctl \
 	${PN}-timers \
 	${PN}-user \
@@ -180,6 +163,7 @@ RDEPENDS_${PN} += "bash \
 	${PN}-zram \
 "
 
+RDEPENDS_${PN}_append_aarch64 = " ${PN}-breakpoints ${PN}-ipc"
 RDEPENDS_${PN}_append_x86 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
 RDEPENDS_${PN}_append_x86-64 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
 RDEPENDS_${PN}_append_powerpc = " ${PN}-powerpc"
-- 
2.11.0


