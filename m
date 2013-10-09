Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BD18E011C5
	for <meta-ti@yoctoproject.org>; Wed,  9 Oct 2013 10:30:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CDC6752A94; Wed,  9 Oct 2013 17:29:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131009172959.CDC6752A94@arago-project.org>
Date: Wed,  9 Oct 2013 17:29:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: merged PM, platform & connectivity, install boneblack DTB
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
X-List-Received-Date: Wed, 09 Oct 2013 17:30:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: db99578a19e911b646ef4b802715234fe32c25de
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=db99578a19e911b646ef4b802715234fe32c25de

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Oct  8 17:43:35 2013 -0400

linux-ti-staging: merged PM, platform & connectivity, install boneblack DTB

* The PM for TI parts was merged in
* Platform and connectivity got updated
* Since we now have separate DTB for BeagleBone Black, install it too

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 44b0b83..ce7c810 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -17,9 +17,9 @@ RDEPENDS_kernel-base_append_ti33x = " am33x-cm3 am33x-cm3-initscript"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
-KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb"
+KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_am437x-evm = "am43x-epos-evm.dtb"
-KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb"
+KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
 KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
 
@@ -31,11 +31,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "cfb43bb45e51e2cbff47d62fa348de6a30147f41"
+SRCREV = "04faa81d0573686847c8c74f4c67c8a69c13ce9f"
 PV = "3.11+3.12-rc4"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \


