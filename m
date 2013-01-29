Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90DDEE0072F
	for <meta-ti@yoctoproject.org>; Tue, 29 Jan 2013 11:45:26 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 57BA152A62; Tue, 29 Jan 2013 19:45:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130129194526.57BA152A62@arago-project.org>
Date: Tue, 29 Jan 2013 19:45:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Murali Karicheri : keystone: update kernel and bootloaders recipes for mcsdk alpha7 release
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
X-List-Received-Date: Tue, 29 Jan 2013 19:45:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 629f5ddd5d6bfc603ae967c682d46d3b08b7aa34
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=629f5ddd5d6bfc603ae967c682d46d3b08b7aa34

Author: Murali Karicheri <m-karicheri2@ti.com>
Date:   Tue Jan 29 12:14:57 2013 -0500

keystone: update kernel and bootloaders recipes for mcsdk alpha7 release

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc            |    3 ++-
 recipes-bsp/boot-monitor/boot-monitor_git.bb |    8 ++++----
 recipes-bsp/u-boot/u-boot_2013.01.bb         |    4 ++--
 recipes-kernel/linux/linux-keystone_3.6.6.bb |    2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index df9318a..b77bccd 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -5,7 +5,7 @@ require conf/machine/include/tune-cortexa15.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r4"
+MACHINE_KERNEL_PR = "r5"
 
 KERNEL_IMAGETYPE = "uImage"
 
@@ -13,3 +13,4 @@ UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
 EXTRA_IMAGEDEPENDS += "u-boot"
+EXTRA_IMAGEDEPENDS += "boot-monitor"
diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index dc4d71e..c8a022a 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -7,20 +7,20 @@ BOOT_MONITOR_BINARY ?= "skern.bin"
 BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"
 BOOT_MONITOR_MAKE_TARGET  ?= "all"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=b676661788f8c0f8cdeafd2a39467cae"
+LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
 
 COMPATIBLE_MACHINE = "keystone-evm"
 
-SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/boot-monitor.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://arago-project.org/git/projects/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
 PV = "1.0"
-PR = "r0+gitr${SRCPV}"
+PR = "r1+gitr${SRCPV}"
 
 BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "b8014b69e8c7e981e8bc3e067a9d990e2bb603ba"
+SRCREV = "DEV.MCSDK-03.00.00.07"
 
 do_compile () {
 	unset LDFLAGS
diff --git a/recipes-bsp/u-boot/u-boot_2013.01.bb b/recipes-bsp/u-boot/u-boot_2013.01.bb
index ee443b0..b9e6daf 100644
--- a/recipes-bsp/u-boot/u-boot_2013.01.bb
+++ b/recipes-bsp/u-boot/u-boot_2013.01.bb
@@ -8,13 +8,13 @@ COMPATIBLE_MACHINE = "keystone"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r1+gitr${SRCPV}"
+PR = "r2+gitr${SRCPV}"
 
 SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
 
-SRCREV = "DEV.MCSDK-03.00.00.06"
+SRCREV = "DEV.MCSDK-03.00.00.07"
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
 
diff --git a/recipes-kernel/linux/linux-keystone_3.6.6.bb b/recipes-kernel/linux/linux-keystone_3.6.6.bb
index 2aa83e6..4dd5d15 100644
--- a/recipes-kernel/linux/linux-keystone_3.6.6.bb
+++ b/recipes-kernel/linux/linux-keystone_3.6.6.bb
@@ -7,7 +7,7 @@ MACHINE_KERNEL_PR_append = "a"
 CORTEXA8FIXUP = "no"
 
 # The tree tends to rebase, use literal stable tags
-SRCREV = "DEV.MCSDK-03.00.00.06"
+SRCREV = "DEV.MCSDK-03.06.06.07"
 
 SRC_URI = "git://arago-project.org/git/projects/linux-keystone.git;protocol=git \
            file://defconfig \


