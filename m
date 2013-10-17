Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDCD4E01653
	for <meta-ti@yoctoproject.org>; Thu, 17 Oct 2013 08:20:30 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9HFKT1f012089
	for <meta-ti@yoctoproject.org>; Thu, 17 Oct 2013 10:20:29 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9HFKTfN023643
	for <meta-ti@yoctoproject.org>; Thu, 17 Oct 2013 10:20:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 17 Oct 2013 10:20:28 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9HFKPjO018435;
	Thu, 17 Oct 2013 10:20:27 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 17 Oct 2013 11:10:41 -0500
Message-ID: <1382026241-14979-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] u-boot-ti-staging: update to 2013.10 release
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
X-List-Received-Date: Thu, 17 Oct 2013 15:20:32 -0000
Content-Type: text/plain

* Update the U-Boot LICENSE md5sum for the new release.

* Update the PV for the new U-Boot release

* Add the SRCREV that points to the 2013.10 release

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_git.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
index a5882b0..1da3c47 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
@@ -2,16 +2,17 @@ require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for TI devices"
 
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=bc069111b5e5b1ed8bed98ae73b596ec"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
-PV = "2013.07+2013.10-rc4"
+PV = "2013.10"
 PR = "r0+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "master"
 
-SRCREV = "0c5274e6f3231a3a28dafc1204b3f71a3534c520"
+# Corresponds to 2013.10
+SRCREV = "183acb700378a8cfc5d50a01a65de93fb2c24586"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
-- 
1.7.0.4


