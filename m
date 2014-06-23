Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 047BDE005A2; Mon, 23 Jun 2014 09:02:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 726D4E00572
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 09:02:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4E86852A99; Mon, 23 Jun 2014 16:02:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140623160201.4E86852A99@arago-project.org>
Date: Mon, 23 Jun 2014 16:02:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: add device trees for legacy omap3 devices
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
X-List-Received-Date: Mon, 23 Jun 2014 16:02:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: dbdb539e249c3b55ca3dc601c357634a0dbc909e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=dbdb539e249c3b55ca3dc601c357634a0dbc909e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Jun 21 03:11:29 2014 +0000

linux-ti-staging: add device trees for legacy omap3 devices

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.14.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index a3045b2..32c6f5a 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -30,10 +30,14 @@ KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb"
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
 KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
+KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
+KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
+KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
+KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap3"
 
 S = "${WORKDIR}/git"
 


