Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF88CE7B1B
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 13:58:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.35695.1725631121933012050
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Sep 2024 06:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tn26Dvas;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 486DwcmL064279;
	Fri, 6 Sep 2024 08:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725631118;
	bh=tthzUKIqIy+3QZpjuOYHwOKD/+Y/1DWvRCmPviuQRVE=;
	h=From:To:CC:Subject:Date;
	b=tn26DvassKyy4RGeuomurVjkuaZwKxFvlXrzaoleoZa43l2/9kW8JINjg0NFT7rRF
	 TYN5BkkMu/cL+6PHPSI5y3KGjCUNS1A/UniWUR6l5V/y1N07em5KyPD1jxmdZWt6/y
	 mWcQZvrb6DPHvm9JavLuhu02YjNCWC4Qgm7ndCO8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 486DwcCa034111
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Sep 2024 08:58:38 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Sep 2024 08:58:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Sep 2024 08:58:37 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 486DwaIF086855;
	Fri, 6 Sep 2024 08:58:37 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Gyan Gupta
	<g-gupta@ti.com>, Vignesh <vigneshr@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: Remove multiconfig compulsion for k3 platforms
Date: Fri, 6 Sep 2024 19:28:26 +0530
Message-ID: <20240906135826.402206-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Sep 2024 13:58:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17959

- While implementing k3.inc, there was an assumption that all
k3 based TI SOC's would always have a Cortex-R5F core [1]. This
assumption is not true.

- Hence, create a new mc_k3r5 include file & move the multiconfig
dependencies to it. Also, include this file only in those k3 platforms
which needs the R5 multiconfig support.

[1]: https://git.ti.com/cgit/arago-project/meta-ti/commit/conf/machine/include/k3.inc?h=scarthgap&id=f814840465358a6b5429ad20165742ac6e6e6a29

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62axx.inc | 2 ++
 meta-ti-bsp/conf/machine/include/am62pxx.inc | 2 ++
 meta-ti-bsp/conf/machine/include/am62xx.inc  | 2 ++
 meta-ti-bsp/conf/machine/include/am64xx.inc  | 2 ++
 meta-ti-bsp/conf/machine/include/am65xx.inc  | 2 ++
 meta-ti-bsp/conf/machine/include/am68.inc    | 2 ++
 meta-ti-bsp/conf/machine/include/am69.inc    | 2 ++
 meta-ti-bsp/conf/machine/include/j7200.inc   | 2 ++
 meta-ti-bsp/conf/machine/include/j721e.inc   | 2 ++
 meta-ti-bsp/conf/machine/include/j721s2.inc  | 2 ++
 meta-ti-bsp/conf/machine/include/j722s.inc   | 2 ++
 meta-ti-bsp/conf/machine/include/j742s2.inc  | 2 ++
 meta-ti-bsp/conf/machine/include/j784s4.inc  | 2 ++
 meta-ti-bsp/conf/machine/include/k3.inc      | 3 ---
 meta-ti-bsp/conf/machine/include/mc_k3r5.inc | 3 +++
 15 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/mc_k3r5.inc

diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
index 8268a956..0d7a0602 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":am62axx"
 
 MACHINE_FEATURES += "screen touchscreen"
diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
index cc9a2c01..e88f1bc1 100644
--- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":am62pxx"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index 21b6d1ec..e1669e28 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":am62xx"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 95529a83..4802e796 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":am64xx"
 
 KERNEL_DEVICETREE_PREFIX = "ti/k3-am642"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 485dcc54..6ff4886b 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":am65xx"
 
 MACHINE_FEATURES += "screen touchscreen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/am68.inc b/meta-ti-bsp/conf/machine/include/am68.inc
index a7ccea79..42d20109 100644
--- a/meta-ti-bsp/conf/machine/include/am68.inc
+++ b/meta-ti-bsp/conf/machine/include/am68.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j721s2"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
index d18cf740..0faeb07e 100644
--- a/meta-ti-bsp/conf/machine/include/am69.inc
+++ b/meta-ti-bsp/conf/machine/include/am69.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j784s4"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
index bee2345f..511c7ba2 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j7200"
 
 # Default tiboot3.bin on J7200 is for GP
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 29e50023..6c58c3c7 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j721e"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
index 5ebb4a16..189b0dc3 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j721s2"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
index 42f50feb..4e92731f 100644
--- a/meta-ti-bsp/conf/machine/include/j722s.inc
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j722s"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc b/meta-ti-bsp/conf/machine/include/j742s2.inc
index 7c248310..ef39f4f2 100644
--- a/meta-ti-bsp/conf/machine/include/j742s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j742s2"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index 6fb26bbc..ca1aca56 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j784s4"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 2e5ffe09..de4be550 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -5,8 +5,6 @@ SOC_FAMILY:append = ":k3"
 
 require conf/machine/include/arm/arch-arm64.inc
 
-BBMULTICONFIG += "k3r5"
-
 require conf/machine/include/ti-bsp.inc
 
 KERNEL_IMAGETYPE = "Image"
@@ -60,6 +58,5 @@ MACHINE_FEATURES += "efi"
 WKS_FILE ?= "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.wks.in", "sdimage-2part.wks", d)}"
 
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
-do_image[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
 
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
diff --git a/meta-ti-bsp/conf/machine/include/mc_k3r5.inc b/meta-ti-bsp/conf/machine/include/mc_k3r5.inc
new file mode 100644
index 00000000..d5a530b8
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/mc_k3r5.inc
@@ -0,0 +1,3 @@
+BBMULTICONFIG += "k3r5"
+
+do_image[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
-- 
2.34.1


