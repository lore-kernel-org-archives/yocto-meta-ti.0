Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCB8EE0072E
	for <meta-ti@yoctoproject.org>; Mon, 28 Jan 2013 15:50:00 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7B45152AB3; Mon, 28 Jan 2013 23:50:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130128235000.7B45152AB3@arago-project.org>
Date: Mon, 28 Jan 2013 23:50:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Murali Karicheri : keystone: boot-monitor: add initial recipe
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
X-List-Received-Date: Mon, 28 Jan 2013 23:50:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: e5875d90521a7d73abff000b202b8631c16a34db
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e5875d90521a7d73abff000b202b8631c16a34db

Author: Murali Karicheri <m-karicheri2@ti.com>
Date:   Fri Jan 18 18:15:21 2013 -0500

keystone: boot-monitor: add initial recipe

This adds recipe to build boot monitor image. Boot monitor is
a standalone image that is loaded and executed from u-boot to
replace the RBL provided monitor code in ARM with Linux boot
specific code.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/boot-monitor/boot-monitor_git.bb |   39 ++++++++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
new file mode 100644
index 0000000..dc4d71e
--- /dev/null
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "Boot Monitor - TI ARM Boot monitor code"
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
+
+LICENSE = "BSD"
+
+BOOT_MONITOR_BINARY ?= "skern.bin"
+BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"
+BOOT_MONITOR_MAKE_TARGET  ?= "all"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b676661788f8c0f8cdeafd2a39467cae"
+
+COMPATIBLE_MACHINE = "keystone-evm"
+
+SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/boot-monitor.git;protocol=git;branch=${BRANCH}"
+
+PV = "1.0"
+PR = "r0+gitr${SRCPV}"
+
+BRANCH = "master"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "b8014b69e8c7e981e8bc3e067a9d990e2bb603ba"
+
+do_compile () {
+	unset LDFLAGS
+	unset CFLAGS
+	unset CPPFLAGS
+	oe_runmake ${BOOT_MONITOR_MAKE_TARGET}
+}
+
+inherit deploy
+
+addtask deploy before do_build after do_compile
+
+do_deploy () {
+	install -d ${DEPLOYDIR}
+	install ${S}/${BOOT_MONITOR_BINARY} ${DEPLOYDIR}/${BOOT_MONITOR_IMAGE}
+}


