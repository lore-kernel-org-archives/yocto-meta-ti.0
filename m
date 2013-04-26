Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45886E014EF
	for <meta-ti@yoctoproject.org>; Fri, 26 Apr 2013 13:55:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B995E52A77; Fri, 26 Apr 2013 20:55:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130426205515.B995E52A77@arago-project.org>
Date: Fri, 26 Apr 2013 20:55:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to ti2013.04.00 release
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
X-List-Received-Date: Fri, 26 Apr 2013 20:55:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 418403ee9953ad475ee060e2448c3d16c6805a3d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=418403ee9953ad475ee060e2448c3d16c6805a3d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Apr 26 15:55:47 2013 -0400

linux-ti-staging: update to ti2013.04.00 release

Also, remove do_deploy_append() fix, as it's in oe-core now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.8.bb |   20 +++-----------------
 1 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 622fa3e..6fe52e2 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -6,21 +6,6 @@ KERNEL_IMAGETYPE = "uImage"
 
 inherit kernel
 
-# This function must be here BEFORE the require of linux-dtb.inc below.
-# There is a "bug" in the base kernel.bbclass that after it's do_deploy
-# step it does not return back to the ${S} directory but stays in the
-# DEPLOY_DIR.  However, the do_deploy_append defined in linux-dtb.inc
-# assumes that it is being run in the ${S} directory.  A patch is
-# being submitted to fix this issue by either changing the do_deploy
-# in the kernel.bbclass to do "cd -" as the last step or to add
-# "cd ${S}" as the first line of do_deploy in linux-dtb.inc and this
-# function can be removed once that change is available.
-# If the function is not placed BEFORE the require then the change
-# directory is not appended before the linux-dtb.inc changes.
-do_deploy_append() {
-    cd ${S}
-}
-
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
@@ -40,11 +25,12 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.8.y"
 
-SRCREV = "1de3616c36710b6949844738f9c63b96e307c49f"
+# This commit corresponds to ti2013.04.00 release tag
+SRCREV = "23e7f725a6af4ca44660c06bc3569f6ce705d1d0"
 PV = "3.8.8"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


