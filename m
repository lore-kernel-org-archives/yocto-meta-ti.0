Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8A4DE00B68; Thu, 22 May 2014 09:16:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from bear.ext.ti.com (unknown [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 770D8E00975
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 09:16:21 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4MGGKVH031695
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 11:16:21 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4MGGKif018464
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 11:16:20 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 22 May 2014 11:16:20 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4MGGHaU013978;	Thu, 22 May 2014 11:16:19 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 May 2014 11:16:13 -0500
Message-ID: <1400775376-28129-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/4] linux-ti-staging: Remove old 3.8 version
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
X-List-Received-Date: Thu, 22 May 2014 16:16:26 -0000
Content-Type: text/plain

* The 3.8 version is replaced with v3.12 which has full support
  for all devices.
* As part of adding a v3.15 version cleanup the v3.8 version to
  reduce the number of kernels to latest and last stable.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.8.bb |   39 --------------------------
 1 file changed, 39 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-ti-staging_3.8.bb

diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
deleted file mode 100644
index 80b94f6..0000000
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SECTION = "kernel"
-DESCRIPTION = "Linux kernel for TI devices"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-KERNEL_IMAGETYPE = "uImage"
-
-inherit kernel
-
-require recipes-kernel/linux/linux-dtb.inc
-require recipes-kernel/linux/setup-defconfig.inc
-
-# Add a run-time dependency for the PM firmware to be installed
-# on the target file system.
-RDEPENDS_kernel-base_append_ti33x = " am33x-cm3 am33x-cm3-initscript"
-
-# Default is to package all dtb files for ti33x devices unless building
-# for the specific beaglebone machine.
-KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb"
-KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb"
-KERNEL_DEVICETREE_omap5-evm = "omap5-sevm.dtb omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
-
-COMPATIBLE_MACHINE = "ti33x|omap-a15"
-
-S = "${WORKDIR}/git"
-
-BRANCH = "ti-linux-3.8.y"
-
-# This commit corresponds to ti2013.04.02 release tag
-SRCREV = "f3cb62a800ae37f17a3382b10d155ee02dbc83fc"
-PV = "3.8.13"
-
-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "g+gitr${SRCPV}"
-PR = "${MACHINE_KERNEL_PR}"
-
-SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
-           file://defconfig \
-          "
-- 
1.7.9.5


