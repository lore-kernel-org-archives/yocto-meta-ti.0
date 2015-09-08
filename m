Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24853E00D14; Tue,  8 Sep 2015 14:29:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C5BEE00B99
	for <meta-ti@yoctoproject.org>; Tue,  8 Sep 2015 14:29:39 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D61E752A7D; Tue,  8 Sep 2015 21:29:37 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150908212937.D61E752A7D@arago-project.org>
Date: Tue,  8 Sep 2015 21:29:37 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : boot-monitor: also package resulting skern file into / boot
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
X-List-Received-Date: Tue, 08 Sep 2015 21:29:45 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 8f3e07ca27cd2ef5c7fbe4ffd9e64886ee58ad08
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8f3e07ca27cd2ef5c7fbe4ffd9e64886ee58ad08

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Sep  9 00:40:45 2015 +0000

boot-monitor: also package resulting skern file into /boot

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/boot-monitor/boot-monitor_git.bb |   17 ++++++++++++-----
 1 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index c353488..d64cba7 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
 PV = "2.0+git${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 BRANCH = "master"
 
@@ -24,6 +24,10 @@ FLOATABI = "${@base_contains("TUNE_FEATURES", "vfp", base_contains("TUNE_FEATURE
 
 EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}" LD="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}""
 
+FILES_${PN} = "/boot"
+
+inherit deploy
+
 do_compile () {
 	unset LDFLAGS
 	unset CFLAGS
@@ -31,11 +35,14 @@ do_compile () {
 	oe_runmake ${BOOT_MONITOR_MAKE_TARGET}
 }
 
-inherit deploy
-
-addtask deploy before do_build after do_compile
+do_install () {
+	install -d ${D}/boot
+	install -m 0644 ${S}/${BOOT_MONITOR_BINARY} ${D}/boot/${BOOT_MONITOR_IMAGE}
+}
 
 do_deploy () {
 	install -d ${DEPLOYDIR}
-	install ${S}/${BOOT_MONITOR_BINARY} ${DEPLOYDIR}/${BOOT_MONITOR_IMAGE}
+	install -m 0644 ${S}/${BOOT_MONITOR_BINARY} ${DEPLOYDIR}/${BOOT_MONITOR_IMAGE}
 }
+
+addtask deploy before do_build after do_compile


