Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.13.1582670762533401527
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 14:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CA14E016B6; Tue, 25 Feb 2020 14:46:02 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70CA2E003DB
	for <meta-ti@yoctoproject.org>; Tue, 25 Feb 2020 14:46:00 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7C81040BFC;
	Tue, 25 Feb 2020 22:46:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNvkjkZNkTVG; Tue, 25 Feb 2020 22:46:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 63295409E7;
	Tue, 25 Feb 2020 22:45:59 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id AA053161A11;
	Tue, 25 Feb 2020 17:45:58 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH] am65xx-evm: re-add k3-am654-evm-prupwm.dtbo
Date: Tue, 25 Feb 2020 17:45:58 -0500
Message-Id: <1582670758-9235-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index dce6d05..3edbb29 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -15,6 +15,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-evm-oldi-lcd1evm.dtbo ti/k3-am654-evm-tc358876.dtbo \
     ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo \
     ti/k3-am654-base-board-jailhouse.dtbo \
+    ti/k3-am654-evm-prupwm.dtbo \
 "
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
-- 
2.7.4

