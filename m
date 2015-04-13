Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2CAE3E005A0; Mon, 13 Apr 2015 07:39:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCEF5E00306
	for <meta-ti@yoctoproject.org>; Mon, 13 Apr 2015 07:38:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3DEcrfa005385
	for <meta-ti@yoctoproject.org>; Mon, 13 Apr 2015 09:38:53 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3DEcq1c016494
	for <meta-ti@yoctoproject.org>; Mon, 13 Apr 2015 09:38:52 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 13 Apr 2015 09:38:51 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3DEcpd3013441;	Mon, 13 Apr 2015 09:38:51 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 13 Apr 2015 10:38:49 -0400
Message-ID: <1428935929-5072-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] mpm-transport: Update to new version 1.0.6.0
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
X-List-Received-Date: Mon, 13 Apr 2015 14:39:00 -0000
Content-Type: text/plain

- Add new transport using qmss, srio modules
- Update new dependency on cmem, rm-lld, qmss-lld, cppi-lld & srio-lld

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/mpm-transport/mpm-transport_git.bb |   19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index cb0f6c4..fd68721 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -1,22 +1,29 @@
 DESCRIPTION = "Multiproc transport layer for KeyStone devices: Provide basic transport layer for moving data between different processing nodes"
 HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-linux/mpm-transport.git"
 LICENSE = "BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c17cd1dc60dc06a4c4f2a2c45472a51"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=122b7757f366f3f6fe11988715258fc9"
 COMPATIBLE_MACHINE = "keystone"
-DEPENDS = "common-csl-ip hyplnk-lld edma3-lld mmap-lld"
+DEPENDS = "common-csl-ip hyplnk-lld edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-lld srio-lld"
 
 SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
-# This commit corresponds to tag DEV.MPM-TRANSPORT-01.00.06.00
-SRCREV = "af2d2ad8721b769012662c539a86b94f7d44dbda"
-PV = "1.0.6.0"
+# This commit corresponds to tag DEV.MPM-TRANSPORT-01.00.07.00A
+SRCREV = "267db40a9c551bd91dbed470d57cd1ed0d9e9141"
+
+PV = "1.0.7.0"
 PR = "r1"
 
 S = "${WORKDIR}/git"
 
 PACKAGES =+ "${PN}-test"
-FILES_${PN}-test = "${bindir}/mpm_transport_test.out ${bindir}/mpm_transport_hyplnk_loopback.out ${bindir}/mpm_transport_hyplnk_remote.out ${bindir}/mpm_transport_hyplnk_loopback_dma.out ${bindir}/mpm_transport_hyplnk_loopback64.out"
+FILES_${PN}-test = "${bindir}/mpm_transport_test.out \
+					${bindir}/mpm_transport_hyplnk_loopback.out \
+					${bindir}/mpm_transport_hyplnk_remote.out \
+					${bindir}/mpm_transport_hyplnk_loopback_dma.out \
+					${bindir}/mpm_transport_hyplnk_loopback64.out \
+					${bindir}/mpm_transport_qmss_arm_mt.out \
+					${bindir}/mpm_transport_srio_arm_mt.out"
 
 do_compile () {
 	cd ${S}
-- 
1.7.9.5


