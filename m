Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E71AE016F9
	for <meta-ti@yoctoproject.org>; Sun, 13 Oct 2013 14:57:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 804DA529D3; Sun, 13 Oct 2013 21:57:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131013215725.804DA529D3@arago-project.org>
Date: Sun, 13 Oct 2013 21:57:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : Revert "linux-ti-staging_git: Mimic patch " Correct post(inst|rm) package association""
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
X-List-Received-Date: Sun, 13 Oct 2013 21:57:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: fa4872bb1ffdaf6eb082a2a5145ab9916052eb86
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fa4872bb1ffdaf6eb082a2a5145ab9916052eb86

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Fri Oct 11 17:11:45 2013 -0500

Revert "linux-ti-staging_git: Mimic patch "Correct post(inst|rm) package association""

This reverts commit c9a63ed5f4d1857249115690d775bd9e4d43ce8e.

Patch has been picked up in oe-core/dylan.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

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


