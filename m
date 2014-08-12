Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68607E0078E; Mon, 11 Aug 2014 17:47:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25C76E004F2
	for <meta-ti@yoctoproject.org>; Mon, 11 Aug 2014 17:47:25 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7C0lOvj009026
	for <meta-ti@yoctoproject.org>; Mon, 11 Aug 2014 19:47:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7C0lOgh024846
	for <meta-ti@yoctoproject.org>; Mon, 11 Aug 2014 19:47:24 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 11 Aug 2014 19:47:24 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7C0lNeL024607;	Mon, 11 Aug 2014 19:47:24 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7C0lLxO028165;	Tue, 12 Aug 2014 06:17:22 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 11 Aug 2014 19:47:19 -0500
Message-ID: <1407804439-24568-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] linux-ti-staging: Updated staging tree commit. Pull in am57x evm support
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
X-List-Received-Date: Tue, 12 Aug 2014 00:47:36 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Update the commit of the 3.14 staging tree.
* Add support for accelerated cryptos on am335x/am437x.
* Adds HDMI audio support for Beaglebone Black
* Brings in am57x evm support.
* This also updates the base kernel to 3.14.16.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.14.bb |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 6088bee..37e6259 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -29,7 +29,8 @@ KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335
 KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb"
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb"
+KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb am57xx-beagle-x15.dtb"
+KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb"
 KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
 KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
 KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
@@ -43,8 +44,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "780f0589876618911eb9cd7ad5a83db249ad1638"
-PV = "3.14.15"
+SRCREV = "8f69b4c2243fb3b0d85fd2a0b575d5170d53dbea"
+PV = "3.14.16"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
-- 
1.7.9.5


