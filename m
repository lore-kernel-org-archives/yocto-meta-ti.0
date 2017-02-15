Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 374E2E00839; Tue, 14 Feb 2017 22:32:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32EA7E007AD
	for <meta-ti@yoctoproject.org>; Tue, 14 Feb 2017 22:32:01 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8B7D420B8B;
	Wed, 15 Feb 2017 06:32:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fSoQPO9enurq; Wed, 15 Feb 2017 06:32:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6C107209B9;
	Wed, 15 Feb 2017 06:31:59 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8F8B8162374;
	Wed, 15 Feb 2017 01:31:58 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 15 Feb 2017 01:31:58 -0500
Message-Id: <1487140318-116037-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487140318-116037-1-git-send-email-denys@ti.com>
References: <1487140318-116037-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 2/2] conf/machine: add LCD-specific DTB entries for dra7/am57/k2g
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
X-List-Received-Date: Wed, 15 Feb 2017 06:32:05 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am57xx-evm.conf | 4 ++--
 conf/machine/dra7xx-evm.conf | 8 ++++----
 conf/machine/k2g-evm.conf    | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index ec63418..eef98f2 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -14,8 +14,8 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb \
                     am57xx-evm.dtb am57xx-evm-reva3.dtb \
-                    am571x-idk.dtb \
-                    am572x-idk.dtb"
+                    am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb \
+                    am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb"
 
 UBOOT_MACHINE = "am57xx_evm_config"
 
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 6049914..86d2dbf 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -12,10 +12,10 @@ SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
-KERNEL_DEVICETREE = "dra7-evm.dtb \
-                    dra72-evm.dtb \
-                    dra72-evm-revc.dtb \
-                    dra71-evm.dtb"
+KERNEL_DEVICETREE = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd101t2045.dtb dra7-evm-lcd-osd101t2587.dtb \
+                    dra72-evm.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
+                    dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb \
+                    dra71-evm.dtb dra71-evm-lcd-auo-g101evn01.0.dtb"
 
 UBOOT_MACHINE = "dra7xx_evm_config"
 
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index b8e55e4..d7bf609 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/k2g.inc
 
 MACHINE_FEATURES += "alsa opencl"
 
-KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-ice.dtb"
+KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb keystone-k2g-ice.dtb"
 
 UBOOT_MACHINE = "k2g_evm_config"
 
-- 
2.7.4


