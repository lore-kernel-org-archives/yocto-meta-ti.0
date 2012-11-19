Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B158E00348
	for <meta-ti@yoctoproject.org>; Sun, 18 Nov 2012 21:07:43 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9ACE552AA2; Mon, 19 Nov 2012 05:07:41 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121119050741.9ACE552AA2@arago-project.org>
Date: Mon, 19 Nov 2012 05:07:41 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot: add version 2012.07 for keystone machines
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
X-List-Received-Date: Mon, 19 Nov 2012 05:07:43 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: fe6972418ab6d2b39a0991ecbe29887b259170f6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fe6972418ab6d2b39a0991ecbe29887b259170f6

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Nov 16 22:58:02 2012 -0500

u-boot: add version 2012.07 for keystone machines

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/keystone-evm.conf       |    2 +-
 recipes-bsp/u-boot/u-boot_2012.07.bb |   23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletions(-)

diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
index 188d53c..0b6d7ab 100644
--- a/conf/machine/keystone-evm.conf
+++ b/conf/machine/keystone-evm.conf
@@ -18,6 +18,6 @@ IMAGE_FSTYPES += "tar.bz2"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
-UBOOT_MACHINE = "keystone_config"
+UBOOT_MACHINE = "tci6638_evm_config"
 
 MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
diff --git a/recipes-bsp/u-boot/u-boot_2012.07.bb b/recipes-bsp/u-boot/u-boot_2012.07.bb
new file mode 100644
index 0000000..f39e60c
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot_2012.07.bb
@@ -0,0 +1,23 @@
+require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+
+DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+
+COMPATIBLE_MACHINE = "keystone"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r0+gitr${SRCPV}"
+
+SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
+
+BRANCH = "master"
+
+SRCREV = "6e710c61dba2665e01c900470a0a63743ff431c6"
+
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
+
+S = "${WORKDIR}/git"
+
+UBOOT_SUFFIX = "bin"


