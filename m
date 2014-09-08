Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9823DE0080F; Mon,  8 Sep 2014 16:31:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 604EAE0056A
	for <meta-ti@yoctoproject.org>; Mon,  8 Sep 2014 16:31:50 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NBL00306W05HS50@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 08 Sep 2014 18:31:27 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3DCAF20015; Mon,
	08 Sep 2014 19:31:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 08 Sep 2014 19:31:16 -0400
Message-id: <1410219076-24551-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] vpe-vpdma: pass float ABI flag to fix gcc-4.9.1 issue with stubs
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
X-List-Received-Date: Mon, 08 Sep 2014 23:31:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Similar fix as 7b8ee4026e0e3b69a8ce5526be24ba70321e88dc, see for more details.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb b/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
index 14f059b..f7a63ab 100644
--- a/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
+++ b/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
 COMPATIBLE_MACHINE = "dra7xx"
 
 PV = "1b8"
-PR = "r1"
+PR = "r2"
 
 SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
 BRANCH ?= "master"
@@ -17,8 +17,10 @@ SRC_URI = "git://git.ti.com/vpe_tests/vpe_tests.git;protocol=git;branch=${BRANCH
 
 S = "${WORKDIR}/git"
 
+FLOATABI = "${@base_contains("TUNE_FEATURES", "vfp", base_contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
+
 # The test application needs additional include headers from the kernel
-EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" KDIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include"'
+EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${FLOATABI}" KDIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include"'
 
 do_install() {
     oe_runmake DESTDIR="${D}" install
-- 
2.0.4


