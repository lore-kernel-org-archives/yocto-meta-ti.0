Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0EF0EE00C0A; Mon, 16 Jun 2014 15:38:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=RDNS_DYNAMIC autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47E73E00C0A
	for <meta-ti@yoctoproject.org>; Mon, 16 Jun 2014 15:38:43 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2FFF152A63; Mon, 16 Jun 2014 22:38:43 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140616223843.2FFF152A63@arago-project.org>
Date: Mon, 16 Jun 2014 22:38:43 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Maupin, Chase : u-boot: remove old mainline versions
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
X-List-Received-Date: Mon, 16 Jun 2014 22:38:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 125f8cf47e87f6fc3cce2d65cbcfee35935ee80f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=125f8cf47e87f6fc3cce2d65cbcfee35935ee80f

Author: Maupin, Chase <chase.maupin@ti.com>
Date:   Sat Jun 14 03:55:55 2014 +0000

u-boot: remove old mainline versions

* Remove old mainline u-boot versions since the latest version
  has better support for TI platforms.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot_2011.12.bb    |   37 -------------------------------
 recipes-bsp/u-boot/u-boot_2013.01.01.bb |   15 ------------
 2 files changed, 0 insertions(+), 52 deletions(-)

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


