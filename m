Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 86072E00D7B; Wed,  9 Sep 2015 13:09:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D3E8E00D90
	for <meta-ti@yoctoproject.org>; Wed,  9 Sep 2015 13:09:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DD861529D7; Wed,  9 Sep 2015 20:09:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150909200929.DD861529D7@arago-project.org>
Date: Wed,  9 Sep 2015 20:09:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : boot-monitor: adjust resulting skern name to be SOC specific, not machine specific
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
X-List-Received-Date: Wed, 09 Sep 2015 20:09:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 411adbe48c6d567395ce8f824af1b5a9246e5d42
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=411adbe48c6d567395ce8f824af1b5a9246e5d42

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Sep 10 01:53:51 2015 +0000

boot-monitor: adjust resulting skern name to be SOC specific, not machine specific

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/boot-monitor/boot-monitor_git.bb |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index d64cba7..5780195 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
 PV = "2.0+git${SRCPV}"
-PR = "r5"
+PR = "r6"
 
 BRANCH = "master"
 
@@ -17,8 +17,7 @@ S = "${WORKDIR}/git"
 #Tag "K2_BM_15.07"
 SRCREV = "62d198687a34a9df375c1686d75ad4f85515dcf9"
 
-BOOT_MONITOR_BINARY ?= "skern.bin"
-BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"
+BOOT_MONITOR_IMAGE  ?= "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
 
 FLOATABI = "${@base_contains("TUNE_FEATURES", "vfp", base_contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
 
@@ -37,12 +36,12 @@ do_compile () {
 
 do_install () {
 	install -d ${D}/boot
-	install -m 0644 ${S}/${BOOT_MONITOR_BINARY} ${D}/boot/${BOOT_MONITOR_IMAGE}
+	install -m 0644 ${S}/${BOOT_MONITOR_IMAGE} ${D}/boot/
 }
 
 do_deploy () {
 	install -d ${DEPLOYDIR}
-	install -m 0644 ${S}/${BOOT_MONITOR_BINARY} ${DEPLOYDIR}/${BOOT_MONITOR_IMAGE}
+	install -m 0644 ${S}/${BOOT_MONITOR_IMAGE} ${DEPLOYDIR}/
 }
 
 addtask deploy before do_build after do_compile


