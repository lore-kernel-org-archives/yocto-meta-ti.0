Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65224E00DFB; Fri,  2 Aug 2019 09:19:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 413 seconds by postgrey-1.32 at yocto-www;
	Fri, 02 Aug 2019 09:19:02 PDT
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E472E00DFB
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 09:19:01 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5968B40BDC;
	Fri,  2 Aug 2019 16:12:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id F4-h5bIzsRzq; Fri,  2 Aug 2019 16:12:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3FD5840BC4;
	Fri,  2 Aug 2019 16:12:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 791C717155E;
	Fri,  2 Aug 2019 12:12:07 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri,  2 Aug 2019 12:12:07 -0400
Message-Id: <1564762327-46237-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] linux-ti-staging: update to 4.19.59, drop k3-j721e-dp0.dtbo
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
X-List-Received-Date: Fri, 02 Aug 2019 16:19:03 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/j7-evm.conf                         | 1 -
 recipes-kernel/linux/linux-ti-staging-rt_4.19.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_4.19.bb    | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 55d7d61..17d48d0 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -11,7 +11,6 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
-    ti/k3-j721e-dp0.dtbo \
     ti/k3-j721e-common-proc-board-infotainment.dtbo \
     ti/k3-j721e-common-proc-board-infotainment-display-sharing.dtbo \
     ti/k3-j721e-common-proc-board-jailhouse.dtbo \
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
index 0591924..6a614e5 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
 
 BRANCH = "ti-rt-linux-4.19.y"
 
-SRCREV = "7e13ea97dd88e93b41660737d226004b9439bbd2"
-PV = "4.19.50+git${SRCPV}"
+SRCREV = "57d7f0b3d0bcd0b9a2f579010b6ece87dc43cd8b"
+PV = "4.19.59+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kernel/linux/linux-ti-staging_4.19.bb
index 16def5d..6e9b8d8 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
@@ -59,11 +59,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-4.19.y"
 
-SRCREV = "e56692e9c3c5de4ab094003454449a19503a8c32"
-PV = "4.19.50+git${SRCPV}"
+SRCREV = "b6ad90b0801b8828648682a75f84be83fb9fab06"
+PV = "4.19.59+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-- 
2.7.4


