Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A651E01409
	for <meta-ti@yoctoproject.org>; Tue,  4 Jun 2013 13:40:47 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E83BA5299C; Tue,  4 Jun 2013 20:40:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130604204046.E83BA5299C@arago-project.org>
Date: Tue,  4 Jun 2013 20:40:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : linux-ti-staging: Add dra7xx-evm support
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
X-List-Received-Date: Tue, 04 Jun 2013 20:40:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 3e1ab248af2417e0654197c31775bde6652b1bd4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3e1ab248af2417e0654197c31775bde6652b1bd4

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Mon Jun  3 17:11:45 2013 -0500

linux-ti-staging: Add dra7xx-evm support

* Add the DTB entries for the dra7xx-evm machine type
* Update to the latest git sources which have dra7xx-evm support.
* Update the PV to match the latest source version

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.8.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 4b93932..f62cbe2 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -18,6 +18,7 @@ RDEPENDS_kernel-base_ti33x += "am33x-cm3 am33x-cm3-initscript"
 KERNEL_DEVICETREE_ti33x = "arch/arm/boot/dts/am335x-evm.dts arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts"
 KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
 KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-sevm.dts arch/arm/boot/dts/omap5-uevm.dts"
+KERNEL_DEVICETREE_dra7xx-evm = "arch/arm/boot/dts/dra7-evm.dts"
 
 COMPATIBLE_MACHINE = "ti33x|omap-a15"
 
@@ -26,8 +27,8 @@ S = "${WORKDIR}/git"
 BRANCH = "ti-linux-3.8.y"
 
 # This commit corresponds to ti2013.04.00 release tag
-SRCREV = "23e7f725a6af4ca44660c06bc3569f6ce705d1d0"
-PV = "3.8.8"
+SRCREV = "54d80897fd69e30702f3b6f115d77d37ad78f9ef"
+PV = "3.8.13"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"


