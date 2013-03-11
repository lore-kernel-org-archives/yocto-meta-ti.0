Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E802DE00496
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 13:17:29 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2BKHRhV031992
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 15:17:28 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BKHR4U018345
	for <meta-ti@yoctoproject.org>; Tue, 12 Mar 2013 01:47:27 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 12 Mar 2013 01:47:27 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BKHPce013064;
	Tue, 12 Mar 2013 01:47:26 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 11 Mar 2013 15:17:21 -0500
Message-ID: <1363033043-21593-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/3] u-boot-ti-staging: Add TI staging U-Boot recipe
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
X-List-Received-Date: Mon, 11 Mar 2013 20:17:30 -0000
Content-Type: text/plain

* Pull the TI staging U-Boot tree for use with ti33x devices and
  the omap-a15 devices.
* Used the PN u-boot-ti-staging to make it easy to set a
  PREFERRED_PROVIDER in the machine configuration to point to
  this recipe instead of the default u-boot recipe since TI devices
  should point to the TI staging trees by default.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 ...> u-boot-ti-staging_2013.01.01-ti2013.2Q.00.bb} |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)
 copy recipes-bsp/u-boot/{u-boot_2011.09-psp04.06.00.08.bb => u-boot-ti-staging_2013.01.01-ti2013.2Q.00.bb} (61%)

diff --git a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01-ti2013.2Q.00.bb
similarity index 61%
copy from recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
copy to recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01-ti2013.2Q.00.bb
index 1bd4b9e..67e1988 100644
--- a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01-ti2013.2Q.00.bb
@@ -1,11 +1,11 @@
 # Use the version of u-boot.inc in oe-core not the meta-ti version
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
 
-DESCRIPTION = "u-boot bootloader for ARM MPU devices"
+DESCRIPTION = "u-boot bootloader for TI devices"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
-COMPATIBLE_MACHINE = "ti33x|omap3"
+COMPATIBLE_MACHINE = "ti33x|omap3|omap-a15"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -13,13 +13,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PR = "r0+gitr${SRCPV}"
 
-SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gitorious.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
-BRANCH = "AM335XPSP_04.06.00.08"
+BRANCH = "ti-u-boot-2013.01.01"
 
 # Lock to the commit corresponding to TAG:
-# v2011.09_AM335xPSP_04.06.00.08
-SRCREV = "1e4626f0d5f3bb04ec974e76a5d9029875269d31"
+# TBD
+SRCREV = "c44c35e24b1532272118c58c57f658f21b72a4dd"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.0.4


