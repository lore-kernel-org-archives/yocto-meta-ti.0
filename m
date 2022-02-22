Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.8875.1645503204210902079
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A450D40A28
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZmPLjXF2N2H for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B6B0A40C93
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A62B5174770
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 16/19] kselftests: remove outdated version in favor of upstream
Date: Tue, 22 Feb 2022 04:13:11 +0000
Message-Id: <20220222041314.2840028-17-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Newer versions of Linux kernel selftests are available from meta-oe.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../0001-selftests-add-ptp-to-TARGETS.patch   |  25 ---
 ...oints-allow-to-cross-compile-for-aar.patch |  32 ---
 .../0001-selftests-gpio-use-pkg-config.patch  |  53 -----
 ...verride-CC-in-the-top-level-Makefile.patch |  22 --
 ...t-use-LDLIBS-to-link-against-libnuma.patch |  24 ---
 ...se-LDLIBS-to-link-against-libpthread.patch |  23 ---
 ...-selftests-sigaltstack-fix-packaging.patch |  26 ---
 ...se-LDLIBS-to-link-against-libpthread.patch |  23 ---
 recipes-kernel/kselftests/kselftests_4.10.bb  | 190 ------------------
 9 files changed, 418 deletions(-)
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-add-pt=
p-to-TARGETS.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-breakp=
oints-allow-to-cross-compile-for-aar.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-gpio-u=
se-pkg-config.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-lib-al=
low-to-override-CC-in-the-top-level-Makefile.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-net-us=
e-LDLIBS-to-link-against-libnuma.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-seccom=
p-use-LDLIBS-to-link-against-libpthread.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-sigalt=
stack-fix-packaging.patch
 delete mode 100644 recipes-kernel/kselftests/files/0001-selftests-timers=
-use-LDLIBS-to-link-against-libpthread.patch
 delete mode 100644 recipes-kernel/kselftests/kselftests_4.10.bb

