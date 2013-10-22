Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50BF6E01742
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 13:27:35 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C5C6A529CC; Tue, 22 Oct 2013 20:27:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131022202734.C5C6A529CC@arago-project.org>
Date: Tue, 22 Oct 2013 20:27:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : dra7xx-evm: remove u-boot preferred provider
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
X-List-Received-Date: Tue, 22 Oct 2013 20:27:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: b4349f859654efcbca3be3c8376205db7f7175f8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b4349f859654efcbca3be3c8376205db7f7175f8

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Tue Oct 22 16:12:02 2013 -0500

dra7xx-evm: remove u-boot preferred provider

* Now the DRA7xx support is fully merged into upstream u-boot
  then we can remove setting the PREFERRED_PROVIDER for
  u-boot and virtual/bootloader to u-boot-dra7xx and instead
  pick up the default setting from the omap-a15.inc file.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/dra7xx-evm.conf                |    3 ---
 conf/machine/include/omap-a15.inc           |    2 +-
 recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb |   16 ----------------
 3 files changed, 1 insertions(+), 20 deletions(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 5897a5f..14253cf 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -8,9 +8,6 @@ IMAGE_FSTYPES += "ubi tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-dra7xx"
-PREFERRED_PROVIDER_u-boot = "u-boot-dra7xx"
-
 UBOOT_MACHINE = "dra7xx_evm_config"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index aba122a..308b2e4 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa15.inc
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r1"
+MACHINE_KERNEL_PR = "r2"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
diff --git a/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb b/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb
deleted file mode 100644
index 7cf1b8f..0000000
--- a/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require u-boot-ti.inc
-
-DESCRIPTION = "u-boot bootloader for TI devices"
-
-COMPATIBLE_MACHINE = "dra7xx-evm"
-
-PR = "r1+gitr${SRCPV}"
-
-SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
-
-BRANCH ?= "ti-u-boot-2013.04+"
-
-# This commit corresponds to ti2013.04.02 release tag
-SRCREV = "ca435c914e069f5b74f05f667e2064784943a0ac"
-
-SPL_BINARY = "MLO"


