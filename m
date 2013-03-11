Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E27A0E00741
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 14:36:09 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A6D8452AB6; Mon, 11 Mar 2013 21:36:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130311213609.A6D8452AB6@arago-project.org>
Date: Mon, 11 Mar 2013 21:36:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : linux-ti-staging: fix DTB deploy steps
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
X-List-Received-Date: Mon, 11 Mar 2013 21:36:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: f5530f4905db6c042f14ff859a391b7e672195c9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f5530f4905db6c042f14ff859a391b7e672195c9

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Mon Mar 11 15:03:35 2013 -0500

linux-ti-staging: fix DTB deploy steps

* Until the permanent fix can be picked up in oe-core fix the
  do_deploy function to properly package the dtb files built
  as part of the kernel build.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |   18 +++++++++++++++++-
 1 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index f6fa6d2..9ce507b 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -5,6 +5,22 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 KERNEL_IMAGETYPE = "uImage"
 
 inherit kernel
+
+# This function must be here BEFORE the require of linux-dtb.inc below.
+# There is a "bug" in the base kernel.bbclass that after it's do_deploy
+# step it does not return back to the ${S} directory but stays in the
+# DEPLOY_DIR.  However, the do_deploy_append defined in linux-dtb.inc
+# assumes that it is being run in the ${S} directory.  A patch is
+# being submitted to fix this issue by either changing the do_deploy
+# in the kernel.bbclass to do "cd -" as the last step or to add
+# "cd ${S}" as the first line of do_deploy in linux-dtb.inc and this
+# function can be removed once that change is available.
+# If the function is not placed BEFORE the require then the change
+# directory is not appended before the linux-dtb.inc changes.
+do_deploy_append() {
+    cd ${S}
+}
+
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
@@ -27,7 +43,7 @@ SRCREV = "d26595a42220789b81a9d243e2fc0837c7776360"
 PV = "3.8.2"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
 
 SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


