Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3A92E00571; Mon, 23 Jun 2014 09:02:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=RDNS_DYNAMIC, TO_NO_BRKTS_DYNIP
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FE5EE00507
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 09:02:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id F1F2C52A5D; Mon, 23 Jun 2014 16:02:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140623160200.F1F2C52A5D@arago-project.org>
Date: Mon, 23 Jun 2014 16:02:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-mainline: update to 3.14. 8 and enable legacy omap3 devices
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
X-List-Received-Date: Mon, 23 Jun 2014 16:02:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 727c29513252a3b8d1d48aef7f69580a9f377180
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=727c29513252a3b8d1d48aef7f69580a9f377180

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jun 20 00:38:31 2014 +0000

linux-mainline: update to 3.14.8 and enable legacy omap3 devices

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-mainline_3.14.bb |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/recipes-kernel/linux/linux-mainline_3.14.bb b/recipes-kernel/linux/linux-mainline_3.14.bb
index 559a79b..1e8473a 100644
--- a/recipes-kernel/linux/linux-mainline_3.14.bb
+++ b/recipes-kernel/linux/linux-mainline_3.14.bb
@@ -19,19 +19,23 @@ RDEPENDS_kernel-base_append_ti33x = " am33x-cm3"
 # for the specific beaglebone machine.
 KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
+KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
+KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
+KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
+KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-COMPATIBLE_MACHINE = "ti33x"
+COMPATIBLE_MACHINE = "ti33x|omap3"
 
 S = "${WORKDIR}/git"
 
 BRANCH = "master"
 
-# Corresponds to tag v3.14-rc8
-SRCREV = "b098d6726bbfb94c06d6e1097466187afddae61f"
-PV = "3.13+3.14rc8"
+# Corresponds to tag v3.14.8
+SRCREV = "0c5b3b80f7aeba9b8d25e12f7b321d148a1b1cb9"
+PV = "3.14.8"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
           "


