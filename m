Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.3833.1580361088261139176
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 21:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1B57E01614; Wed, 29 Jan 2020 21:11:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FED7E007DA
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2020 21:11:25 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 424DA40C1E;
	Thu, 30 Jan 2020 05:11:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IXeHR5NlpgdO; Thu, 30 Jan 2020 05:11:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 24F0440A52;
	Thu, 30 Jan 2020 05:11:24 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B20D91711B3;
	Thu, 30 Jan 2020 00:11:22 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH 3/4] ti33x.inc: remove unavailable PRU-related DTBs
Date: Thu, 30 Jan 2020 00:11:19 -0500
Message-Id: <1580361080-40866-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580361080-40866-1-git-send-email-denis@denix.org>
References: <1580361080-40866-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

* am335x-icev2-prueth.dtb
* am335x-boneblack-prusuart.dtb

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/ti33x.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 5ff6efe..6f97361 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -28,11 +28,11 @@ KERNEL_IMAGETYPE = "zImage"
 
 KERNEL_DEVICETREE = " \
     am335x-evm.dtb am335x-evmsk.dtb \
-    am335x-icev2.dtb am335x-icev2-prueth.dtb \
+    am335x-icev2.dtb \
     am335x-pocketbeagle.dtb am335x-bone.dtb am335x-boneblue.dtb \
     am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb \
     am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
-    am335x-boneblack-prusuart.dtb am335x-sancloud-bbe.dtb \
+    am335x-sancloud-bbe.dtb \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
-- 
2.7.4

