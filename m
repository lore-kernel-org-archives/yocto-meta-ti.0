Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1064.1580431623878910872
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jan 2020 16:47:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77A56E0161A; Thu, 30 Jan 2020 16:47:03 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 206FCE007DA
	for <meta-ti@yoctoproject.org>; Thu, 30 Jan 2020 16:47:01 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6753A40C31;
	Fri, 31 Jan 2020 00:47:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wkGov-suRF9a; Fri, 31 Jan 2020 00:47:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4FF5540C4E;
	Fri, 31 Jan 2020 00:47:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 315631743CA;
	Thu, 30 Jan 2020 19:46:59 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH 3/3] j7-evm: remove unavailable display-sharing and jailhouse DTBOs
Date: Thu, 30 Jan 2020 19:46:58 -0500
Message-Id: <1580431618-21012-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580431618-21012-1-git-send-email-denis@denix.org>
References: <1580431618-21012-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

* ti/k3-j721e-common-proc-board-infotainment-display-sharing.dtbo
* ti/k3-j721e-common-proc-board-jailhouse.dtbo

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/j7-evm.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 318435d..e41b152 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -13,8 +13,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
     ti/k3-j721e-proc-board-tps65917.dtb \
     ti/k3-j721e-common-proc-board-infotainment.dtbo \
-    ti/k3-j721e-common-proc-board-infotainment-display-sharing.dtbo \
-    ti/k3-j721e-common-proc-board-jailhouse.dtbo \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
-- 
2.7.4

