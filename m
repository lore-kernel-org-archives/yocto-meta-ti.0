Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98DD6E00C8F; Thu, 14 Feb 2019 21:25:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50CB4E00C75
	for <meta-ti@yoctoproject.org>; Thu, 14 Feb 2019 21:25:56 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7412C40B94;
	Fri, 15 Feb 2019 05:25:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id oBCAajK0acMJ; Fri, 15 Feb 2019 05:25:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 58BB140A2D;
	Fri, 15 Feb 2019 05:25:54 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 33B0016AFC1;
	Fri, 15 Feb 2019 00:25:53 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 15 Feb 2019 00:25:51 -0500
Message-Id: <1550208352-5033-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/2] linux-ti-staging: update to the latest
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
X-List-Received-Date: Fri, 15 Feb 2019 05:25:57 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/ti33x.inc                   | 5 ++---
 recipes-kernel/linux/linux-ti-staging-rt_4.19.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.19.bb    | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 8fc6b59..ccbc942 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -26,9 +26,8 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 KERNEL_IMAGETYPE = "zImage"
 
-KERNEL_DEVICETREE = "am335x-evm.dtb am335x-evmsk.dtb \
-                    am335x-icev2.dtb \
-                    am335x-bone.dtb am335x-boneblue.dtb \
+KERNEL_DEVICETREE = "am335x-evm.dtb am335x-evmsk.dtb am335x-icev2.dtb \
+                    am335x-pocketbeagle.dtb am335x-bone.dtb am335x-boneblue.dtb \
                     am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
                     am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb"
 
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
index e6e4c1b..80ba8a7 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
 
 BRANCH = "ti-rt-linux-4.19.y"
 
-SRCREV = "54cdc562d6d233f43e5ffce60562d6fe110adf90"
+SRCREV = "dc9886fc8d12a9721b9ba198ee10d2c4720fba5e"
 PV = "4.19.15+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kernel/linux/linux-ti-staging_4.19.bb
index 97a96a4..f6412fe 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
@@ -56,11 +56,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-4.19.y"
 
-SRCREV = "efb32b0ef31152f612fcefae8f7511e88da957be"
+SRCREV = "5ff99d90f1ff549c2c17e9a146abd73696f94f80"
 PV = "4.19.15+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-- 
2.7.4


