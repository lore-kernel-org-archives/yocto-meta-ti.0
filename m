Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8785BE01621
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 15:17:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8PMHNj5029771
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 17:17:23 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8PMHMi8022556
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 17:17:22 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 25 Sep 2013 17:17:22 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8PMHJ0s007353;
	Wed, 25 Sep 2013 17:17:20 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 25 Sep 2013 18:00:26 -0500
Message-ID: <1380150026-16483-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [dylan][PATCH] linux-ti-staging_git: Mimic patch "Correct post(inst|rm) package association"
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
X-List-Received-Date: Wed, 25 Sep 2013 22:17:24 -0000
Content-Type: text/plain

* Mimic the patch
  kernel.bbclass: Correct post(inst|rm) package association
* This patch ensures that a proper symlink is created that satisfies U-boot's
  requirement of having the kernel image in the rootfs.
* This patch is already apart of oe-core master and needs to be added to oe-core
  dylan.
* A patch to do this has already been submitted:
  http://lists.openembedded.org/pipermail/openembedded-core/2013-September/084755.html

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_git.bb |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index b75e650..6bdf9e3 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -32,8 +32,21 @@ SRCREV = "351da8b4c2ff277b2d816a2108ada357a63fadbe"
 PV = "3.11+3.12-rc1"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
           "
+
+# The below code mimics patch 
+# "kernel.bbclass: Correct post(inst|rm) package association" which is included
+# in oe-core master. Once the patch has been pushed into dylan the below code
+# can be removed.
+
+pkg_postinst_kernel-image_append () {
+	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
+}
+
+pkg_postrm_kernel-image () {
+	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
+}
-- 
1.7.0.4


