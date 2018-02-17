Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6A72E01064; Fri, 16 Feb 2018 17:02:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A352E00F84
	for <meta-ti@yoctoproject.org>; Fri, 16 Feb 2018 17:02:12 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B092C20A8A;
	Sat, 17 Feb 2018 01:02:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DcS6BhxZlYQX; Sat, 17 Feb 2018 01:02:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8CEE320862;
	Sat, 17 Feb 2018 01:02:10 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E7E62163296;
	Fri, 16 Feb 2018 20:02:09 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 16 Feb 2018 20:02:09 -0500
Message-Id: <1518829329-18311-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] linux-ti-staging, am57xx-evm.conf: udpate to the latest, add support for .itb
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
X-List-Received-Date: Sat, 17 Feb 2018 01:02:13 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am57xx-evm.conf                     | 2 +-
 recipes-kernel/linux/linux-ti-staging-rt_4.14.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.14.bb    | 6 ++++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 7724be3..3419b39 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -11,7 +11,7 @@ IMAGE_FSTYPES += "tar.xz"
 SERIAL_CONSOLE = "115200 ttyS2"
 
 KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb \
-                    ti/am57xx-evm.dtbo ti/mt9t111.dtbo ti/ov10635.dtbo \
+                    ti/am57xx-evm.dtbo ti/mt9t111.dtbo ti/ov10635.dtbo ti/am57xx-evm.itb \
                     am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb \
                     am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb \
                     am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb \
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
index 802a8b1..b9dcbdc 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
 
 BRANCH = "ti-rt-linux-4.14.y"
 
-SRCREV = "92c3e398509d57ea7ad40ac87aa5b7ed5e5014e2"
+SRCREV = "13c0583ddb2c981891bd2413fa1e300ff56cb6bf"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bb b/recipes-kernel/linux/linux-ti-staging_4.14.bb
index 613fb58..7bb5c62 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.14.bb
@@ -54,8 +54,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.14.y"
 
-SRCREV = "36a950c35adcec9c55c20ef1deb5e33c87ae0a3f"
-PV = "4.14.19+git${SRCPV}"
+SRCREV = "ceefd552693f88d40d447fdb5ac5c42104cd2632"
+PV = "4.14.20+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
@@ -65,3 +65,5 @@ KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig"
+
+FILES_kernel-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
-- 
2.7.4


