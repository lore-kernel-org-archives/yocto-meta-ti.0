Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.518.1584466505485534171
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2020 10:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CA1CB40C0A;
	Tue, 17 Mar 2020 17:35:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aAixN9KY4JID; Tue, 17 Mar 2020 17:35:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8A37440A41;
	Tue, 17 Mar 2020 17:35:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A2B8A16D1D2;
	Tue, 17 Mar 2020 13:35:00 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH] am57xx-evm,dra7xx-evm: re-add flattened DTBs for cam and lcd modules
Date: Tue, 17 Mar 2020 13:35:00 -0400
Message-Id: <1584466500-1419-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am57xx-evm.conf | 11 ++++++++++-
 conf/machine/dra7xx-evm.conf | 14 +++++++++++---
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 2e39a08..3b0c18a 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -9,13 +9,22 @@ MACHINE_FEATURES += "touchscreen"
 SERIAL_CONSOLES = "115200;ttyS2"
 
 KERNEL_DEVICETREE = " \
-    am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb \
+    am57xx-beagle-x15.dtb \
+    am57xx-beagle-x15-revb1.dtb \
+    am57xx-beagle-x15-revc.dtb \
     am5729-beagleboneai.dtb \
     am57xx-evm.dtb \
+    am57xx-evm-cam-ov10635.dtb \
     am57xx-evm-reva3.dtb \
+    am57xx-evm-reva3-cam-ov10635.dtb \
     am571x-idk.dtb \
+    am571x-idk-lcd-osd101t2045.dtb \
+    am571x-idk-lcd-osd101t2587.dtb \
     am572x-idk.dtb \
+    am572x-idk-lcd-osd101t2045.dtb \
+    am572x-idk-lcd-osd101t2587.dtb \
     am574x-idk.dtb \
+    am574x-idk-lcd-osd101t2587.dtb \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 67ce99c..67f9a0d 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -9,12 +9,20 @@ MACHINE_FEATURES += "touchscreen"
 SERIAL_CONSOLES = "115200;ttyS0"
 
 KERNEL_DEVICETREE = " \
-    dra7-evm.dtb  \
+    dra7-evm.dtb \
+    dra7-evm-lcd-osd101t2045.dtb \
+    dra7-evm-lcd-osd101t2587.dtb \
     dra71-evm.dtb \
     dra71-evm-nand.dtb \
-    dra72-evm.dtb  \
-    dra72-evm-revc.dtb  \
+    dra71-evm-lcd-auo-g101evn01.0.dtb \
+    dra72-evm.dtb \
+    dra72-evm-lcd-osd101t2045.dtb \
+    dra72-evm-lcd-osd101t2587.dtb \
+    dra72-evm-revc.dtb \
+    dra72-evm-revc-lcd-osd101t2045.dtb \
+    dra72-evm-revc-lcd-osd101t2587.dtb \
     dra76-evm.dtb \
+    dra76-evm-tfp410.dtb \
 "
 
 UBOOT_MACHINE = "dra7xx_evm_config"
-- 
2.7.4

