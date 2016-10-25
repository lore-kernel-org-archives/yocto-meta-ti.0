Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E7F9E00CC2; Tue, 25 Oct 2016 15:56:16 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2E47E00CC2
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 15:56:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A7A6752AD3; Tue, 25 Oct 2016 22:56:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161025225609.A7A6752AD3@arago-project.org>
Date: Tue, 25 Oct 2016 22:56:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 4.4.27 and ti2016. 05-rc1 tag
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
X-List-Received-Date: Tue, 25 Oct 2016 22:56:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1c6657c2be0d96ea91b93e20bf3d2da2bf8c69c2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1c6657c2be0d96ea91b93e20bf3d2da2bf8c69c2

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Oct 26 01:43:08 2016 +0000

linux-ti-staging: update to 4.4.27 and ti2016.05-rc1 tag

Also reorder and update DTB files for all platforms.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_4.4.bb    |   21 ++++++++++++---------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
index 40c5722..943e4f0 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
 
 BRANCH = "ti-rt-linux-4.4.y"
 
-SRCREV = "d124887cc93ce18aa3f0c39ed708a75a8f29d77e"
+SRCREV = "bb874e89d6d82f214c2828da512e44f2fe64db2e"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 1b4676a..51729ef 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -53,12 +53,15 @@ KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335
 KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb"
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb dra7-evm-lcd-osd101t2587.dtb dra72-evm.dtb dra72-evm-revc.dtb \
-                                dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd.dtb dra72-evm-lcd-osd101t2587.dtb dra72-evm-revc-lcd-osd101t2045.dtb \
-                                dra72-evm-revc-lcd-osd101t2587.dtb"
+KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb dra7-evm-lcd-osd101t2587.dtb \
+                                dra72-evm.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd.dtb dra72-evm-lcd-osd101t2587.dtb \
+                                dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb \
+                                dra71-evm.dtb dra71-evm-lcd-auo-g101evn01.0.dtb"
 KERNEL_DEVICETREE_dra7xx-hs-evm = "${KERNEL_DEVICETREE_dra7xx-evm}"
-KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-idk.dtb am572x-idk.dtb \
-                                am571x-idk-lcd-osd.dtb am572x-idk-lcd-osd.dtb am571x-idk-lcd-osd101t2587.dtb am572x-idk-lcd-osd101t2587.dtb"
+KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb \
+                                am57xx-evm.dtb am57xx-evm-reva3.dtb \
+                                am571x-idk.dtb am571x-idk-lcd-osd.dtb am571x-idk-lcd-osd101t2587.dtb \
+                                am572x-idk.dtb am572x-idk-lcd-osd.dtb am572x-idk-lcd-osd101t2587.dtb"
 KERNEL_DEVICETREE_am57xx-hs-evm = "${KERNEL_DEVICETREE_am57xx-evm}"
 KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
 KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
@@ -67,7 +70,7 @@ KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beag
 KERNEL_DEVICETREE_pandaboard = "omap4-panda.dtb omap4-panda-a4.dtb omap4-panda-es.dtb"
 KERNEL_DEVICETREE_k2hk-evm = "keystone-k2hk-evm.dtb"
 KERNEL_DEVICETREE_k2e = "keystone-k2e-evm.dtb"
-KERNEL_DEVICETREE_k2g = "keystone-k2g-evm.dtb"
+KERNEL_DEVICETREE_k2g = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb keystone-k2g-ice.dtb"
 KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap3|omap4|keystone"
@@ -76,11 +79,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.4.y"
 
-SRCREV = "4cd9d100e608a1fea838bad79c9c413b3e756d23"
-PV = "4.4.23+git${SRCPV}"
+SRCREV = "b379f92dff635b6bec915bffd6376425fb3bc0e8"
+PV = "4.4.27+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "e"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"


