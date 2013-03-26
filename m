Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71880E0144A
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0431152AA9; Tue, 26 Mar 2013 00:42:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004224.0431152AA9@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-am33x: modify am33x specific version to use new namespace feature
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 48673d8784c36184a9e4b3d2c81cfe74d1fa9953
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=48673d8784c36184a9e4b3d2c81cfe74d1fa9953

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 18:07:18 2013 -0400

u-boot-am33x: modify am33x specific version to use new namespace feature

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-am33x_2012.10.bb |   17 ++++++++++++++
 recipes-bsp/u-boot/u-boot_2012.10.bb       |   32 ----------------------------
 2 files changed, 17 insertions(+), 32 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb b/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
new file mode 100644
index 0000000..7320e02
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
@@ -0,0 +1,17 @@
+require u-boot-ti.inc
+
+DESCRIPTION = "u-boot bootloader for ARM MPU devices"
+
+COMPATIBLE_MACHINE = "ti33x|omap3"
+
+DEFAULT_PREFERENCE = "-1"
+
+PR = "r7+gitr${SRCPV}"
+
+SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
+
+BRANCH = "amsdk-05.06.00.00"
+
+SRCREV = "6536bfa6b7f16bb49fdea8c72959e3ed54e77a82"
+
+SPL_BINARY = "MLO"
diff --git a/recipes-bsp/u-boot/u-boot_2012.10.bb b/recipes-bsp/u-boot/u-boot_2012.10.bb
deleted file mode 100644
index 89d646c..0000000
--- a/recipes-bsp/u-boot/u-boot_2012.10.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-# Use the version of u-boot.inc in oe-core not the meta-ti version
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
-
-# Reset OEMAKE. Current u-boot.inc sets -02 which breaks this version of u-boot's build.
-# This issue was fixed in oe-core master by removing the -02 statement.
-EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
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
-PR = "r7+gitr${SRCPV}"
-
-SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH} \
-"
-
-BRANCH = "amsdk-05.06.00.00"
-
-SRCREV = "6536bfa6b7f16bb49fdea8c72959e3ed54e77a82"
-
-S = "${WORKDIR}/git"
-
-UBOOT_SUFFIX = "img"
-
-# Set the name of the SPL that will built so that it is also packaged with u-boot.
-SPL_BINARY = "MLO"


