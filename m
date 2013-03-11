Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE7F3E0072F
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 13:03:50 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2BK3nbE032164
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 15:03:49 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BK3m0o016467
	for <meta-ti@yoctoproject.org>; Tue, 12 Mar 2013 01:33:48 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 12 Mar 2013 01:33:48 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BK3bVZ012196;
	Tue, 12 Mar 2013 01:33:47 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 11 Mar 2013 15:03:35 -0500
Message-ID: <1363032215-12645-5-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363032215-12645-1-git-send-email-Chase.Maupin@ti.com>
References: <1363032215-12645-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] linux-ti-staging: fix DTB deploy steps
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
X-List-Received-Date: Mon, 11 Mar 2013 20:03:51 -0000
Content-Type: text/plain

* Until the permanent fix can be picked up in oe-core fix the
  do_deploy function to properly package the dtb files built
  as part of the kernel build.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
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
-- 
1.7.0.4


