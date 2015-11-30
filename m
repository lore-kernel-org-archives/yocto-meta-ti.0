Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C3CDE008C8; Mon, 30 Nov 2015 13:46:29 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E03DE009C3
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 13:46:23 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D1C6752AA2; Mon, 30 Nov 2015 21:46:20 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151130214620.D1C6752AA2@arago-project.org>
Date: Mon, 30 Nov 2015 21:46:20 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : mpm-transport: Update to new version 2.0.0.0
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
X-List-Received-Date: Mon, 30 Nov 2015 21:46:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 91ba0c77fbc0a8447d640b55358867473f304eda
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=91ba0c77fbc0a8447d640b55358867473f304eda

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Nov 26 04:07:22 2015 +0000

mpm-transport: Update to new version 2.0.0.0

- Updates to work with kernel version 4.1 and other uio driver changes
- Making the package machine specific and hence the dependencies
according to the platform is updated
- Add use of oe_runmake instead of direct call to make

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/mpm-transport/mpm-transport_git.bb |   30 +++++++++++++++----------
 1 files changed, 18 insertions(+), 12 deletions(-)

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


