Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0E09E007E2
	for <meta-ti@yoctoproject.org>; Wed, 15 Jan 2014 13:17:07 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.18.138.84])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MZG0087MOFKGVG0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 15 Jan 2014 15:16:48 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8F5602004C; Wed,
	15 Jan 2014 16:16:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 15 Jan 2014 16:16:28 -0500
Message-id: <1389820588-17906-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] vpe-vpdma: update SRCREV and pass CROSS_COMPILE
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
X-List-Received-Date: Wed, 15 Jan 2014 21:17:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti/vpe-vpdma_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti/vpe-vpdma_git.bb b/recipes-bsp/ti/vpe-vpdma_git.bb
index d506791..fb3012a 100644
--- a/recipes-bsp/ti/vpe-vpdma_git.bb
+++ b/recipes-bsp/ti/vpe-vpdma_git.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
 COMPATIBLE_MACHINE = "dra7xx-evm"
 
 PV = "1b8"
-PR = "r0"
+PR = "r1"
 
-SRCREV = "24a5487ec13bf560f0e7fb24a9d4747f9f358be2"
+SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
 BRANCH ?= "master"
 
 SRC_URI = "git://git.ti.com/vpe_tests/vpe_tests.git;protocol=git;branch=${BRANCH}"
@@ -18,7 +18,7 @@ SRC_URI = "git://git.ti.com/vpe_tests/vpe_tests.git;protocol=git;branch=${BRANCH
 S = "${WORKDIR}/git"
 
 # The test application needs additional include headers from the kernel
-EXTRA_OEMAKE = 'KDIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include"'
+EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" KDIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include"'
 
 do_install() {
     oe_runmake DESTDIR="${D}" install
-- 
1.8.3.2


