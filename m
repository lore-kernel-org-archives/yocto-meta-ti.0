Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DBF4E0159B
	for <meta-ti@yoctoproject.org>; Fri, 11 Oct 2013 14:23:26 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9BLNPkT022529
	for <meta-ti@yoctoproject.org>; Fri, 11 Oct 2013 16:23:25 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9BLNPEb022884
	for <meta-ti@yoctoproject.org>; Fri, 11 Oct 2013 16:23:25 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 11 Oct 2013 16:23:25 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9BLNMwA014724;
	Fri, 11 Oct 2013 16:23:24 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 11 Oct 2013 17:11:45 -0500
Message-ID: <1381529505-6693-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] Revert "linux-ti-staging_git: Mimic patch "Correct post(inst|rm) package association""
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
X-List-Received-Date: Fri, 11 Oct 2013 21:23:34 -0000
Content-Type: text/plain

This reverts commit c9a63ed5f4d1857249115690d775bd9e4d43ce8e.

Patch has been picked up in dylan.
---
 recipes-kernel/linux/linux-ti-staging_git.bb |   15 +--------------
 1 files changed, 1 insertions(+), 14 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 875df82..f26b223 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -35,22 +35,9 @@ SRCREV = "04faa81d0573686847c8c74f4c67c8a69c13ce9f"
 PV = "3.11+3.12-rc4"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
           "
-
-# The below code mimics patch 
-# "kernel.bbclass: Correct post(inst|rm) package association" which is included
-# in oe-core master. Once the patch has been pushed into dylan the below code
-# can be removed.
-
-pkg_postinst_kernel-image_append () {
-	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
-}
-
-pkg_postrm_kernel-image () {
-	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
-}
-- 
1.7.0.4


