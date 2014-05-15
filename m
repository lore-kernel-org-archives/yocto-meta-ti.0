Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01A92E00A44; Thu, 15 May 2014 08:09:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from bear.ext.ti.com (unknown [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38413E0053B
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 08:09:11 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4FF9ADY020634
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 10:09:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4FF9Aqa026254
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 10:09:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 15 May 2014 10:09:10 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4FF9AQD004597;	Thu, 15 May 2014 10:09:10 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1WkxHS-00080a-1s; Thu, 15 May 2014
	11:09:10 -0400
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 15 May 2014 11:09:08 -0400
Message-ID: <1400166548-30754-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [Re-submit v2] boot-monitor: add K2L and K2E boot monitor build support
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
X-List-Received-Date: Thu, 15 May 2014 15:09:15 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 recipes-bsp/boot-monitor/boot-monitor_git.bb |   21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 7c5e9cf..08a8c66 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -3,9 +3,6 @@ EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
 
 LICENSE = "BSD"
 
-BOOT_MONITOR_BINARY ?= "skern.bin"
-BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"
-BOOT_MONITOR_MAKE_TARGET  ?= "all"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
 
@@ -14,20 +11,24 @@ COMPATIBLE_MACHINE = "keystone-evm"
 SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
 PV = "2.0"
-PR = "r0+gitr${SRCPV}"
+PR = "r1+gitr${SRCPV}"
 
 BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-#Tag "K2_BM_13.11"
-SRCREV = "ba597d183423971e63295cdd59d3c90245e9170a"
+#Tag "K2_BM_14.05"
+SRCREV = "0e3ffe1ea4a0cee38ae2406901b7cf4d5324b5e9"
+DEVICELIST = "k2hk k2l k2e"
 
 do_compile () {
 	unset LDFLAGS
 	unset CFLAGS
 	unset CPPFLAGS
-	oe_runmake ${BOOT_MONITOR_MAKE_TARGET}
+	for device in ${DEVICELIST}
+	do
+		oe_runmake "$device"
+	done
 }
 
 inherit deploy
@@ -36,5 +37,9 @@ addtask deploy before do_build after do_compile
 
 do_deploy () {
 	install -d ${DEPLOYDIR}
-	install ${S}/${BOOT_MONITOR_BINARY} ${DEPLOYDIR}/${BOOT_MONITOR_IMAGE}
+	for device in ${DEVICELIST}
+	do
+		install ${S}/skern-"$device".bin \
+			${DEPLOYDIR}/skern-"$device"-${MACHINE}.bin
+	done
 }
-- 
1.7.9.5


