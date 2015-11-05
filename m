Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98669E00AAA; Thu,  5 Nov 2015 11:40:21 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C3C0E00A28
	for <meta-ti@yoctoproject.org>; Thu,  5 Nov 2015 11:40:16 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 6BF8F52A45; Thu,  5 Nov 2015 19:40:16 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151105194016.6BF8F52A45@arago-project.org>
Date: Thu,  5 Nov 2015 19:40:16 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : boot-monitor: migrate to the new git source, major version bump
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
X-List-Received-Date: Thu, 05 Nov 2015 19:40:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 2117520efd565f43cfb774fa617986ce95f4c1ce
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2117520efd565f43cfb774fa617986ce95f4c1ce

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Nov  6 01:22:29 2015 +0000

boot-monitor: migrate to the new git source, major version bump

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/boot-monitor/boot-monitor_git.bb |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 5780195..081e605 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -5,17 +5,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
 COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
 
-PV = "2.0+git${SRCPV}"
-PR = "r6"
+PV = "3.0+git${SRCPV}"
+PR = "r0"
 
 BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-#Tag "K2_BM_15.07"
-SRCREV = "62d198687a34a9df375c1686d75ad4f85515dcf9"
+SRCREV = "28e4fba48f49cc6223d01bffc912fd9f8d1b54e7"
 
 BOOT_MONITOR_IMAGE  ?= "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
 
@@ -31,7 +30,7 @@ do_compile () {
 	unset LDFLAGS
 	unset CFLAGS
 	unset CPPFLAGS
-	oe_runmake ${BOOT_MONITOR_MAKE_TARGET}
+	oe_runmake image_${BOOT_MONITOR_MAKE_TARGET}
 }
 
 do_install () {


