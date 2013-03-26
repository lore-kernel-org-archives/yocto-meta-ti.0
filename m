Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE58BE013A7
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:24 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 85CD152A55; Tue, 26 Mar 2013 00:42:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004223.85CD152A55@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-keystone: modify keystone specific version to use new namespace feature
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a32b383e97f0c4db1846ae4ad8b2910c99eb2dcf
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a32b383e97f0c4db1846ae4ad8b2910c99eb2dcf

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 17:59:17 2013 -0400

u-boot-keystone: modify keystone specific version to use new namespace feature

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |   16 ++++++++++++++++
 recipes-bsp/u-boot/u-boot_2013.01.bb          |   23 -----------------------
 2 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
new file mode 100644
index 0000000..788d813
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
@@ -0,0 +1,16 @@
+require u-boot-ti.inc
+
+DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
+
+COMPATIBLE_MACHINE = "keystone"
+
+PR = "r2+gitr${SRCPV}"
+
+SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
+
+BRANCH = "master"
+
+# DEV.MCSDK-03.00.00.07
+SRCREV = "82f40e857d853165310d0753e79235aefb65d7ba"
+
+UBOOT_SUFFIX = "bin"
diff --git a/recipes-bsp/u-boot/u-boot_2013.01.bb b/recipes-bsp/u-boot/u-boot_2013.01.bb
deleted file mode 100644
index b9e6daf..0000000
--- a/recipes-bsp/u-boot/u-boot_2013.01.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
-
-DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-COMPATIBLE_MACHINE = "keystone"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r2+gitr${SRCPV}"
-
-SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
-
-BRANCH = "master"
-
-SRCREV = "DEV.MCSDK-03.00.00.07"
-
-EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
-
-S = "${WORKDIR}/git"
-
-UBOOT_SUFFIX = "bin"


