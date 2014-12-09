Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03FF8E0093F; Tue,  9 Dec 2014 09:15:03 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 936A5E0082F
	for <meta-ti@yoctoproject.org>; Tue,  9 Dec 2014 09:14:57 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0B7F8529DD; Tue,  9 Dec 2014 17:14:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141209171456.0B7F8529DD@arago-project.org>
Date: Tue,  9 Dec 2014 17:14:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 3.14.26, add new DTBs, sort configs
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
X-List-Received-Date: Tue, 09 Dec 2014 17:15:03 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 977e53ebc9dfbbbdc154d771ceb9ce39bed7775a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=977e53ebc9dfbbbdc154d771ceb9ce39bed7775a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Dec  9 08:30:26 2014 +0000

linux-ti-staging: update to 3.14.26, add new DTBs, sort configs

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.14.bb |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index fa64840..9172268 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -26,10 +26,10 @@ RDEPENDS_kernel-base_append_dra7xx = " vpe-vpdma-fw"
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
 KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
-KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-sk-evm.dtb"
+KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb"
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb dra72-evm.dtb am57xx-beagle-x15.dtb"
+KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb dra7-evm-lcd7.dtb dra7-evm-lcd10.dtb dra72-evm.dtb dra72-evm-lcd7.dtb dra72-evm-lcd10.dtb am57xx-beagle-x15.dtb"
 KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb"
 KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
 KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
@@ -44,17 +44,18 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "5dcfe16d0585aeed7158820e934a5e43ff017476"
-PV = "3.14.25"
+SRCREV = "6564a16c2f4f6c1cb141169a51c31f8b81eb18a8"
+PV = "3.14.26"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-KERNEL_CONFIG_FRAGMENTS = "${KERNEL_CONFIG_DIR}/audio_display.cfg ${KERNEL_CONFIG_DIR}/baseport.cfg \
-                           ${KERNEL_CONFIG_DIR}/connectivity.cfg ${KERNEL_CONFIG_DIR}/ipc.cfg \
-                           ${KERNEL_CONFIG_DIR}/power.cfg ${KERNEL_CONFIG_DIR}/wlan.cfg"
+KERNEL_CONFIG_FRAGMENTS = "${KERNEL_CONFIG_DIR}/baseport.cfg ${KERNEL_CONFIG_DIR}/all_valid_socs.cfg \
+                           ${KERNEL_CONFIG_DIR}/power.cfg ${KERNEL_CONFIG_DIR}/connectivity.cfg \
+                           ${KERNEL_CONFIG_DIR}/ipc.cfg ${KERNEL_CONFIG_DIR}/audio_display.cfg \
+                           ${KERNEL_CONFIG_DIR}/wlan.cfg"
 
 KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${KERNEL_CONFIG_DIR}/am33xx_only.cfg"
 KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${KERNEL_CONFIG_DIR}/am43xx_only.cfg"


