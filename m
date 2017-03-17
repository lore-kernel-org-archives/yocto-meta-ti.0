Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 817E6E00A4F; Fri, 17 Mar 2017 11:10:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E76BE009B9
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 11:10:30 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C071B20BBB;
	Fri, 17 Mar 2017 18:10:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gdCi5X842YKm; Fri, 17 Mar 2017 18:10:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8B2C720AC4;
	Fri, 17 Mar 2017 18:10:27 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1ACBE1623E7;
	Fri, 17 Mar 2017 14:10:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 17 Mar 2017 14:10:00 -0400
Message-Id: <1489774203-25523-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/4] kselftests: update to 4.9
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
X-List-Received-Date: Fri, 17 Mar 2017 18:10:33 -0000

From: Fathi Boudra <fathi.boudra@linaro.org>

* Adjust md5sum/sha256sum for the updated tarball
* Add libpcap dependency, needed by vm/mlock-random-test
* Rewrite TARGETS as a list (easier to copy/paste/update) and filter out
  arch specific tests using bb.utils.contains_any()
* Add new tests introduced with 4.9 : capabilities, futex, lib,
  membarrier, nsfs, pstore, seccomp, sigalstack, static_keys, zram.
* Adjust the packages list for the new tests.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{kselftests_4.4.bb => kselftests_4.9.bb}       | 127 ++++++++++++++++++---
 1 file changed, 110 insertions(+), 17 deletions(-)
 rename recipes-kernel/kselftests/{kselftests_4.4.bb => kselftests_4.9.bb} (52%)

diff --git a/recipes-kernel/kselftests/kselftests_4.4.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
similarity index 52%
rename from recipes-kernel/kselftests/kselftests_4.4.bb
rename to recipes-kernel/kselftests/kselftests_4.9.bb
index 8114cde..3b1e43e 100644
--- a/recipes-kernel/kselftests/kselftests_4.4.bb
+++ b/recipes-kernel/kselftests/kselftests_4.9.bb
@@ -4,25 +4,51 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 SRC_URI = "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "9a78fa2eb6c68ca5a40ed5af08142599"
-SRC_URI[sha256sum] = "401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2"
+SRC_URI[md5sum] = "0a68ef3615c64bd5ee54a3320e46667d"
+SRC_URI[sha256sum] = "029098dcffab74875e086ae970e3828456838da6e0ba22ce3f64ef764f3d7f1a"
 
 S = "${WORKDIR}/linux-${PV}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS = "popt"
+DEPENDS = "libcap popt rsync-native"
 
 inherit kernel-arch
 
-TARGETS = "cpu-hotplug efivarfs exec firmware ftrace kcmp memfd memory-hotplug \
-	mount mqueue net ptrace size sysctl timers user vm"
-
-# Arch specific tests
-TARGETS_append_x86 = " breakpoints ipc x86"
-TARGETS_append_x86-64 = " breakpoints ipc x86"
-TARGETS_append_powerpc = " powerpc"
-TARGETS_append_powerpc64 = " powerpc"
+# Filter out arch specific tests
+TARGETS = " \
+	${@bb.utils.contains_any("TARGET_ARCH", [ "x86", "x86-64" ], "breakpoints", "", d)} \
+	capabilities \
+	cpu-hotplug \
+	efivarfs \
+	exec \
+	firmware \
+	ftrace \
+	futex \
+	${@bb.utils.contains_any("TARGET_ARCH", [ "x86", "x86-64" ], "ipc", "", d)} \
+	kcmp \
+	lib \
+	membarrier \
+	memfd \
+	memory-hotplug \
+	mount \
+	mqueue \
+	net \
+	nsfs \
+	${@bb.utils.contains_any("TARGET_ARCH", [ "powerpc", "powerpc64" ], "powerpc", "", d)} \
+	pstore \
+	ptrace \
+	seccomp \
+	sigaltstack \
+	size \
+	static_keys \
+	sysctl \
+	timers \
+	user \
+	vm \
+	${@bb.utils.contains_any("TARGET_ARCH", [ "x86", "x86-64" ], "x86", "", d)} \
+	zram \
+"
 
 EXTRA_OEMAKE += "-C tools/testing/selftests TARGETS="${TARGETS}" INSTALL_PATH=${D}${bindir}/kselftests CC="${CC}""
 
@@ -45,31 +71,71 @@ do_install () {
 	chown -R root:root ${D}
 }
 
