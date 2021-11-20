Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3406.1637378775249463247
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 19:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B274240C5F
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3l1lqj8MKTGw for <meta-ti@lists.yoctoproject.org>;
	Sat, 20 Nov 2021 03:26:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9ED8A40C87
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6358D1746DD
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 22:26:12 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH v2 17/26] conf: machine : am65xx: Add missing dtbo
Date: Fri, 19 Nov 2021 22:26:02 -0500
Message-Id: <1637378771-24987-18-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637378771-24987-1-git-send-email-denis@denix.org>
References: <1637378771-24987-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Added missing dtbo k3-am654-evm-ov5640.dtbo required for system test

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/include/am65xx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index 2838c58..8b1531c 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -17,6 +17,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-pcie-usb3.dtbo \
     ti/k3-am654-evm-tc358876.dtbo \
     ti/k3-am654-evm-oldi-lcd1evm.dtbo \
+    ti/k3-am654-evm-ov5640.dtbo \
 "
 
 BBMULTICONFIG += "k3r5-sr2"
-- 
2.7.4

