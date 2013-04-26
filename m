Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF8D2E014E9
	for <meta-ti@yoctoproject.org>; Fri, 26 Apr 2013 13:08:26 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MLV00KLIP9C59N0@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 26 Apr 2013 15:08:01 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7F02E2001F; Fri,
	26 Apr 2013 16:08:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 26 Apr 2013 16:07:58 -0400
Message-id: <1367006879-12633-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH 1/2] linux-ti-staging: update to ti2013.04.00 release
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
X-List-Received-Date: Fri, 26 Apr 2013 20:08:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Also, remove do_deploy_append() fix, as it's in oe-core now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.8.bb | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

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
-- 
1.8.2.1


