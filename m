Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E595E009EB; Thu,  4 Jun 2015 13:00:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03FACE0098D
	for <meta-ti@yoctoproject.org>; Thu,  4 Jun 2015 13:00:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CA754529F8; Thu,  4 Jun 2015 20:00:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150604200027.CA754529F8@arago-project.org>
Date: Thu,  4 Jun 2015 20:00:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : linux-ti-staging: Fix dra7 DTBs appearing in am57xx-evm build.
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
X-List-Received-Date: Thu, 04 Jun 2015 20:00:34 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: e237189ada319149a1a51b492d38299374f56e73
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e237189ada319149a1a51b492d38299374f56e73

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri Jun  5 00:33:23 2015 +0000

linux-ti-staging: Fix dra7 DTBs appearing in am57xx-evm build.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.14.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 51127f4..88fa093 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -31,7 +31,7 @@ KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335
 KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb"
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb dra7-evm-lcd10.dtb dra72-evm.dtb dra72-evm-lcd10.dtb am57xx-beagle-x15.dtb am57xx-evm.dtb"
+KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd10.dtb dra72-evm.dtb dra72-evm-lcd10.dtb"
 KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-evm.dtb"
 KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
 KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
@@ -50,7 +50,7 @@ SRCREV = "d4d72d56fdc67603633f0168073713180934dbc0"
 PV = "3.14.43+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "e"
+MACHINE_KERNEL_PR_append = "f"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


