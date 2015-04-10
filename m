Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6691CE009A4; Fri, 10 Apr 2015 14:57:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81F5FE00961
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 14:57:01 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3ALv1G3009340
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 16:57:01 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3ALv0dH004892
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 16:57:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 16:57:00 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3ALv0nJ004503;	Fri, 10 Apr 2015 16:57:00 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 10 Apr 2015 17:56:58 -0400
Message-ID: <1428703018-23588-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] rm-lld: Update to new version 2.1.0.8
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
X-List-Received-Date: Fri, 10 Apr 2015 21:57:03 -0000
Content-Type: text/plain

- Updated test files

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/rm-lld/rm-lld_git.bb |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/rm-lld/rm-lld_git.bb b/recipes-bsp/rm-lld/rm-lld_git.bb
index ed34478..beac927 100644
--- a/recipes-bsp/rm-lld/rm-lld_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld_git.bb
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b6536
 
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/rm-lld.git;destsuffix=git/ti/drv/rm;protocol=git;branch=${BRANCH}"
-# Below commit ID corresponds to DEV.RM_LLD.02.01.00.06
-SRCREV = "dc0dba4a6b0358efcb861d50b3dae21beb5281a8"
-PV = "02.01.00.06"
-PR = "r0"
+# Below commit ID corresponds to DEV.RM_LLD.02.01.00.08
+SRCREV = "7873d22076b4cb865365bbce20a244121414bb44"
+PV = "02.01.00.08"
+PR = "r1"
 
 COMPATIBLE_MACHINE = "keystone"
 
@@ -15,8 +15,9 @@ DEPENDS = "ti-ipc libdaemon"
 
 PACKAGES =+ "${PN}-test"
 
-FILES_${PN}-test = "${bindir}/rmDspClientTest_*.out \
-                    ${bindir}/rmLinuxClientTest_*.out \
+FILES_${PN}-test = "${bindir}/rmDspClientTest.out \
+                    ${bindir}/rmLinuxClientTest.out \
+                    ${bindir}/rmLinuxMtClientTest.out \
                     ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
 
 CHOICELIST = "yes no"
-- 
1.7.9.5


