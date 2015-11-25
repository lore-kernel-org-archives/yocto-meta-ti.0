Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA037E00AF2; Wed, 25 Nov 2015 14:07:29 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BDDEE00A4F
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 14:07:25 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAPM7PkD008838
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 16:07:25 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPM7P3w015288
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 16:07:25 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Nov 2015 16:07:24 -0600
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tAPM7Ocu000484;	Wed, 25 Nov 2015 16:07:24 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 25 Nov 2015 17:07:22 -0500
Message-ID: <1448489243-26741-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] mpm-transport: Update to new version 2.0.0.0
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
X-List-Received-Date: Wed, 25 Nov 2015 22:07:29 -0000
Content-Type: text/plain

- Updates to work with kernel version 4.1 and other uio driver changes
- Making the package machine specific and hence the dependencies
according to the platform is updated
- Add use of oe_runmake instead of direct call to make

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/mpm-transport/mpm-transport_git.bb | 30 ++++++++++++++++-----------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index 752ada5..cc211ce 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -3,16 +3,27 @@ HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-linux/mpm-transport.git"
 LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=122b7757f366f3f6fe11988715258fc9"
 COMPATIBLE_MACHINE = "keystone"
-DEPENDS = "common-csl-ip hyplnk-lld edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-lld srio-lld"
+
+DEPENDS = "common-csl-ip edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-lld uio-module-drv syslog-ng"
+DEPENDS_append_k2hk-evm += "hyplnk-lld srio-lld"
+DEPENDS_append_k2e-evm += "hyplnk-lld"
+
+RDEPENDS_${PN} = "syslog-ng"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
 
-BRANCH = "master"
-# This commit corresponds to tag DEV.MPM-TRANSPORT-01.00.08.03
-SRCREV = "f6c5426d68c2be832903b6d215370c94e134167f"
+BRANCH = "linux41"
+# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.00.00_ENG
+SRCREV = "892e93238b7f9f480ddceb7ade042026a4d178bd"
 
-PV = "1.0.8.3"
-PR = "r1"
+PV = "2.0.0.0"
+PR = "r0"
+
+EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
+EXTRA_OEMAKE_append_k2hk-evm += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
+EXTRA_OEMAKE_append_k2e-evm += "HYPLNK_TRANSPORT=true"
 
 S = "${WORKDIR}/git"
 
@@ -25,13 +36,8 @@ FILES_${PN}-test = "${bindir}/mpm_transport_test.out \
 					${bindir}/mpm_transport_qmss_arm_mt.out \
 					${bindir}/mpm_transport_srio_arm_mt.out"
 
-do_compile () {
-	cd ${S}
-	make PDK_INSTALL_PATH=${STAGING_INCDIR}
-}
-
 do_install() {
-	make installbin BASE_DIR=${S} INSTALL_BIN_BASE_DIR=${D}/${bindir}
+	oe_runmake installbin BASE_DIR=${S} INSTALL_BIN_BASE_DIR=${D}/${bindir}
 
 	install -d ${D}${includedir}/
 	install -c -m 755 ${S}/include/* ${D}${includedir}/
-- 
1.9.1


