Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98EFDE00B01; Tue, 28 Mar 2017 02:28:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.48 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.48 listed in list.dnswl.org]
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B058E00A51
	for <meta-ti@yoctoproject.org>; Tue, 28 Mar 2017 02:28:44 -0700 (PDT)
Received: by mail-lf0-f48.google.com with SMTP id h125so34549035lfe.0
	for <meta-ti@yoctoproject.org>; Tue, 28 Mar 2017 02:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=LfGyak1/6yp5dKGvy3xK54ssAgh2MIpQbDblfVpXO9c=;
	b=MNL1vLjhqYFsmQSRe9bGXgKuu1UVpaIbFDwWiXnG6UZnk5YM+YL0C9YetMb3dCfZmy
	foF4meRbXl+M8iXjrXivmM9aRWPDts+zYjo0DIu3W7Z9JqgIVaxu6vLRs4KTIOz5s5fa
	d0upDWB5vTzElrDzxfvuryp2xb2nN3nnIql/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LfGyak1/6yp5dKGvy3xK54ssAgh2MIpQbDblfVpXO9c=;
	b=tzsDob5imxf58wUgtBM0X/iTO17Pt3avEjijavfshOyPEaYSzlh00f1xqmHZs+joeF
	GSoI0iUnm7VssBhypHqWV6HQIINEdpzwrRwIpUmm8Pert5IClzYLCSXVCCjTJ0g9jEbT
	AErAPofJYPW9yU/5NRq/Te7AgVHnzBy4x7MfSkjj3PvokFN4omvv0FKSTgkWh+rPwm09
	1BtN2IYHj1t9NTr2EALJUu62Bq/J5M/fPj0iUbO2ARjFcs3cNlr74oy6M0sY/0uaHhvJ
	ts4HUR7V1s/hUIrg83CNr6ZJGCiQ2JK2C1AgSHDW5B5p6S7ikWjYigDVC7OBlGv7Tq4x
	K2GQ==
X-Gm-Message-State: AFeK/H24Q3tglH4GPsVxuQ6CtDgCrf7I0cLU38pK4wbQmQrYt5hQVvaueF0gwBdid4XMZ9nt
X-Received: by 10.25.152.9 with SMTP id a9mr10851980lfe.155.1490693323875;
	Tue, 28 Mar 2017 02:28:43 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16])
	by smtp.gmail.com with ESMTPSA id p27sm600225lfg.5.2017.03.28.02.28.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Mar 2017 02:28:42 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-ti@yoctoproject.org
Date: Tue, 28 Mar 2017 12:28:42 +0300
Message-Id: <20170328092842.7327-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v2] kselftests: update to 4.10
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
X-List-Received-Date: Tue, 28 Mar 2017 09:28:48 -0000

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

Changes in v2:
 * Remove the workaround for broken gpio packaging and gpio-mockup-chardev
   binary installation. Fixed in 0001-selftests-gpio-use-pkg-config.patch
 * Reported by Denys Dmytriyenko, fix numctl DEPENDS as ARM doesn't support
   NUMA (not in COMPATIBLE_HOST).

 .../{kselftests_4.9.bb => kselftests_4.10.bb}      | 90 +++++++++-------------
 1 file changed, 37 insertions(+), 53 deletions(-)
 rename recipes-kernel/kselftests/{kselftests_4.9.bb => kselftests_4.10.bb} (66%)

diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.10.bb
similarity index 66%
rename from recipes-kernel/kselftests/kselftests_4.9.bb
rename to recipes-kernel/kselftests/kselftests_4.10.bb
index 9d3f1d73..4ff9e5b9 100644
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


