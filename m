Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8CE2EE0070E
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 13:03:46 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2BK3il4024081
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 15:03:45 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BK3ijx016455
	for <meta-ti@yoctoproject.org>; Tue, 12 Mar 2013 01:33:44 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 12 Mar 2013 01:33:44 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BK3bVW012196;
	Tue, 12 Mar 2013 01:33:43 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 11 Mar 2013 15:03:32 -0500
Message-ID: <1363032215-12645-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363032215-12645-1-git-send-email-Chase.Maupin@ti.com>
References: <1363032215-12645-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] linux-ti-staging: use setup-defconfig
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
X-List-Received-Date: Mon, 11 Mar 2013 20:03:46 -0000
Content-Type: text/plain

* Use the setup-defconfig.inc functionality to specify the in
  kernel tree defconfig file to use rather than hard coding it
  in the do_configure step.
* This is to make it easier to modify which configs are use by
  other layers as well as supporting additional machines which
  may not use omap2plus_defconfig as needed.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-kernel/linux/linux-ti-staging/defconfig |    1 +
 recipes-kernel/linux/linux-ti-staging_git.bb    |   15 +++++----------
 2 files changed, 6 insertions(+), 10 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti-staging/defconfig

diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig b/recipes-kernel/linux/linux-ti-staging/defconfig
new file mode 100644
index 0000000..926b35a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/defconfig
@@ -0,0 +1 @@
+use-kernel-config=omap2plus_defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 8cc7206..2581409 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -6,6 +6,7 @@ KERNEL_IMAGETYPE = "uImage"
 
 inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
+require recipes-kernel/linux/setup-defconfig.inc
 
 # Stage the power management firmware before building the kernel
 DEPENDS += "am33x-cm3"
@@ -23,17 +24,11 @@ SRCREV = "d26595a42220789b81a9d243e2fc0837c7776360"
 PV = "3.8.2"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 
-SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}"
-
-do_setup_defconfig() {
-        :
-}
-
-do_configure() {
-    oe_runmake omap2plus_defconfig
-}
+SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
+           file://defconfig \
+          "
 
 # Copy the am33x-cm3 firmware if it is available
 do_compile_prepend() {
-- 
1.7.0.4


