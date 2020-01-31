Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1041.1580431624096059924
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jan 2020 16:47:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC5BBE007DA; Thu, 30 Jan 2020 16:47:03 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22406E01503
	for <meta-ti@yoctoproject.org>; Thu, 30 Jan 2020 16:47:01 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6FD9740C4E;
	Fri, 31 Jan 2020 00:47:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bDjT9bcxDY7; Fri, 31 Jan 2020 00:47:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 589D240C4F;
	Fri, 31 Jan 2020 00:47:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 259C21743AB;
	Thu, 30 Jan 2020 19:46:59 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH 2/3] am65xx-evm: remove unavailable DTBOs
Date: Thu, 30 Jan 2020 19:46:57 -0500
Message-Id: <1580431618-21012-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580431618-21012-1-git-send-email-denis@denix.org>
References: <1580431618-21012-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

* ti/k3-am654-evm-csi2-ov490.dtbo
* ti/k3-am654-evm-csi2-ov5640.dtbo
* ti/k3-am654-evm-prupwm.dtbo

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 82959ce..bc5fdc3 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -14,11 +14,9 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb ti/k3-am654-gp.dtbo \
     ti/k3-am654-evm-hdmi.dtbo ti/k3-am654-idk.dtbo \
-    ti/k3-am654-evm-csi2-ov490.dtbo ti/k3-am654-evm-csi2-ov5640.dtbo \
     ti/k3-am654-evm-oldi-lcd1evm.dtbo ti/k3-am654-evm-tc358876.dtbo \
     ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo \
     ti/k3-am654-base-board-jailhouse.dtbo \
-    ti/k3-am654-evm-prupwm.dtbo \
 "
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
-- 
2.7.4