-PACKAGE_BEFORE_PN = "${PN}-breakpoints ${PN}-cpu-hotplug ${PN}-efivarfs ${PN}-exec ${PN}-firmware ${PN}-ftrace \
-	${PN}-ipc ${PN}-kcmp ${PN}-memfd ${PN}-memory-hotplug ${PN}-mount ${PN}-mqueue ${PN}-net ${PN}-powerpc \
-	${PN}-ptrace ${PN}-size ${PN}-sysctl ${PN}-timers ${PN}-user ${PN}-vm ${PN}-x86"
+PACKAGE_BEFORE_PN = " \
+	${PN}-breakpoints \
+	${PN}-capabilities \
+	${PN}-cpu-hotplug \
+	${PN}-efivarfs \
+	${PN}-exec \
+	${PN}-firmware \
+	${PN}-ftrace \
+	${PN}-futex \
+	${PN}-ipc \
+	${PN}-kcmp \
+	${PN}-lib \
+	${PN}-membarrier \
+	${PN}-memfd \
+	${PN}-memory-hotplug \
+	${PN}-mount \
+	${PN}-mqueue \
+	${PN}-net \
+	${PN}-nsfs \
+	${PN}-powerpc \
+	${PN}-pstore \
+	${PN}-ptrace \
+	${PN}-seccomp \
+	${PN}-sigaltstack \
+	${PN}-size \
+	${PN}-static-keys \
+	${PN}-sysctl \
+	${PN}-timers \
+	${PN}-user \
+	${PN}-vm \
+	${PN}-x86 \
+	${PN}-zram \
+"
 
 FILES_${PN}-breakpoints = "${bindir}/kselftests/breakpoints"
+FILES_${PN}-capabilities = "${bindir}/kselftests/capabilities"
 FILES_${PN}-cpu-hotplug = "${bindir}/kselftests/cpu-hotplug"
 FILES_${PN}-efivarfs = "${bindir}/kselftests/efivarfs"
 FILES_${PN}-exec = "${bindir}/kselftests/exec"
 FILES_${PN}-firmware = "${bindir}/kselftests/firmware"
 FILES_${PN}-ftrace = "${bindir}/kselftests/ftrace"
+FILES_${PN}-futex = "${bindir}/kselftests/futex"
 FILES_${PN}-ipc = "${bindir}/kselftests/ipc"
 FILES_${PN}-kcmp = "${bindir}/kselftests/kcmp"
+FILES_${PN}-lib = "${bindir}/kselftests/lib"
+FILES_${PN}-membarrier = "${bindir}/kselftests/membarrier"
 FILES_${PN}-memfd = "${bindir}/kselftests/memfd"
 FILES_${PN}-memory-hotplug = "${bindir}/kselftests/memory-hotplug"
 FILES_${PN}-mount = "${bindir}/kselftests/mount"
 FILES_${PN}-mqueue = "${bindir}/kselftests/mqueue"
 FILES_${PN}-net = "${bindir}/kselftests/net"
+FILES_${PN}-nsfs = "${bindir}/kselftests/nsfs"
 FILES_${PN}-powerpc = "${bindir}/kselftests/powerpc"
+FILES_${PN}-pstore = "${bindir}/kselftests/pstore"
 FILES_${PN}-ptrace = "${bindir}/kselftests/ptrace"
+FILES_${PN}-seccomp = "${bindir}/kselftests/seccomp"
+FILES_${PN}-sigaltstack = "${bindir}/kselftests/sigaltstack"
 FILES_${PN}-size = "${bindir}/kselftests/size"
+FILES_${PN}-static-keys = "${bindir}/kselftests/static_keys"
 FILES_${PN}-sysctl = "${bindir}/kselftests/sysctl"
 FILES_${PN}-timers = "${bindir}/kselftests/timers"
 FILES_${PN}-user = "${bindir}/kselftests/user"
 FILES_${PN}-vm = "${bindir}/kselftests/vm"
 FILES_${PN}-x86 = "${bindir}/kselftests/x86"
+FILES_${PN}-zram = "${bindir}/kselftests/zram"
 FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
 
 RDEPENDS_${PN}-cpu-hotplug += "bash"
@@ -77,9 +143,36 @@ RDEPENDS_${PN}-efivarfs += "bash"
 RDEPENDS_${PN}-memory-hotplug += "bash"
 RDEPENDS_${PN}-net += "bash"
 RDEPENDS_${PN}-vm += "bash"
-RDEPENDS_${PN} += "bash ${PN}-cpu-hotplug ${PN}-efivarfs ${PN}-exec ${PN}-firmware ${PN}-ftrace \
-	${PN}-kcmp ${PN}-memfd ${PN}-memory-hotplug ${PN}-mount ${PN}-mqueue ${PN}-net ${PN}-ptrace \
-	${PN}-size ${PN}-sysctl ${PN}-timers ${PN}-user ${PN}-vm"
+RDEPENDS_${PN}-zram += "bash"
+RDEPENDS_${PN} += "bash \
+	${PN}-capabilities \
+	${PN}-cpu-hotplug \
+	${PN}-efivarfs \
+	${PN}-exec \
+	${PN}-firmware \
+	${PN}-ftrace \
+	${PN}-futex \
+	${PN}-kcmp \
+	${PN}-lib \
+	${PN}-membarrier \
+	${PN}-memfd \
+	${PN}-memory-hotplug \
+	${PN}-mount \
+	${PN}-mqueue \
+	${PN}-net \
+	${PN}-nsfs \
+	${PN}-pstore \
+	${PN}-ptrace \
+	${PN}-seccomp \
+	${PN}-sigaltstack \
+	${PN}-size \
+	${PN}-static-keys \
+	${PN}-sysctl \
+	${PN}-timers \
+	${PN}-user \
+	${PN}-vm \
+	${PN}-zram \
+"
 
 RDEPENDS_${PN}_append_x86 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
 RDEPENDS_${PN}_append_x86-64 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
-- 
2.7.4


