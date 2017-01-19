Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D8F9E004D2; Wed, 18 Jan 2017 16:34:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 595 seconds by postgrey-1.32 at yocto-www;
	Wed, 18 Jan 2017 16:34:18 PST
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F67EE0033D
	for <meta-ti@yoctoproject.org>; Wed, 18 Jan 2017 16:34:18 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8BF9D20AAE;
	Thu, 19 Jan 2017 00:24:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bwc_Fo-xYVEx; Thu, 19 Jan 2017 00:24:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6D3302078F;
	Thu, 19 Jan 2017 00:24:21 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id E08D116231C;
	Wed, 18 Jan 2017 19:24:20 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 18 Jan 2017 19:24:20 -0500
Message-Id: <1484785460-27610-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master/morty][PATCH] beaglebone: add check for potential conflicts with meta-yocto-bsp
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
X-List-Received-Date: Thu, 19 Jan 2017 00:34:21 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/beaglebone.conf        |  1 +
 conf/machine/include/beaglebone.inc | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 conf/machine/include/beaglebone.inc

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index bf3d91e..e168560 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board 
 
 require conf/machine/include/ti33x.inc
+require conf/machine/include/beaglebone.inc
 
 # Only has DVI connector for external screen
 MACHINE_GUI_CLASS = "bigscreen"
diff --git a/conf/machine/include/beaglebone.inc b/conf/machine/include/beaglebone.inc
new file mode 100644
index 0000000..f76ad3d
--- /dev/null
+++ b/conf/machine/include/beaglebone.inc
@@ -0,0 +1,12 @@
+python () {
+    layers = bb.data.getVar("BBFILE_COLLECTIONS", d, 1)
+    if not layers:
+        return
+    if "yoctobsp" in layers:
+        bb.fatal("\nmeta-yocto-bsp has been detected in bblayers.conf, which provides basic reference BSP for beaglebone platform. " \
+                "\nSince meta-ti provides official comprehensive BSP for TI SoCs, including beaglebone, there could be potential conflicts " \
+                "\nbetween beaglebone machine definitions available in meta-yocto-bsp and meta-ti layers. It is recommended to remove " \
+                "\nor disable meta-yocto-bsp in bblayers.conf, when using meta-ti and building for beaglebone platform. Alternatively, " \
+                "\nit is possible to build for am335x-evm with meta-ti, which is a more generic platform for Sitara AM335x SoC and " \
+                "\nalso covers beaglebone variants.")
+}
-- 
2.7.4


