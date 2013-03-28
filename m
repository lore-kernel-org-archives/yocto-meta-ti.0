Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70F02E014BD
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2013 12:19:33 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 719CF5298C; Thu, 28 Mar 2013 19:19:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130328191932.719CF5298C@arago-project.org>
Date: Thu, 28 Mar 2013 19:19:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: rename to have version in name, update to latest
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
X-List-Received-Date: Thu, 28 Mar 2013 19:19:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 971ee4a206f512393e224b6ad6eff5fd91d6afce
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=971ee4a206f512393e224b6ad6eff5fd91d6afce

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Mar 28 15:01:06 2013 -0400

linux-ti-staging: rename to have version in name, update to latest

* Update to the latest kernel sources.  This also requires changing
  the dtb file names since the omap5 devices have changed to use
  uevm instead of panda and sevm instead of evm.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

---

 ...x-ti-staging_git.bb => linux-ti-staging_3.8.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
similarity index 91%
rename from recipes-kernel/linux/linux-ti-staging_git.bb
rename to recipes-kernel/linux/linux-ti-staging_3.8.bb
index 081a0e6..3353792 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -32,7 +32,7 @@ DEPENDS_ti33x += "am33x-cm3"
 # for the specific beaglebone machine.
 KERNEL_DEVICETREE_ti33x = "arch/arm/boot/dts/am335x-evm.dts arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts"
 KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
-KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-evm.dts arch/arm/boot/dts/omap5-panda.dts"
+KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-sevm.dts arch/arm/boot/dts/omap5-uevm.dts"
 
 COMPATIBLE_MACHINE = "ti33x|omap-a15"
 
@@ -40,11 +40,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.8.y"
 
-SRCREV = "a91f8e121dbe0b5fb84000d9ae14fac8880c44a7"
+SRCREV = "a0a13c3cf6ff2ca9bf1b1c9163ba04c3c71811bd"
 PV = "3.8.4"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


