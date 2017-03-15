Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9D60EE00A81; Wed, 15 Mar 2017 02:25:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
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
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.43 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CA19E006D8
	for <meta-ti@yoctoproject.org>; Wed, 15 Mar 2017 02:25:15 -0700 (PDT)
Received: by mail-lf0-f43.google.com with SMTP id j90so4287672lfk.2
	for <meta-ti@yoctoproject.org>; Wed, 15 Mar 2017 02:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=G7ObvMoK2Cyn1GbLihgRn/ewEEAATkifAAieZF9gyhg=;
	b=MtzWN9GPQ1Pra8IFmM1Quqvk5N6Ss9XCY4nNgmDhGnAcun/5L9Uz2rWI28Qpra8vVr
	hW+W5Wy18gDORjXvKO6Z52B6pDrepzwBeC8+AKO2psuNKeDPasiE7rU/tzVco7AbUAc0
	3WUO6Xl/MJRWGKwzGhiYNqDsXthWUnA3RqNy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G7ObvMoK2Cyn1GbLihgRn/ewEEAATkifAAieZF9gyhg=;
	b=YgrHrr94EVSEJM2xMrbfxiVli3ixnH0nMaFLtas4YAkOuEDg6g1MSqZjgZVP+ejINi
	xivFfaaKQAZJCK69GzPSstR/alZCK9B13NETmSUho2VXjYRn/wCTEvt4lNFAwKd1e+v6
	dtYqMrSReWQXOtfH+ndkXFe1dRwOkBCGWUFn9SyaIWu+vvWz77DoxaYys5ir0U4KTwHX
	SzvPlWFNYY6ukCpU00tnr/041kk/It1PJ67TPsde5Mc2c4xOTd+V6cc8EuxuR52vbkiA
	mZpt55oOuG95CJ/Z/0TI/yW1e5VxuSzN+J1yVpjbW689CGRj6NNRGM/b5zWs+KCk2MoH
	N3IQ==
X-Gm-Message-State: AFeK/H2Q5RbMkt9gAv10/BLXW9nc8OtCNiHAVSPHRZElOTSoY2kcIoJ0ncnAe2saSBsH8tVW
X-Received: by 10.25.195.11 with SMTP id t11mr650816lff.165.1489569914660;
	Wed, 15 Mar 2017 02:25:14 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16])
	by smtp.gmail.com with ESMTPSA id 193sm232434ljj.4.2017.03.15.02.25.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Mar 2017 02:25:13 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-ti@yoctoproject.org
Date: Wed, 15 Mar 2017 11:25:11 +0200
Message-Id: <20170315092511.21280-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Wed, 15 Mar 2017 12:17:12 -0700
Subject: [master][PATCH] kselftests: update to 4.9
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
X-List-Received-Date: Wed, 15 Mar 2017 09:25:19 -0000

* Adjust md5sum/sha256sum for the updated tarball
* Add libpcap dependency, needed by vm/mlock-random-test
* Rewrite TARGETS as a list (easier to copy/paste/update) and filter out
  arch specific tests using bb.utils.contains_any()
* Add new tests introduced with 4.9 : capabilities, futex, lib,
  membarrier, nsfs, pstore, seccomp, sigalstack, static_keys, zram.
* Adjust the packages list for the new tests.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../{kselftests_4.4.bb => kselftests_4.9.bb}       | 127 ++++++++++++++++++---
 1 file changed, 110 insertions(+), 17 deletions(-)
 rename recipes-kernel/kselftests/{kselftests_4.4.bb => kselftests_4.9.bb} (52%)

diff --git a/recipes-kernel/kselftests/kselftests_4.4.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
similarity index 52%
rename from recipes-kernel/kselftests/kselftests_4.4.bb
rename to recipes-kernel/kselftests/kselftests_4.9.bb
index 7f9def7d..3b1e43ee 100644
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
 
-DEPENDS = "popt rsync-native"
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
2.11.0


