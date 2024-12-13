Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DC5E7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 15:59:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.19220.1734105554568030504
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 07:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=syFZGxI5;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BDFxDMA064248;
	Fri, 13 Dec 2024 09:59:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734105553;
	bh=FUWMgxASey1KEva+YaKlXnoE/Y3WNWCKE4lvIRvzvE4=;
	h=From:To:CC:Subject:Date;
	b=syFZGxI5Xcv8hABA+ur8h4Jee4ZXZ60vLw35b1K4KFLjNqz/vrLATe57zq6AB7Dan
	 uhfJeSLrKvXALYsII+CazcnQNnbcbcQZ3B+eZEZt1WhfxczPwoPtRekUvk/X4xhW1M
	 B60bSGfXqdGasTrAsROe9xufRxlL1tAn9wEZSBQc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BDFxDnP012115
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Dec 2024 09:59:13 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Dec 2024 09:59:13 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Dec 2024 09:59:13 -0600
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BDFxDGp034745;
	Fri, 13 Dec 2024 09:59:13 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH] wl18xx-fw: Do not depend on the makefile for install
Date: Fri, 13 Dec 2024 09:59:13 -0600
Message-ID: <20241213155913.57747-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Dec 2024 15:59:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18104

We use the makefile shipped with the firmware to deploy the firmware
instead of just manually moving it in the install step. But the makefile
doesn't do the right thing, so we also modify the makefile. Skip all
this and just move the firmware ourselves.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...d-Makefile-to-install-firmware-files.patch | 31 -------------------
 .../wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb         | 12 ++-----
 2 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch

diff --git a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
deleted file mode 100644
index bb05c6fe..00000000
--- a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3a8fc3ccf00796254d6cef4b6d4cd70dc37012e1 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Fri, 10 Mar 2017 13:28:29 -0500
-Subject: [PATCH] Add Makefile to install firmware files
-
-Upstream-Status: Pending
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- Makefile | 9 +++++++++
- 1 file changed, 9 insertions(+)
- create mode 100644 Makefile
-
-diff --git a/Makefile b/Makefile
-new file mode 100644
-index 0000000..1cf38e3
---- /dev/null
-+++ b/Makefile
-@@ -0,0 +1,9 @@
-+# Installs the the ti-connectivity wlan firmware files into the root file system
-+
-+install:
-+	@if [ ! -d $(DESTDIR) ] ; then \
-+		echo "Target filesystem directory doesn't exist."; \
-+		exit 1; \
-+	fi
-+	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
-+	cp *.bin $(DEST_DIR)/lib/firmware/ti-connectivity/
--- 
-2.7.4
-
diff --git a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
index dbae5a21..954330bf 100644
--- a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
+++ b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
@@ -2,10 +2,7 @@ DESCRIPTION = "Firmware files for use with TI wl18xx"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
 
-SRC_URI = " \
-	git://git.ti.com/git/wilink8-wlan/wl18xx_fw.git;protocol=https;branch=${BRANCH} \
-	file://0001-Add-Makefile-to-install-firmware-files.patch \
-"
+SRC_URI = "git://git.ti.com/git/wilink8-wlan/wl18xx_fw.git;protocol=https;branch=${BRANCH}"
 
 SRCREV = "5ec05007f2662f460f881c5868311fd3ab7e6e71"
 BRANCH = "master"
@@ -19,11 +16,8 @@ do_compile() {
 }
 
 do_install() {
-    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
-        oe_runmake 'DEST_DIR=${D}/usr' install
-    else
-        oe_runmake 'DEST_DIR=${D}' install
-    fi
+    install -d ${D}${nonarch_base_libdir}/firmware/ti-connectivity
+    install -m 0644 ${S}/*.bin ${D}${nonarch_base_libdir}/firmware/ti-connectivity/
 }
 
 FILES:${PN} = "${nonarch_base_libdir}/firmware/ti-connectivity/*"
-- 
2.39.2


