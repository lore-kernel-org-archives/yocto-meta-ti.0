Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3932.1580361088966437122
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 21:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBECBE015B5; Wed, 29 Jan 2020 21:11:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43221E015BA
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2020 21:11:25 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4CC2140A52;
	Thu, 30 Jan 2020 05:11:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LkpCx0Ax603T; Thu, 30 Jan 2020 05:11:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 290B940C1D;
	Thu, 30 Jan 2020 05:11:24 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BD5DD1711C4;
	Thu, 30 Jan 2020 00:11:22 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH 4/4] am57xx-evm: remove unavailable BBAI and Cam/LCD-related DTBs
Date: Thu, 30 Jan 2020 00:11:20 -0500
Message-Id: <1580361080-40866-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580361080-40866-1-git-send-email-denis@denix.org>
References: <1580361080-40866-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

* am5729-beagleboneai.dtb
* am57xx-evm-cam-mt9t111.dtb
* am57xx-evm-cam-ov10635.dtb
* am57xx-evm-reva3-cam-mt9t111.dtb
* am57xx-evm-reva3-cam-ov10635.dtb
* am571x-idk-lcd-osd101t2045.dtb
* am571x-idk-lcd-osd101t2587.dtb
* am572x-idk-lcd-osd101t2045.dtb
* am572x-idk-lcd-osd101t2587.dtb
* am574x-idk-lcd-osd101t2587.dtb

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am57xx-evm.conf | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index a0b1b53..449aad9 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -12,12 +12,11 @@ SERIAL_CONSOLES = "115200;ttyS2"
 
 KERNEL_DEVICETREE = " \
     am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb \
-    am5729-beagleboneai.dtb \
-    am57xx-evm.dtb am57xx-evm-cam-mt9t111.dtb am57xx-evm-cam-ov10635.dtb \
-    am57xx-evm-reva3.dtb am57xx-evm-reva3-cam-mt9t111.dtb am57xx-evm-reva3-cam-ov10635.dtb \
-    am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb \
-    am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb \
-    am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb \
+    am57xx-evm.dtb \
+    am57xx-evm-reva3.dtb \
+    am571x-idk.dtb \
+    am572x-idk.dtb \
+    am574x-idk.dtb \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.7.4

