Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BCE2E006EF; Wed, 14 May 2014 11:37:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 449 seconds by postgrey-1.32 at yocto-www;
	Wed, 14 May 2014 11:37:21 PDT
Received: from arroyo.ext.ti.com (unknown [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5434E0053B
	for <meta-ti@yoctoproject.org>; Wed, 14 May 2014 11:37:21 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4EITqqX032477
	for <meta-ti@yoctoproject.org>; Wed, 14 May 2014 13:29:52 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4EITqV4018192
	for <meta-ti@yoctoproject.org>; Wed, 14 May 2014 13:29:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 May 2014 13:29:52 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4EITqbH029573;	Wed, 14 May 2014 13:29:52 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1Wkdw7-0003gZ-NL; Wed, 14 May 2014
	14:29:51 -0400
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 14 May 2014 14:29:49 -0400
Message-ID: <1400092189-13946-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] boot-monitor: add K2L and K2E boot monitor build support
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
X-List-Received-Date: Wed, 14 May 2014 18:37:23 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

---
 recipes-bsp/boot-monitor/boot-monitor_git.bb |   18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 7c5e9cf..2c3aa43 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -3,8 +3,12 @@ EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
 
 LICENSE = "BSD"
 
-BOOT_MONITOR_BINARY ?= "skern.bin"
-BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"
+BOOT_MONITOR_BINARY_K2HK ?= "skern-k2hk.bin"
+BOOT_MONITOR_IMAGE_k2HK  ?= "skern-k2hk-${MACHINE}.bin"
+BOOT_MONITOR_BINARY_K2L ?= "skern-k2l.bin"
+BOOT_MONITOR_IMAGE_k2L  ?= "skern-k2l-${MACHINE}.bin"
+BOOT_MONITOR_BINARY_K2E ?= "skern-k2e.bin"
+BOOT_MONITOR_IMAGE_k2E  ?= "skern-k2e-${MACHINE}.bin"
 BOOT_MONITOR_MAKE_TARGET  ?= "all"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
@@ -14,7 +18,7 @@ COMPATIBLE_MACHINE = "keystone-evm"
 SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
 PV = "2.0"
-PR = "r0+gitr${SRCPV}"
+PR = "r1+gitr${SRCPV}"
 
 BRANCH = "master"
 
@@ -27,7 +31,9 @@ do_compile () {
 	unset LDFLAGS
 	unset CFLAGS
 	unset CPPFLAGS
-	oe_runmake ${BOOT_MONITOR_MAKE_TARGET}
+	oe_runmake k2hk
+	oe_runmake k2l
+	oe_runmake k2e
 }
 
 inherit deploy
@@ -36,5 +42,7 @@ addtask deploy before do_build after do_compile
 
 do_deploy () {
 	install -d ${DEPLOYDIR}
-	install ${S}/${BOOT_MONITOR_BINARY} ${DEPLOYDIR}/${BOOT_MONITOR_IMAGE}
+	install ${S}/${BOOT_MONITOR_BINARY_K2HK} ${DEPLOYDIR}/${BOOT_MONITOR_IMAGE_K2HK}
+	install ${S}/${BOOT_MONITOR_BINARY_K2L}	${DEPLOYDIR}/${BOOT_MONITOR_IMAGE_K2L}
+	install ${S}/${BOOT_MONITOR_BINARY_K2E}	${DEPLOYDIR}/${BOOT_MONITOR_IMAGE_K2E}
 }
-- 
1.7.9.5


