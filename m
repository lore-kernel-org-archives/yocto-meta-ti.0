Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5647FE0140A
	for <meta-ti@yoctoproject.org>; Thu, 18 Apr 2013 12:45:33 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7593C52A67; Thu, 18 Apr 2013 19:45:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130418194532.7593C52A67@arago-project.org>
Date: Thu, 18 Apr 2013 19:45:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : linux-ti-staging: make cm3 firmware a run-time dependency
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
X-List-Received-Date: Thu, 18 Apr 2013 19:45:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5296478b700fbbe54aa9c9c243e15e50f1c5ea52
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5296478b700fbbe54aa9c9c243e15e50f1c5ea52

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Thu Apr 18 12:40:21 2013 -0500

linux-ti-staging: make cm3 firmware a run-time dependency

* Make the am33x-cm3 firmware a run-time dependency instead of
  build time since it is no longer required at build time.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.8.bb |   16 ++++------------
 1 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 77d8e8a..6cbc2df 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -24,9 +24,9 @@ do_deploy_append() {
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-# Stage the power management firmware before building the kernel
-# for ti33x SOC_FAMILY devices
-DEPENDS_ti33x += "am33x-cm3"
+# Add a run-time dependency for the PM firmware to be installed
+# on the target file system.
+RDEPENDS_ti33x += "am33x-cm3"
 
 # Default is to package all dts files for ti33x devices unless building
 # for the specific beaglebone machine.
@@ -44,16 +44,8 @@ SRCREV = "881dfafeae47da3a8f5ff8c791753e4b4df8065b"
 PV = "3.8.5"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "e+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
           "
-
-# Copy the am33x-cm3 firmware if it is available for ti33x SOC_FAMILY devices
-do_compile_prepend_ti33x() {
-    if [ -e "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" ]
-    then
-        cp "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" "${S}/firmware"
-    fi
-}


