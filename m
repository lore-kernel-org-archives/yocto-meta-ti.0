Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFAA1E01248
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 14:36:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4517E529B9; Mon, 11 Mar 2013 21:36:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130311213610.4517E529B9@arago-project.org>
Date: Mon, 11 Mar 2013 21:36:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : linux-ti-staging: mark dependencies am335x specific
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
Branch: master
Commit: c61133759920cffe3809bbf6fc29d44daf3829a3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c61133759920cffe3809bbf6fc29d44daf3829a3

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Mon Mar 11 15:03:33 2013 -0500

linux-ti-staging: mark dependencies am335x specific

* The DEPENDS on am33x-cm3 and the installation of the cm3
  firmware is specific to ti33x SOC_FAMILY devices.  Mark those
  pieces as specific so that other devices to not depend on
  am335x cm3 firmware.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 2581409..5f4a05d 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -9,7 +9,8 @@ require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
 # Stage the power management firmware before building the kernel
-DEPENDS += "am33x-cm3"
+# for ti33x SOC_FAMILY devices
+DEPENDS_ti33x += "am33x-cm3"
 
 KERNEL_DEVICETREE_am335x-evm = "arch/arm/boot/dts/am335x-evm.dts"
 KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
@@ -30,8 +31,8 @@ SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=g
            file://defconfig \
           "
 
-# Copy the am33x-cm3 firmware if it is available
-do_compile_prepend() {
+# Copy the am33x-cm3 firmware if it is available for ti33x SOC_FAMILY devices
+do_compile_prepend_ti33x() {
     if [ -e "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" ]
     then
         cp "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" "${S}/firmware"


