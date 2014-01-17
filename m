Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43FBDE00873
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 09:47:38 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0CF83529BF; Fri, 17 Jan 2014 17:47:37 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140117174738.0CF83529BF@arago-project.org>
Date: Fri, 17 Jan 2014 17:47:37 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : vpe-vpdma: update SRCREV and pass CROSS_COMPILE
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
X-List-Received-Date: Fri, 17 Jan 2014 17:47:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 561b40ddf9ca14f837e1834d40f94d1a23b6b66c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=561b40ddf9ca14f837e1834d40f94d1a23b6b66c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Jan 15 16:16:28 2014 -0500

vpe-vpdma: update SRCREV and pass CROSS_COMPILE

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/vpe-vpdma_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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