diff --git a/recipes-kernel/kselftests/files/0001-selftests-add-ptp-to-TA=
RGETS.patch b/recipes-kernel/kselftests/files/0001-selftests-add-ptp-to-T=
ARGETS.patch
deleted file mode 100644
index 4c4a00e7..00000000
--- a/recipes-kernel/kselftests/files/0001-selftests-add-ptp-to-TARGETS.p=
atch
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
-diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/=
Makefile
-index 831022b1..6bd7cf81 100644
---- a/tools/testing/selftests/Makefile
-+++ b/tools/testing/selftests/Makefile
-@@ -20,6 +20,7 @@ TARGETS +=3D net
- TARGETS +=3D nsfs
- TARGETS +=3D powerpc
- TARGETS +=3D pstore
-+TARGETS +=3D ptp
- TARGETS +=3D ptrace
- TARGETS +=3D seccomp
- TARGETS +=3D sigaltstack
---=20
-2.17.1
-
diff --git a/recipes-kernel/kselftests/files/0001-selftests-breakpoints-a=
llow-to-cross-compile-for-aar.patch b/recipes-kernel/kselftests/files/000=
1-selftests-breakpoints-allow-to-cross-compile-for-aar.patch
deleted file mode 100644
index 8b7aa25a..00000000
--- a/recipes-kernel/kselftests/files/0001-selftests-breakpoints-allow-to=
-cross-compile-for-aar.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 607192f42d65e17f55fc6e85c00019bf71b18770 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fathi.boudra@linaro.org>
-Date: Wed, 22 Mar 2017 19:47:32 +0200
-Subject: [PATCH 1/1] selftests: breakpoints: allow to cross-compile for
- aarch64/arm64
-
-To build breakpoint_test_arm64, ARCH value is only tested for "aarch64".
-It covers only the native build because it's computed from uname -m outp=
ut.
-For cross-compilation, ARCH is set to arm64 and prevent to cross-compile
-the test.
-Fix the test to allow both native and cross-compilation of the test.
-
-Note: glibc is missing several of the TRAP_* constants in the userspace
-      definitions. Specifically TRAP_BRANCH and TRAP_HWBKPT.
-      See https://sourceware.org/bugzilla/show_bug.cgi?id=3D21286
-
-Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
----
- tools/testing/selftests/breakpoints/Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/tools/testing/selftests/breakpoints/Makefile
-+++ b/tools/testing/selftests/breakpoints/Makefile
-@@ -5,7 +5,7 @@ ARCH ?=3D $(shell echo $(uname_M) | sed -e
- ifeq ($(ARCH),x86)
- TEST_PROGS :=3D breakpoint_test
- endif
--ifeq ($(ARCH),aarch64)
-+ifneq (,$(filter $(ARCH),aarch64 arm64))
- TEST_PROGS :=3D breakpoint_test_arm64
- endif
-=20
diff --git a/recipes-kernel/kselftests/files/0001-selftests-gpio-use-pkg-=
config.patch b/recipes-kernel/kselftests/files/0001-selftests-gpio-use-pk=
g-config.patch
deleted file mode 100644
index 0d0bfc7e..00000000
--- a/recipes-kernel/kselftests/files/0001-selftests-gpio-use-pkg-config.=
patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From: Fathi Boudra <fathi.boudra@linaro.org>
-Subject: [PATCH] selftests: gpio: use pkg-config
-
-Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
----
----
- tools/testing/selftests/gpio/Makefile |   31 ++++++++++++++++++--------=
-----
- 1 file changed, 18 insertions(+), 13 deletions(-)
-
---- a/tools/testing/selftests/gpio/Makefile
-+++ b/tools/testing/selftests/gpio/Makefile
-@@ -1,23 +1,28 @@
-+CFLAGS +=3D -O2 -g -std=3Dgnu99 -Wall
-+CFLAGS +=3D -I../../../../usr/include/
-+CFLAGS +=3D $(shell pkg-config --cflags mount)
-+LDLIBS +=3D $(shell pkg-config --libs mount)
-=20
- TEST_PROGS :=3D gpio-mockup.sh
--TEST_FILES :=3D gpio-mockup-sysfs.sh $(BINARIES)
--BINARIES :=3D gpio-mockup-chardev
-+TEST_PROGS_EXTENDED :=3D gpio-mockup-chardev
-+TEST_FILES :=3D gpio-mockup-sysfs.sh
-=20
--include ../lib.mk
-+GPIODIR :=3D ../../../gpio
-+GPIOOBJ :=3D gpio-utils.o
-+GPIOINC :=3D gpio.h
-=20
--all: $(BINARIES)
-+all: $(GPIOINC) $(TEST_PROGS_EXTENDED)
-=20
- clean:
--	$(RM) $(BINARIES)
--
--CFLAGS +=3D -O2 -g -std=3Dgnu99 -Wall -I../../../../usr/include/
--LDLIBS +=3D -lmount -I/usr/include/libmount
-+	$(RM) $(TEST_PROGS_EXTENDED)
-+	$(MAKE) -C $(GPIODIR) clean
-=20
--$(BINARIES): ../../../gpio/gpio-utils.o ../../../../usr/include/linux/g=
pio.h
-+include ../lib.mk
-=20
--../../../gpio/gpio-utils.o:
--	make ARCH=3D$(ARCH) CROSS_COMPILE=3D$(CROSS_COMPILE) -C ../../../gpio
-+$(TEST_PROGS_EXTENDED): $(GPIODIR)/$(GPIOOBJ)
-=20
--../../../../usr/include/linux/gpio.h:
--	make -C ../../../.. headers_install INSTALL_HDR_PATH=3D$(shell pwd)/..=
/../../../usr/
-+$(GPIODIR)/$(GPIOOBJ):
-+	$(MAKE) -C $(GPIODIR)
-=20
-+$(GPIOINC):
-+	$(MAKE) -C ../../../.. headers_install
diff --git a/recipes-kernel/kselftests/files/0001-selftests-lib-allow-to-=
override-CC-in-the-top-level-Makefile.patch b/recipes-kernel/kselftests/f=
iles/0001-selftests-lib-allow-to-override-CC-in-the-top-level-Makefile.pa=
tch
deleted file mode 100644
index 9d48fd5d..00000000
--- a/recipes-kernel/kselftests/files/0001-selftests-lib-allow-to-overrid=
e-CC-in-the-top-level-Makefile.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 2e93b68257aa88ccdc127ca119304a5f4c76b7c5 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fathi.boudra@linaro.org>
-Date: Wed, 22 Mar 2017 17:36:53 +0200
-Subject: [PATCH] selftests: lib: allow to override CC in the top-level M=
akefile
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
- # This mimics the top-level Makefile. We do it explicitly here so that =
this
- # Makefile can operate with or without the kbuild infrastructure.
--CC :=3D $(CROSS_COMPILE)gcc
-+CC ?=3D $(CROSS_COMPILE)gcc
-=20
- define RUN_TESTS
- 	@for TEST in $(TEST_PROGS); do \
diff --git a/recipes-kernel/kselftests/files/0001-selftests-net-use-LDLIB=
S-to-link-against-libnuma.patch b/recipes-kernel/kselftests/files/0001-se=
lftests-net-use-LDLIBS-to-link-against-libnuma.patch
deleted file mode 100644
index da5ac00c..00000000
--- a/recipes-kernel/kselftests/files/0001-selftests-net-use-LDLIBS-to-li=
nk-against-libnuma.patch
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
-@@ -9,9 +9,9 @@ NET_PROGS +=3D reuseport_bpf reuseport_bpf
- NET_PROGS +=3D reuseport_dualstack
-=20
- all: $(NET_PROGS)
--reuseport_bpf_numa: LDFLAGS +=3D -lnuma
-+reuseport_bpf_numa: LDLIBS +=3D -lnuma
- %: %.c
--	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
-+	$(CC) $(CFLAGS) $(LDLIBS) -o $@ $^
-=20
- TEST_PROGS :=3D run_netsocktests run_afpackettests test_bpf.sh
- TEST_FILES :=3D $(NET_PROGS)
diff --git a/recipes-kernel/kselftests/files/0001-selftests-seccomp-use-L=
DLIBS-to-link-against-libpthread.patch b/recipes-kernel/kselftests/files/=
0001-selftests-seccomp-use-LDLIBS-to-link-against-libpthread.patch
deleted file mode 100644
index 447a61bb..00000000
--- a/recipes-kernel/kselftests/files/0001-selftests-seccomp-use-LDLIBS-t=
o-link-against-libpthread.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 0fd29435ce41d60cdb3b5e06e491500ddc54a86b Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fathi.boudra@linaro.org>
-Date: Wed, 22 Mar 2017 17:39:37 +0200
-Subject: [PATCH] selftests: seccomp: use LDLIBS to link against libpthre=
ad
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
- TEST_PROGS :=3D seccomp_bpf
- CFLAGS +=3D -Wl,-no-as-needed -Wall
--LDFLAGS +=3D -lpthread
-+LDLIBS +=3D -lpthread
-=20
- all: $(TEST_PROGS)
-=20
diff --git a/recipes-kernel/kselftests/files/0001-selftests-sigaltstack-f=
ix-packaging.patch b/recipes-kernel/kselftests/files/0001-selftests-sigal=
tstack-fix-packaging.patch
deleted file mode 100644
index 4cc5907a..00000000
--- a/recipes-kernel/kselftests/files/0001-selftests-sigaltstack-fix-pack=
aging.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b0448d7816ca561b6470dc50fc1621aec2620f57 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fathi.boudra@linaro.org>
-Date: Wed, 22 Mar 2017 17:40:11 +0200
-Subject: [PATCH] selftests: sigaltstack: fix packaging
-
-sigaltstack was not using TEST_PROGS resulting in binary not being insta=
lled.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- tools/testing/selftests/sigaltstack/Makefile |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- a/tools/testing/selftests/sigaltstack/Makefile
-+++ b/tools/testing/selftests/sigaltstack/Makefile
-@@ -1,8 +1,8 @@
- CFLAGS =3D -Wall
--BINARIES =3D sas
--all: $(BINARIES)
-+TEST_PROGS =3D sas
-+all: $(TEST_PROGS)
-=20
- include ../lib.mk
-=20
- clean:
--	rm -rf $(BINARIES)
-+	rm -rf $(TEST_PROGS)
diff --git a/recipes-kernel/kselftests/files/0001-selftests-timers-use-LD=
LIBS-to-link-against-libpthread.patch b/recipes-kernel/kselftests/files/0=
001-selftests-timers-use-LDLIBS-to-link-against-libpthread.patch
deleted file mode 100644
index 9f12c6ca..00000000
--- a/recipes-kernel/kselftests/files/0001-selftests-timers-use-LDLIBS-to=
-link-against-libpthread.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From b0448d7816ca561b6470dc50fc1621aec2620f57 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fathi.boudra@linaro.org>
-Date: Wed, 22 Mar 2017 17:40:11 +0200
-Subject: [PATCH] selftests: timers: use LDLIBS to link against libpthrea=
d
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
- CC =3D $(CROSS_COMPILE)gcc
- BUILD_FLAGS =3D -DKTEST
- CFLAGS +=3D -O3 -Wl,-no-as-needed -Wall $(BUILD_FLAGS)
--LDFLAGS +=3D -lrt -lpthread
-+LDLIBS +=3D -lrt -lpthread
-=20
- # these are all "safe" tests that don't modify
- # system time or require escalated privledges
diff --git a/recipes-kernel/kselftests/kselftests_4.10.bb b/recipes-kerne=
l/kselftests/kselftests_4.10.bb
deleted file mode 100644
index 5cd72f96..00000000
--- a/recipes-kernel/kselftests/kselftests_4.10.bb
+++ /dev/null
@@ -1,190 +0,0 @@
-SUMMARY =3D "Linux Kernel Selftests"
-LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7"
-
-SRC_URI =3D "\
-    https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz \
-    file://0001-selftests-lib-allow-to-override-CC-in-the-top-level-Make=
file.patch \
-    file://0001-selftests-timers-use-LDLIBS-to-link-against-libpthread.p=
atch \
-    file://0001-selftests-sigaltstack-fix-packaging.patch \
-    file://0001-selftests-seccomp-use-LDLIBS-to-link-against-libpthread.=
patch \
-    file://0001-selftests-gpio-use-pkg-config.patch \
-    file://0001-selftests-net-use-LDLIBS-to-link-against-libnuma.patch \
-    file://0001-selftests-breakpoints-allow-to-cross-compile-for-aar.pat=
ch;apply=3Dno \
-    file://0001-selftests-add-ptp-to-TARGETS.patch \
-"
-
-SRC_URI[md5sum] =3D "b5e7f6b9b2fe1b6cc7bc56a3a0bfc090"
-SRC_URI[sha256sum] =3D "3c95d9f049bd085e5c346d2c77f063b8425f191460fcd3ae=
9fe7e94e0477dc4b"
-
-S =3D "${WORKDIR}/linux-${PV}"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-DEPENDS =3D "libcap libcap-ng popt rsync-native util-linux pkgconfig-nat=
ive \
-"
-
-inherit kernel-arch
-
-EXTRA_OEMAKE +=3D "V=3D1 -C ${S}/tools/testing/selftests INSTALL_PATH=3D=
${D}${bindir}/kselftests CC=3D"${CC}" LD=3D"${LD}""
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
-PACKAGE_BEFORE_PN =3D " \
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
-FILES:${PN}-bpf =3D "${bindir}/kselftests/bpf"
-FILES:${PN}-breakpoints =3D "${bindir}/kselftests/breakpoints"
-FILES:${PN}-capabilities =3D "${bindir}/kselftests/capabilities"
-FILES:${PN}-cpu-hotplug =3D "${bindir}/kselftests/cpu-hotplug"
-FILES:${PN}-efivarfs =3D "${bindir}/kselftests/efivarfs"
-FILES:${PN}-exec =3D "${bindir}/kselftests/exec"
-FILES:${PN}-firmware =3D "${bindir}/kselftests/firmware"
-FILES:${PN}-ftrace =3D "${bindir}/kselftests/ftrace"
-FILES:${PN}-futex =3D "${bindir}/kselftests/futex"
-FILES:${PN}-gpio =3D "${bindir}/kselftests/gpio"
-FILES:${PN}-ipc =3D "${bindir}/kselftests/ipc"
-FILES:${PN}-kcmp =3D "${bindir}/kselftests/kcmp"
-FILES:${PN}-lib =3D "${bindir}/kselftests/lib"
-FILES:${PN}-membarrier =3D "${bindir}/kselftests/membarrier"
-FILES:${PN}-memfd =3D "${bindir}/kselftests/memfd"
-FILES:${PN}-memory-hotplug =3D "${bindir}/kselftests/memory-hotplug"
-FILES:${PN}-mount =3D "${bindir}/kselftests/mount"
-FILES:${PN}-mqueue =3D "${bindir}/kselftests/mqueue"
-FILES:${PN}-net =3D "${bindir}/kselftests/net"
-FILES:${PN}-nsfs =3D "${bindir}/kselftests/nsfs"
-FILES:${PN}-powerpc =3D "${bindir}/kselftests/powerpc"
-FILES:${PN}-pstore =3D "${bindir}/kselftests/pstore"
-FILES:${PN}-ptp =3D "${bindir}/kselftests/ptp"
-FILES:${PN}-ptrace =3D "${bindir}/kselftests/ptrace"
-FILES:${PN}-seccomp =3D "${bindir}/kselftests/seccomp"
-FILES:${PN}-sigaltstack =3D "${bindir}/kselftests/sigaltstack"
-FILES:${PN}-size =3D "${bindir}/kselftests/size"
-FILES:${PN}-static-keys =3D "${bindir}/kselftests/static_keys"
-FILES:${PN}-sync =3D "${bindir}/kselftests/sync"
-FILES:${PN}-sysctl =3D "${bindir}/kselftests/sysctl"
-FILES:${PN}-timers =3D "${bindir}/kselftests/timers"
-FILES:${PN}-user =3D "${bindir}/kselftests/user"
-FILES:${PN}-vm =3D "${bindir}/kselftests/vm"
-FILES:${PN}-x86 =3D "${bindir}/kselftests/x86"
-FILES:${PN}-zram =3D "${bindir}/kselftests/zram"
-FILES:${PN}-dbg +=3D "${bindir}/kselftests/*/.debug"
-
-# FIXME bpf target is failing to build and need to be fixed:
-# In file included from test_verifier.c:23:0:
-# ../../../../usr/include/linux/bpf_perf_event.h:14:17: error: field 're=
gs' has incomplete type
-#   struct pt_regs regs;
-#                  ^~~~
-# make[1]: *** [test_verifier] Error 1
-ALLOW_EMPTY:${PN}-bpf =3D "1"
-
-# gcc 7.x fails to build seccomp
-ALLOW_EMPTY:${PN}-seccomp =3D "1"
-
-# FIXME net target builds most of the binaries, but reuseport_bpf_numa d=
epends on libnuma,
-# which is not availbale on ARM, failing entire test case
-ALLOW_EMPTY:${PN}-net =3D "1"
-
-RDEPENDS:${PN}-cpu-hotplug +=3D "bash"
-RDEPENDS:${PN}-efivarfs +=3D "bash"
-RDEPENDS:${PN}-futex +=3D "bash ncurses"
-RDEPENDS:${PN}-gpio +=3D "bash"
-RDEPENDS:${PN}-memory-hotplug +=3D "bash"
-RDEPENDS:${PN}-net +=3D "bash"
-RDEPENDS:${PN}-vm +=3D "bash sudo"
-RDEPENDS:${PN}-zram +=3D "bash bc"
-RDEPENDS:${PN} +=3D "bash \
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
-RDEPENDS:${PN}:append:aarch64 =3D " ${PN}-breakpoints ${PN}-ipc"
-RDEPENDS:${PN}:append:x86 =3D " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
-RDEPENDS:${PN}:append:x86-64 =3D " ${PN}-breakpoints ${PN}-ipc ${PN}-x86=
"
-RDEPENDS:${PN}:append:powerpc =3D " ${PN}-powerpc"
-RDEPENDS:${PN}:append:powerpc64 =3D " ${PN}-powerpc"
-
-INSANE_SKIP:${PN} =3D "already-stripped"
-INSANE_SKIP:${PN}-exec =3D "ldflags"
-INSANE_SKIP:${PN}-ipc =3D "ldflags"
-INSANE_SKIP:${PN}-mount =3D "ldflags"
-INSANE_SKIP:${PN}-vm =3D "ldflags"
-
-COMPATIBLE_MACHINE:riscv64 =3D "(null)"
-COMPATIBLE_MACHINE:riscv32 =3D "(null)"
--=20
2.25.1

