Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364E9EEE254
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 20:07:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.57671.1726171673064285622
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Sep 2024 13:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=S7QiLsH5;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48CK7pVA027719;
	Thu, 12 Sep 2024 15:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726171671;
	bh=Rusf61kRXNp2/aczUNdNUGfmEWLvfhCwla9QDWuUUvU=;
	h=From:To:Subject:Date;
	b=S7QiLsH5q4GIb9TWeZOjV3N7vz3qO39hqKf2sthAfjZwehSZqu32IJTyMjgtTzJ+D
	 5vnMQLkFYwIp0zgeSRFAV/UAMjb3yjXj+OmQBkT+KUOKcfhcxZTOID1YuXX10mhk/4
	 IyqJGyIU9pjzLhUAGIYXEgv9GnqbhPe3Y823qJRs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48CK7pI5074945
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Sep 2024 15:07:51 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Sep 2024 15:07:51 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Sep 2024 15:07:51 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48CK7pnu049419;
	Thu, 12 Sep 2024 15:07:51 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1soq6Z-00036u-8Q; Thu, 12 Sep 2024 15:07:51 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2] conf: machine: Remove multiconfig compulsion for k3 platforms
Date: Thu, 12 Sep 2024 15:07:51 -0500
Message-ID: <20240912200751.11917-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Sep 2024 20:07:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17963

From: Chirag Shilwant <c-shilwant@ti.com>

- While implementing k3.inc, there was an assumption that all
k3 based TI SOC's would always have a Cortex-R5F core [1]. This
assumption is not true.

- Hence, create a new mc_k3r5 include file & move the multiconfig
dependencies to it. Also, include this file only in those k3 platforms
which needs the R5 multiconfig support.

[1]: https://git.ti.com/cgit/arago-project/meta-ti/commit/conf/machine/include/k3.inc?h=scarthgap&id=f814840465358a6b5429ad20165742ac6e6e6a29

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add meta-ti-bsp/conf/machine/beagleplay.conf to the list of files
    that need the new requires.

 meta-ti-bsp/conf/machine/beagleplay.conf     | 2 ++
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
 16 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/mc_k3r5.inc

diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
index d420c6c7..c5ce3902 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -3,6 +3,8 @@
 #@DESCRIPTION: Machine configuration for the BeaglePlay board (A53 core)
 
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":am62xx"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
index 93a41d8d..98cea203 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":am62axx"
 
 MACHINE_FEATURES += "screen touchscreen"
diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
index a2825905..2c6a729a 100644
--- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":am62pxx"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index 070a691b..1eb77b4e 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":am62xx"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 56b6df78..7f388953 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":am64xx"
 
 KERNEL_DEVICETREE_PREFIX = "ti/k3-am642"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 46513141..803e369c 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":am65xx"
 
 MACHINE_FEATURES += "screen touchscreen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/am68.inc b/meta-ti-bsp/conf/machine/include/am68.inc
index 327366be..330a2973 100644
--- a/meta-ti-bsp/conf/machine/include/am68.inc
+++ b/meta-ti-bsp/conf/machine/include/am68.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j721s2"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
index 488f9c33..da8a5a8b 100644
--- a/meta-ti-bsp/conf/machine/include/am69.inc
+++ b/meta-ti-bsp/conf/machine/include/am69.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j784s4"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
index 2a11e3dd..b60b98e1 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j7200"
 
 # Default tiboot3.bin on J7200 is for GP
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 62487aa9..1507234b 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j721e"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
index 9cd88d9b..e6e4f162 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j721s2"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
index ef35d83a..e0b77d96 100644
--- a/meta-ti-bsp/conf/machine/include/j722s.inc
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j722s"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc b/meta-ti-bsp/conf/machine/include/j742s2.inc
index aad7a768..9a54e11e 100644
--- a/meta-ti-bsp/conf/machine/include/j742s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j742s2"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index 883c4a6e..fd3990a6 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
+require conf/machine/include/mc_k3r5.inc
+
 SOC_FAMILY:append = ":j784s4"
 
 MACHINE_FEATURES += "screen gpu"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 34991ec9..a296f64f 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -5,8 +5,6 @@ SOC_FAMILY:append = ":k3"
 
 require conf/machine/include/arm/arch-arm64.inc
 
-BBMULTICONFIG += "k3r5"
-
 require conf/machine/include/ti-bsp.inc
 
 KERNEL_IMAGETYPE = "Image"
@@ -57,6 +55,5 @@ MACHINE_FEATURES += "efi"
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
2.17.1


