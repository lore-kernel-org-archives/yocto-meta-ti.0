Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1063.1580431623874211404
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jan 2020 16:47:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 86F20E015BD; Thu, 30 Jan 2020 16:47:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F1F5E00782
	for <meta-ti@yoctoproject.org>; Thu, 30 Jan 2020 16:47:01 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6421C40C51;
	Fri, 31 Jan 2020 00:47:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FAo-aHVxuyvG; Fri, 31 Jan 2020 00:47:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4BBBE40C31;
	Fri, 31 Jan 2020 00:47:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 17A7A170F48;
	Thu, 30 Jan 2020 19:46:59 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH 1/3] dra7xx-evm: remove unavailable Cam/LCD-related DTBs
Date: Thu, 30 Jan 2020 19:46:56 -0500
Message-Id: <1580431618-21012-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

* dra7-evm-lcd-osd101t2045.dtb
* dra7-evm-lcd-osd101t2587.dtb
* dra71-evm-lcd-auo-g101evn01.0.dtb
* dra72-evm-lcd-osd101t2045.dtb
* dra72-evm-lcd-osd101t2587.dtb
* dra72-evm-revc-lcd-osd101t2045.dtb
* dra72-evm-revc-lcd-osd101t2587.dtb
* dra76-evm-tfp410.dtb
* dra76-evm-ov490.dtb
* dra76-evm-ov5640.dtb
* dra76-evm-tfp410-ov490.dtb
* dra76-evm-tfp410-ov5640.dtb

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/dra7xx-evm.conf | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index ada3207..b1da844 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -11,12 +11,12 @@ IMAGE_FSTYPES += "tar.xz"
 SERIAL_CONSOLES = "115200;ttyS0"
 
 KERNEL_DEVICETREE = " \
-    dra7-evm.dtb dra7-evm-lcd-osd101t2045.dtb dra7-evm-lcd-osd101t2587.dtb \
-    dra71-evm.dtb dra71-evm-nand.dtb dra71-evm-lcd-auo-g101evn01.0.dtb \
-    dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
-    dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb \
-    dra76-evm.dtb dra76-evm-tfp410.dtb dra76-evm-ov490.dtb dra76-evm-ov5640.dtb \
-    dra76-evm-tfp410-ov490.dtb dra76-evm-tfp410-ov5640.dtb \
+    dra7-evm.dtb  \
+    dra71-evm.dtb \
+    dra71-evm-nand.dtb \
+    dra72-evm.dtb  \
+    dra72-evm-revc.dtb  \
+    dra76-evm.dtb \
 "
 
 UBOOT_MACHINE = "dra7xx_evm_config"
-- 
2.7.4

