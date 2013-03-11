Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1AA87E00719
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 13:03:48 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2BK3km0032143
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 15:03:46 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BK3jYf016459
	for <meta-ti@yoctoproject.org>; Tue, 12 Mar 2013 01:33:45 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 12 Mar 2013 01:33:45 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BK3bVX012196;
	Tue, 12 Mar 2013 01:33:44 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 11 Mar 2013 15:03:33 -0500
Message-ID: <1363032215-12645-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363032215-12645-1-git-send-email-Chase.Maupin@ti.com>
References: <1363032215-12645-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] linux-ti-staging: mark dependencies am335x specific
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
X-List-Received-Date: Mon, 11 Mar 2013 20:03:48 -0000
Content-Type: text/plain

* The DEPENDS on am33x-cm3 and the installation of the cm3
  firmware is specific to ti33x SOC_FAMILY devices.  Mark those
  pieces as specific so that other devices to not depend on
  am335x cm3 firmware.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
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
-- 
1.7.0.4


