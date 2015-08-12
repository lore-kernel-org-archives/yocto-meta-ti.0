Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D311CE009C3; Tue, 11 Aug 2015 20:33:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04A8EE00A26
	for <meta-ti@yoctoproject.org>; Tue, 11 Aug 2015 20:33:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C336652A8F; Wed, 12 Aug 2015 03:33:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150812033331.C336652A8F@arago-project.org>
Date: Wed, 12 Aug 2015 03:33:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : kselftests: add 4.1 version of Kernel Selftest suite
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
X-List-Received-Date: Wed, 12 Aug 2015 03:33:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 1817119b6b3a2990a3d9a1374ea37b852c69332a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1817119b6b3a2990a3d9a1374ea37b852c69332a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Aug 12 05:28:58 2015 +0000

kselftests: add 4.1 version of Kernel Selftest suite

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/kselftests/kselftests_4.1.bb |   86 +++++++++++++++++++++++++++
 1 files changed, 86 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/kselftests/kselftests_4.1.bb b/recipes-kernel/kselftests/kselftests_4.1.bb
new file mode 100644
index 0000000..d917fb5
--- /dev/null
+++ b/recipes-kernel/kselftests/kselftests_4.1.bb
@@ -0,0 +1,86 @@
+SUMMARY = "Linux Kernel Selftests"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+SRC_URI = "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "fe9dc0f6729f36400ea81aa41d614c37"
+SRC_URI[sha256sum] = "caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8ea72d9f"
+
+S = "${WORKDIR}/linux-${PV}"
+
+DEPENDS = "virtual/kernel popt"
+
+inherit kernel-arch
+
+TARGETS = "cpu-hotplug efivarfs exec firmware ftrace kcmp memfd memory-hotplug \
+	mount mqueue net ptrace size sysctl timers user vm"
+
+# Arch specific tests
+TARGETS_append_x86 = " breakpoints ipc x86"
+TARGETS_append_x86-64 = " breakpoints ipc x86"
+TARGETS_append_powerpc = " powerpc"
+TARGETS_append_powerpc64 = " powerpc"
+
+EXTRA_OEMAKE += "-C tools/testing/selftests TARGETS="${TARGETS}" INSTALL_PATH=${D}${bindir}/kselftests CC="${CC}""
+
+# Their Makefiles are so sloppy, let's clean up a bit
+do_configure () {
+	sed "s|^CC := .*||g" -i ${S}/tools/testing/selftests/lib.mk
+	sed "s|^CC = .*||g" -i ${S}/tools/testing/selftests/timers/Makefile
+	sed "s|^CC = .*||g" -i ${S}/tools/testing/selftests/memfd/Makefile
+	sed "s|^CC := .*||g" -i ${S}/tools/testing/selftests/powerpc/switch_endian/Makefile
+	sed "s|gcc|\$(CC)|g" -i ${S}/tools/testing/selftests/breakpoints/Makefile
+	sed "s|^LDFLAGS += -lrt -lpthread|LDLIBS += -lrt -lpthread|g" -i ${S}/tools/testing/selftests/timers/Makefile
+}
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	oe_runmake install
+}
+
+PACKAGE_BEFORE_PN = "${PN}-breakpoints ${PN}-cpu-hotplug ${PN}-efivarfs ${PN}-exec ${PN}-firmware ${PN}-ftrace \
+	${PN}-ipc ${PN}-kcmp ${PN}-memfd ${PN}-memory-hotplug ${PN}-mount ${PN}-mqueue ${PN}-net ${PN}-powerpc \
+	${PN}-ptrace ${PN}-size ${PN}-sysctl ${PN}-timers ${PN}-user ${PN}-vm ${PN}-x86"
+
+FILES_${PN}-breakpoints = "${bindir}/kselftests/breakpoints"
+FILES_${PN}-cpu-hotplug = "${bindir}/kselftests/cpu-hotplug"
+FILES_${PN}-efivarfs = "${bindir}/kselftests/efivarfs"
+FILES_${PN}-exec = "${bindir}/kselftests/exec"
+FILES_${PN}-firmware = "${bindir}/kselftests/firmware"
+FILES_${PN}-ftrace = "${bindir}/kselftests/ftrace"
+FILES_${PN}-ipc = "${bindir}/kselftests/ipc"
+FILES_${PN}-kcmp = "${bindir}/kselftests/kcmp"
+FILES_${PN}-memfd = "${bindir}/kselftests/memfd"
+FILES_${PN}-memory-hotplug = "${bindir}/kselftests/memory-hotplug"
+FILES_${PN}-mount = "${bindir}/kselftests/mount"
+FILES_${PN}-mqueue = "${bindir}/kselftests/mqueue"
+FILES_${PN}-net = "${bindir}/kselftests/net"
+FILES_${PN}-powerpc = "${bindir}/kselftests/powerpc"
+FILES_${PN}-ptrace = "${bindir}/kselftests/ptrace"
+FILES_${PN}-size = "${bindir}/kselftests/size"
+FILES_${PN}-sysctl = "${bindir}/kselftests/sysctl"
+FILES_${PN}-timers = "${bindir}/kselftests/timers"
+FILES_${PN}-user = "${bindir}/kselftests/user"
+FILES_${PN}-vm = "${bindir}/kselftests/vm"
+FILES_${PN}-x86 = "${bindir}/kselftests/x86"
+FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
+
+RDEPENDS_${PN}-cpu-hotplug += "bash"
+RDEPENDS_${PN}-efivarfs += "bash"
+RDEPENDS_${PN}-memory-hotplug += "bash"
+RDEPENDS_${PN}-net += "bash"
+RDEPENDS_${PN}-vm += "bash"
+RDEPENDS_${PN} += "bash ${PN}-cpu-hotplug ${PN}-efivarfs ${PN}-exec ${PN}-firmware ${PN}-ftrace ${PN}-ipc \
+	${PN}-kcmp ${PN}-memfd ${PN}-memory-hotplug ${PN}-mount ${PN}-mqueue ${PN}-net ${PN}-ptrace \
+	${PN}-size ${PN}-sysctl ${PN}-timers ${PN}-user ${PN}-vm"
+
+RDEPENDS_${PN}_append_x86 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
+RDEPENDS_${PN}_append_x86-64 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
+RDEPENDS_${PN}_append_powerpc = " ${PN}-powerpc"
+RDEPENDS_${PN}_append_powerpc64 = " ${PN}-powerpc"
+
+INSANE_SKIP_${PN} = "already-stripped"


