Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6117E0073A
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 14:36:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6E7D752AC1; Mon, 11 Mar 2013 21:36:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130311213610.6E7D752AC1@arago-project.org>
Date: Mon, 11 Mar 2013 21:36:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : linux-ti-staging: package all dtb files for ti33x
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
X-List-Received-Date: Mon, 11 Mar 2013 21:36:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 54d48a8dd27fa749aee4d7e2edd0ba288a7088de
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=54d48a8dd27fa749aee4d7e2edd0ba288a7088de

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Mon Mar 11 15:03:34 2013 -0500

linux-ti-staging: package all dtb files for ti33x

* For the ti33x SOC_FAMILY device package the dtb files for all
  of the am335x boards instead of just the single EVM file.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 5f4a05d..f6fa6d2 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -12,7 +12,9 @@ require recipes-kernel/linux/setup-defconfig.inc
 # for ti33x SOC_FAMILY devices
 DEPENDS_ti33x += "am33x-cm3"
 
-KERNEL_DEVICETREE_am335x-evm = "arch/arm/boot/dts/am335x-evm.dts"
+# Default is to package all dts files for ti33x devices unless building
+# for the specific beaglebone machine.
+KERNEL_DEVICETREE_ti33x = "arch/arm/boot/dts/am335x-evm.dts arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts"
 KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
 
 COMPATIBLE_MACHINE = "ti33x"
@@ -25,7 +27,7 @@ SRCREV = "d26595a42220789b81a9d243e2fc0837c7776360"
 PV = "3.8.2"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 
 SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


