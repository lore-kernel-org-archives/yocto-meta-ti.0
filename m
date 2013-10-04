Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03D06E0161F
	for <meta-ti@yoctoproject.org>; Fri,  4 Oct 2013 12:15:14 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A18F1529B0; Fri,  4 Oct 2013 19:15:13 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131004191513.A18F1529B0@arago-project.org>
Date: Fri,  4 Oct 2013 19:15:13 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : linux-ti-staging_git: Mimic patch "Correct post( inst|rm) package association"
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
X-List-Received-Date: Fri, 04 Oct 2013 19:15:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: c9a63ed5f4d1857249115690d775bd9e4d43ce8e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c9a63ed5f4d1857249115690d775bd9e4d43ce8e

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Wed Sep 25 18:00:26 2013 -0500

linux-ti-staging_git: Mimic patch "Correct post(inst|rm) package association"

* Mimic the patch kernel.bbclass: Correct post(inst|rm) package association
* This patch ensures that a proper symlink is created that satisfies U-boot's
  requirement of having the kernel image in the rootfs.
* This patch is already part of oe-core master and needs to be added to oe-core
  dylan.
* It can be reverted from meta-ti once it is pushed to oe-core/dylan

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 80ebde8..34d4e82 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -35,9 +35,22 @@ SRCREV = "e34b95baedccea12af9c0e81be77ed0a18ddae82"
 PV = "3.11+3.12-rc3"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
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


