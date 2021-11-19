Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3360.1637290751602204337
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EC4E040C2C
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVY6CzoOl7JG for <meta-ti@lists.yoctoproject.org>;
	Fri, 19 Nov 2021 02:59:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 74A0240CA5
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5CF501746D5
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Nov 2021 21:59:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 16/20] conf: machine: am64xx: Add missing dtbo
Date: Thu, 18 Nov 2021 21:58:57 -0500
Message-Id: <1637290741-8603-17-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637290741-8603-1-git-send-email-denis@denix.org>
References: <1637290741-8603-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Add missing k3-am642-evm-nand.dtbo required for system test

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/include/am64xx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 18e3757..1d53c7a 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -10,6 +10,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am642-evm.dtb \
     ti/k3-am642-sk.dtb \
     ti/k3-am642-evm-icssg1-dualemac.dtbo \
+    ti/k3-am642-evm-nand.dtbo \
 "
 
 # AM64 supports multi-certificate images, use the same
-- 
2.7.4

