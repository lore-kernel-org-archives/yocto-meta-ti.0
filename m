Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4177BE0083C; Wed, 14 Jan 2015 12:43:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D251E002F9
	for <meta-ti@yoctoproject.org>; Wed, 14 Jan 2015 12:43:38 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0EKhZPv020369
	for <meta-ti@yoctoproject.org>; Wed, 14 Jan 2015 14:43:35 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0EKhZRo025889
	for <meta-ti@yoctoproject.org>; Wed, 14 Jan 2015 14:43:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 14:43:35 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0EKhXqU011505;	Wed, 14 Jan 2015 14:43:34 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0EKhVLb012115;	Thu, 15 Jan 2015 02:13:32 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 14 Jan 2015 14:43:29 -0600
Message-ID: <1421268209-24159-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] sitara-linux-ti-staging: Create recipe for Sitara 3.14 kernel tree
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
X-List-Received-Date: Wed, 14 Jan 2015 20:43:46 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* The Sitara 3.14 Kernel tree is based on the linux-ti-staging_3.14 recipe and
  kernel. However, the tree includes additional patches and configs.
* This tree is only meant for AM335x and AM437x

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../linux/sitara-linux-ti-staging-3.14/defconfig   |    1 +
 ...ing_3.14.bb => sitara-linux-ti-staging_3.14.bb} |   23 ++++----------------
 2 files changed, 5 insertions(+), 19 deletions(-)
 create mode 100644 recipes-kernel/linux/sitara-linux-ti-staging-3.14/defconfig
 copy recipes-kernel/linux/{linux-ti-staging_3.14.bb => sitara-linux-ti-staging_3.14.bb} (58%)

diff --git a/recipes-kernel/linux/sitara-linux-ti-staging-3.14/defconfig b/recipes-kernel/linux/sitara-linux-ti-staging-3.14/defconfig
new file mode 100644
index 0000000..98c4069
--- /dev/null
+++ b/recipes-kernel/linux/sitara-linux-ti-staging-3.14/defconfig
@@ -0,0 +1 @@
+use-kernel-config=singlecore-omap2plus_defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
similarity index 58%
copy from recipes-kernel/linux/linux-ti-staging_3.14.bb
copy to recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
index d762be8..f9c4641 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
@@ -20,46 +20,31 @@ RDEPENDS_kernel-base += "kernel-devicetree"
 RDEPENDS_kernel-base_append_ti33x = " am33x-cm3"
 RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
 
-# Add a run-time dependency for the VPE VPDMA firmware to be installed
-# on the target file system.
-RDEPENDS_kernel-base_append_dra7xx = " vpe-vpdma-fw"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
 KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb"
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
-KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb dra7-evm-lcd7.dtb dra7-evm-lcd10.dtb dra72-evm.dtb dra72-evm-lcd7.dtb dra72-evm-lcd10.dtb am57xx-beagle-x15.dtb"
-KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb"
-KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
-KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
-KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
-KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap3"
+COMPATIBLE_MACHINE = "ti33x|ti43x"
 
 S = "${WORKDIR}/git"
 
-BRANCH = "ti-linux-3.14.y"
+BRANCH = "sitara-ti-linux-3.14.y"
 
-SRCREV = "7828f3b4cb26fa9c978aa96cc46cca8521957f24"
+SRCREV = "2d7148a3a95a2811604611f6c66a8826a61b8b12"
 PV = "3.14.26"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "f+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
-KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-
-KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${KERNEL_CONFIG_DIR}/am33xx_only.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${KERNEL_CONFIG_DIR}/am43xx_only.cfg"
-
 MULTI_CONFIG_BASE_SUFFIX = ""
 
-KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_URI = "git://git.ti.com/sitara-linux/sitara-linux.git"
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig \
-- 
1.7.9.5


