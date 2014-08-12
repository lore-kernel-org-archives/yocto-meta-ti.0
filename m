Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66305E0078E; Mon, 11 Aug 2014 17:52:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5EEBCE004F2
	for <meta-ti@yoctoproject.org>; Mon, 11 Aug 2014 17:52:44 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NA6003PR5368S80@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 11 Aug 2014 19:52:18 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3073720015; Mon,
	11 Aug 2014 20:52:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 11 Aug 2014 20:52:16 -0400
Message-id: <1407804736-15279-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] linux-ti-staging: update to 3.14.16 with am57xx and other updates
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
X-List-Received-Date: Tue, 12 Aug 2014 00:52:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Add am57xx-beagle-x15.dtb to the list of installed dra7xx DTB files.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.14.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 6088bee..b53fd30 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -29,7 +29,7 @@ KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335
 KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb"
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb"
+KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb am57xx-beagle-x15.dtb"
 KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
 KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
 KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
@@ -43,8 +43,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "780f0589876618911eb9cd7ad5a83db249ad1638"
-PV = "3.14.15"
+SRCREV = "8f69b4c2243fb3b0d85fd2a0b575d5170d53dbea"
+PV = "3.14.16"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
-- 
2.0.4


