Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33158E009A7; Fri, 23 May 2014 12:18:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 352E6E00BB3
	for <meta-ti@yoctoproject.org>; Fri, 23 May 2014 12:17:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D7C9D52A73; Fri, 23 May 2014 19:17:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140523191758.D7C9D52A73@arago-project.org>
Date: Fri, 23 May 2014 19:17:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Maupin, Chase : linux-ti-staging: Remove old 3.8 version
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
X-List-Received-Date: Fri, 23 May 2014 19:18:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: 091a44e838c5276d4494d4d9b68ff54eaa81e18b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=091a44e838c5276d4494d4d9b68ff54eaa81e18b

Author: Maupin, Chase <chase.maupin@ti.com>
Date:   Thu May 22 22:16:13 2014 +0000

linux-ti-staging: Remove old 3.8 version

* The 3.8 version is replaced with v3.12 which has full support
  for all devices.
* As part of adding a v3.15 version cleanup the v3.8 version to
  reduce the number of kernels to latest and last stable.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.8.bb |   39 --------------------------
 1 files changed, 0 insertions(+), 39 deletions(-)

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


