Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83898E014E3
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:27 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0B80052A10; Tue, 26 Mar 2013 00:42:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004227.0B80052A10@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot 2011.09-psp: remove an older no longer used version
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 597e23588ad4b38bd35e7b0f7427a55d43c22939
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=597e23588ad4b38bd35e7b0f7427a55d43c22939

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 18:03:30 2013 -0400

u-boot 2011.09-psp: remove an older no longer used version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../u-boot/u-boot_2011.09-psp04.06.00.08.bb        |   29 --------------------
 1 files changed, 0 insertions(+), 29 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb b/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
deleted file mode 100644
index 1bd4b9e..0000000
--- a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-# Use the version of u-boot.inc in oe-core not the meta-ti version
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
-
-DESCRIPTION = "u-boot bootloader for ARM MPU devices"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-COMPATIBLE_MACHINE = "ti33x|omap3"
-
-DEFAULT_PREFERENCE = "-1"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r0+gitr${SRCPV}"
-
-SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
-
-BRANCH = "AM335XPSP_04.06.00.08"
-
-# Lock to the commit corresponding to TAG:
-# v2011.09_AM335xPSP_04.06.00.08
-SRCREV = "1e4626f0d5f3bb04ec974e76a5d9029875269d31"
-
-S = "${WORKDIR}/git"
-
-UBOOT_SUFFIX = "img"
-
-# Set the name of the SPL that will built so that it is also packaged with u-boot.
-SPL_BINARY = "MLO"


