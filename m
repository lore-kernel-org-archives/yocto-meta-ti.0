Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1385E01472
	for <meta-ti@yoctoproject.org>; Wed,  5 Jun 2013 08:55:52 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8C6ED52A55; Wed,  5 Jun 2013 15:55:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130605155552.8C6ED52A55@arago-project.org>
Date: Wed,  5 Jun 2013 15:55:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-dra7xx: add latest u-boot from the integration branch
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
X-List-Received-Date: Wed, 05 Jun 2013 15:55:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 569af06fd2d930ee397f3ae38f5f41fd7eabf8ea
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=569af06fd2d930ee397f3ae38f5f41fd7eabf8ea

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jun  4 23:15:41 2013 -0400

u-boot-dra7xx: add latest u-boot from the integration branch

While the code is being pulled from ti-u-boot integration tree, J6/DRA7xx bring up
is being done from a separate branch that does not include all the commits made
for am335x. Hence, until those branches are merged with the mainline and unified
in a single recipe, a separate recipe just for DRA7xx makes more sense. This
recipe should eventually go away and unified under u-boot-ti-staging one.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 conf/machine/dra7xx-evm.conf                |    7 +++++--
 recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb |   16 ++++++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index d968d3b..5897a5f 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -8,6 +8,11 @@ IMAGE_FSTYPES += "ubi tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-dra7xx"
+PREFERRED_PROVIDER_u-boot = "u-boot-dra7xx"
+
+UBOOT_MACHINE = "dra7xx_evm_config"
+
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
@@ -29,8 +34,6 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
 # UBI: VID header offset:          2048 (aligned 2048)
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
 
-UBOOT_MACHINE = "dra7xx_evm_config"
-
 # Currently removing the sgx machine feature because there is no SGX package
 # available for omap5
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
diff --git a/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb b/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb
new file mode 100644
index 0000000..eb3fc05
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb
@@ -0,0 +1,16 @@
+require u-boot-ti.inc
+
+DESCRIPTION = "u-boot bootloader for TI devices"
+
+COMPATIBLE_MACHINE = "dra7xx-evm"
+
+PR = "r0+gitr${SRCPV}"
+
+SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
+
+BRANCH ?= "ti-u-boot-2013.04+"
+
+# This commit corresponds to ti2013.04.02 release tag
+SRCREV = "e2315adf674b60132f0c5c8fe6eac5d109b81688"
+
+SPL_BINARY = "MLO"


