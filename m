Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BCAC5E00A5C; Fri, 24 Mar 2017 00:41:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03535E009B9
	for <meta-ti@yoctoproject.org>; Fri, 24 Mar 2017 00:41:47 -0700 (PDT)
Received: by mail-lf0-f43.google.com with SMTP id z15so2420825lfd.1
	for <meta-ti@yoctoproject.org>; Fri, 24 Mar 2017 00:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Ot1e1FUbstpJmf3V+eYKFciupvLuxeHBvEFOqvLfAQQ=;
	b=KCYCyg7x8O5yhypWdb6/gpERDtlNJnYJc1Afmqq2yzRTyjk0cQSgAS+S93nw4hKlPr
	6n8P1Q34WKmGzarNYtJdGjlorMeeJjXCSTe380zlA4+i+qU2KT2g10HQe0MhifY1zfXS
	RwZ7sJb8jetNXs8i1jK8RAFF9CU5pMldIZ2lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ot1e1FUbstpJmf3V+eYKFciupvLuxeHBvEFOqvLfAQQ=;
	b=s7uB95ONqDH8KBngQMkfkpra95dIvQ5zHbgYO97s0XTnwmaI7FGewewdd126k0NjEc
	sNdlQA8Zb6jkrOi5pXl9MtfbBoRNtASumuroNV7r4ZJe4HZGJuwna5HWbZpcr3wVumZQ
	Ncfly3EhzZPe3zlKzHD7ZmuUo9GSG4TCqroup9tB3yP0KbqAc6CeuemtR0qI2tobIeZp
	1PlC/D09BlcZdlj8SZWoFyE6SMxcCArNZTBbu3UZ152GGIoVqBQtUwwRzGtQTtk+brg0
	KFmm0zeD2BOqfmaodr/nFpVaXwZzGOZxiU9UH7+g7m6sfF/4Ax8UVSnvrgHEqkNCB9t/
	9Qqg==
X-Gm-Message-State: AFeK/H1Hf59qbJ0EWtdXDGnznoZHjn7NYC/kX7LJrUtN8akUmAdq4tyYsPky20XfwNbG/7RN
X-Received: by 10.25.219.213 with SMTP id t82mr3353842lfi.75.1490341306117;
	Fri, 24 Mar 2017 00:41:46 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16])
	by smtp.gmail.com with ESMTPSA id s65sm229491lfg.19.2017.03.24.00.41.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 00:41:44 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-ti@yoctoproject.org
Date: Fri, 24 Mar 2017 09:41:42 +0200
Message-Id: <20170324074142.1294-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] kselftests: update to 4.10
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
X-List-Received-Date: Fri, 24 Mar 2017 07:41:50 -0000

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
* Workaround broken gpio packaging: gpio-mockup-chardev binary isn't
  installed so install manually for now.
* Add new packages: bpf, gpio and sync tests.
* Allow empty package for bpf. It fails to build and need to be fixed.
* Add breakpoints package on Aarch64. An arch specific test has been
  added, though it is currently broken due to missing TRAP_BRANCH and
  TRAP_HWBKPT definitions in glibc siginfo.
* Get rid of do_configure() and convert the Makefiles fixes to patches,
  easier to upstream.
* Add patches to fix gpio and net tests. Also add a partial patch for
  breakpoints on Aarch64, not applied for now because we need the glibc
  fixes counterpart (see explanation above).

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 ...reakpoints-allow-to-cross-compile-for-aar.patch | 32 ++++++++
 .../files/0001-selftests-gpio-use-pkg-config.patch | 21 +++++
 ...-to-override-CC-in-the-top-level-Makefile.patch | 22 ++++++
 ...ts-net-use-LDLIBS-to-link-against-libnuma.patch | 24 ++++++
 ...omp-use-LDLIBS-to-link-against-libpthread.patch | 23 ++++++
 .../0001-selftests-sigaltstack-fix-packaging.patch | 26 +++++++
 ...ers-use-LDLIBS-to-link-against-libpthread.patch | 23 ++++++
 .../{kselftests_4.9.bb => kselftests_4.10.bb}      | 90 +++++++++-------------
 8 files changed, 208 insertions(+), 53 deletions(-)
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-breakpoints-allow-to-cross-compile-for-aar.patch
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-gpio-use-pkg-config.patch
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-lib-allow-to-override-CC-in-the-top-level-Makefile.patch
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-net-use-LDLIBS-to-link-against-libnuma.patch
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-seccomp-use-LDLIBS-to-link-against-libpthread.patch
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-sigaltstack-fix-packaging.patch
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-timers-use-LDLIBS-to-link-against-libpthread.patch
 rename recipes-kernel/kselftests/{kselftests_4.9.bb => kselftests_4.10.bb} (66%)

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
index 00000000..45869eb7
--- /dev/null
+++ b/recipes-kernel/kselftests/files/0001-selftests-gpio-use-pkg-config.patch
@@ -0,0 +1,21 @@
+From: Fathi Boudra <fathi.boudra@linaro.org>
+Subject: [PATCH] selftests: gpio: use pkg-config
+
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+---
+ tools/testing/selftests/gpio/Makefile |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/tools/testing/selftests/gpio/Makefile
++++ b/tools/testing/selftests/gpio/Makefile
+@@ -10,8 +10,8 @@ all: $(BINARIES)
+ clean:
+ 	$(RM) $(BINARIES)
+ 
+-CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
+-LDLIBS += -lmount -I/usr/include/libmount
++CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/ $(shell pkg-config --cflags mount)
++LDLIBS += $(shell pkg-config --libs mount)
+ 
+ $(BINARIES): ../../../gpio/gpio-utils.o ../../../../usr/include/linux/gpio.h
+ 
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
similarity index 66%
rename from recipes-kernel/kselftests/kselftests_4.9.bb
rename to recipes-kernel/kselftests/kselftests_4.10.bb
index 9d3f1d73..1f082be4 100644
--- a/recipes-kernel/kselftests/kselftests_4.9.bb
+++ b/recipes-kernel/kselftests/kselftests_4.10.bb
@@ -2,70 +2,34 @@ SUMMARY = "Linux Kernel Selftests"
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
+DEPENDS = "libcap libcap-ng numactl popt rsync-native util-linux"
 
 inherit kernel-arch
 
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
-"
-
-EXTRA_OEMAKE += "-C tools/testing/selftests TARGETS="${TARGETS}" INSTALL_PATH=${D}${bindir}/kselftests CC="${CC}""
-
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
 
@@ -74,9 +38,12 @@ do_install () {
 	chown -R root:root ${D}
 	# fixup run_kselftest.sh due to spurious lines starting by "make[1]:"
 	sed -i '/^make/d' ${D}${bindir}/kselftests/run_kselftest.sh
+	# FIXME gpio-mockup-chardev binary isn't installed
+	cp -a ${B}/tools/testing/selftests/gpio/gpio-mockup-chardev ${D}${bindir}/kselftests/gpio/
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
@@ -143,6 +115,14 @@ FILES_${PN}-x86 = "${bindir}/kselftests/x86"
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
@@ -151,6 +131,7 @@ RDEPENDS_${PN}-net += "bash"
 RDEPENDS_${PN}-vm += "bash"
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
 
+RDEPENDS_${PN}_append_aarch64 = " ${PN}-breakpoints"
 RDEPENDS_${PN}_append_x86 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
 RDEPENDS_${PN}_append_x86-64 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
 RDEPENDS_${PN}_append_powerpc = " ${PN}-powerpc"
-- 
2.11.0


