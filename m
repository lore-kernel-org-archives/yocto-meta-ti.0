Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DFEAE009A3; Mon, 20 Apr 2015 13:49:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A72D6E00932
	for <meta-ti@yoctoproject.org>; Mon, 20 Apr 2015 13:49:50 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7D7D752A86; Mon, 20 Apr 2015 20:49:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150420204950.7D7D752A86@arago-project.org>
Date: Mon, 20 Apr 2015 20:49:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 3.14.39 plus fixes
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
X-List-Received-Date: Mon, 20 Apr 2015 20:49:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: aeab3c18253f7632811449c14213244aacac81e1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=aeab3c18253f7632811449c14213244aacac81e1

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Apr 21 02:48:11 2015 +0000

linux-ti-staging: update to 3.14.39 plus fixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.14.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 5cf49a8..061faed 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -30,7 +30,7 @@ KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335
 KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb"
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb dra7-evm-lcd7.dtb dra7-evm-lcd10.dtb dra72-evm.dtb dra72-evm-lcd7.dtb dra72-evm-lcd10.dtb am57xx-beagle-x15.dtb am57xx-evm.dtb"
+KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb dra7-evm-lcd10.dtb dra72-evm.dtb dra72-evm-lcd10.dtb am57xx-beagle-x15.dtb am57xx-evm.dtb"
 KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-evm.dtb"
 KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
 KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
@@ -45,11 +45,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "b60f54ead75d08d6e9729f269a8357001d459c30"
-PV = "3.14.35"
+SRCREV = "5e342e186fcd9834fff09f6335b344599042be88"
+PV = "3.14.39"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "e+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


