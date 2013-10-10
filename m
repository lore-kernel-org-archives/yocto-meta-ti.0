Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0684E01653
	for <meta-ti@yoctoproject.org>; Thu, 10 Oct 2013 15:49:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B7BC652A64; Thu, 10 Oct 2013 22:49:20 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131010224920.B7BC652A64@arago-project.org>
Date: Thu, 10 Oct 2013 22:49:20 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : linux-ti-staging: Switch DTB from using machine name to soc family name
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
X-List-Received-Date: Thu, 10 Oct 2013 22:49:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 07001d91159bf252097de88bec0fad20d57351dc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=07001d91159bf252097de88bec0fad20d57351dc

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Wed Oct  9 14:58:15 2013 -0500

linux-ti-staging: Switch DTB from using machine name to soc family name

* Use SOC family value for am437x instead of machine name for DTB files.
* This mimics the current approach taken for am335x.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index ce7c810..875df82 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -18,7 +18,7 @@ RDEPENDS_kernel-base_append_ti33x = " am33x-cm3 am33x-cm3-initscript"
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
 KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
-KERNEL_DEVICETREE_am437x-evm = "am43x-epos-evm.dtb"
+KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb"
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
 KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
@@ -35,7 +35,7 @@ SRCREV = "04faa81d0573686847c8c74f4c67c8a69c13ce9f"
 PV = "3.11+3.12-rc4"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \


