Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE37DE00BB3; Fri, 13 Jun 2014 14:56:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A27D2E00BB1
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 14:56:05 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5DLu3mL007401
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 16:56:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5DLu2ME015632
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 16:56:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Jun 2014 16:56:02 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s5DLtvbP018171;	Fri, 13 Jun 2014 16:56:01 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 Jun 2014 16:55:55 -0500
Message-ID: <1402696555-21792-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1402696555-21792-1-git-send-email-Chase.Maupin@ti.com>
References: <1402696555-21792-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] u-boot: remove old mainline versions
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
X-List-Received-Date: Fri, 13 Jun 2014 21:56:13 -0000
Content-Type: text/plain

* Remove old mainline u-boot versions since the latest version
  has better support for TI platforms.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-bsp/u-boot/u-boot_2011.12.bb    |   37 -------------------------------
 recipes-bsp/u-boot/u-boot_2013.01.01.bb |   15 -------------
 2 files changed, 52 deletions(-)
 delete mode 100644 recipes-bsp/u-boot/u-boot_2011.12.bb
 delete mode 100644 recipes-bsp/u-boot/u-boot_2013.01.01.bb

diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
deleted file mode 100644
index 13cb537..0000000
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-require u-boot-ti.inc
-
-SPL_BINARY = "MLO"
-
-PR = "r8"
-
-COMPATIBLE_MACHINE = "(beagleboard|pandaboard|am3517-evm|am37x-evm|omap3evm)"
-
-# Non-omap4 platforms need outer cache turned on
-CACHEFIX = "file://2011.12/0008-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch"
-CACHEFIX_omap4 = ""
-
-# File is board-specific, only copy when it will be correct.
-FWENV_beagleboard = "file://fw_env.config"
-FWENV = ""
-
-SRC_URI = "git://git.denx.de/u-boot.git;protocol=git \
-           file://2011.12/0001-beagleboard-mount-rootfs-RO-instead-of-RW-at-boot.patch \
-           file://2011.12/0002-beagleboard-add-support-for-TCT-Beacon-board.patch \
-           file://2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch \
-           file://2011.12/0004-omap4-common-mount-root-RO.patch \
-           file://2011.12/0005-omap4-common-use-ext4-by-default.patch \
-           file://2011.12/0006-OMAP-MMC-Add-delay-before-waiting-for-status.patch \
-           file://2011.12/0007-config-Always-use-GNU-ld.patch \
-           ${CACHEFIX} \
-           file://2011.12/0009-Beagleboard-Correct-memory-size-on-rev-C4.patch \
-           file://2011.12/0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch \
-           file://2011.12/0011-ext2load-increase-read-speed.patch \
-           file://2011.12/0012-ext4fs-ls-load-support.patch \
-           file://2011.12/0013-beagleboard-switch-mmcroots-to-ext4.patch \
-           ${FWENV} \
-          "
-
-# v2011.12 tag
-SRCREV = "cba9a894fdb1cb49b60fcd1d1d6919cbd7995dd5"
-
-RRECOMMENDS_${PN}_beagleboard = "u-boot-fw-utils"
diff --git a/recipes-bsp/u-boot/u-boot_2013.01.01.bb b/recipes-bsp/u-boot/u-boot_2013.01.01.bb
deleted file mode 100644
index e3da1f3..0000000
--- a/recipes-bsp/u-boot/u-boot_2013.01.01.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require u-boot-ti.inc
-
-DESCRIPTION = "Mainline u-boot bootloader"
-
-DEFAULT_PREFERENCE = "-1"
-
-PR = "r1"
-
-SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
-
-BRANCH ?= "u-boot-2013.01.y"
-
-SRCREV = "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
-
-SPL_BINARY = "MLO"
-- 
1.7.9.5


