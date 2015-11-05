Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09AF8E009C5; Thu,  5 Nov 2015 11:23:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E34EE007DA
	for <meta-ti@yoctoproject.org>; Thu,  5 Nov 2015 11:22:55 -0800 (PST)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXC00AGTWHIXK70@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 05 Nov 2015 13:22:31 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=rOmjE10zPhCYkQe6nnwA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5CC26161CF0;	Thu,
	5 Nov 2015 14:22:30 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 05 Nov 2015 14:22:29 -0500
Message-id: <1446751349-24163-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] boot-monitor: migrate to the new git source, major version bump
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
X-List-Received-Date: Thu, 05 Nov 2015 19:23:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/boot-monitor/boot-monitor_git.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

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
-- 
2.2.0


