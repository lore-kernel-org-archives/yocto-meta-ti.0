Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C41CFE00E15; Mon,  5 Feb 2018 17:43:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE081E00DB7
	for <meta-ti@yoctoproject.org>; Mon,  5 Feb 2018 17:43:37 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AA7C120B05;
	Tue,  6 Feb 2018 01:43:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id EK3cuLmrkUiU; Tue,  6 Feb 2018 01:43:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7FC1D208FD;
	Tue,  6 Feb 2018 01:43:36 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 2F530163283;
	Mon,  5 Feb 2018 20:43:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon,  5 Feb 2018 20:43:35 -0500
Message-Id: <1517881415-17786-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] beaglebone: drop check for meta-yocto-bsp collision
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
X-List-Received-Date: Tue, 06 Feb 2018 01:43:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Now that meta-yocto-bsp renamed reference machine to beaglebone-yocto

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/beaglebone.conf        |  1 -
 conf/machine/include/beaglebone.inc | 12 ------------
 2 files changed, 13 deletions(-)
 delete mode 100644 conf/machine/include/beaglebone.inc

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 715d2f2..a73bf22 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board 
 
 require conf/machine/include/ti33x.inc
-require conf/machine/include/beaglebone.inc
 
 KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
 
diff --git a/conf/machine/include/beaglebone.inc b/conf/machine/include/beaglebone.inc
deleted file mode 100644
index b10146d..0000000
--- a/conf/machine/include/beaglebone.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-python () {
-    layers = d.getVar("BBFILE_COLLECTIONS", True)
-    if not layers:
-        return
-    if "yoctobsp" in layers:
-        bb.fatal("\nmeta-yocto-bsp has been detected in bblayers.conf, which provides basic reference BSP for beaglebone platform. " \
-                "\nSince meta-ti provides official comprehensive BSP for TI SoCs, including beaglebone, there could be potential conflicts " \
-                "\nbetween beaglebone machine definitions available in meta-yocto-bsp and meta-ti layers. It is recommended to remove " \
-                "\nor disable meta-yocto-bsp in bblayers.conf, when using meta-ti and building for beaglebone platform. Alternatively, " \
-                "\nit is possible to build for am335x-evm with meta-ti, which is a more generic platform for Sitara AM335x SoC and " \
-                "\nalso covers beaglebone variants.")
-}
-- 
2.7.4


