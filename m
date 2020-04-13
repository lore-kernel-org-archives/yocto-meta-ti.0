Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.740.1586817218003447652
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 15:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 59D8E40C67;
	Mon, 13 Apr 2020 22:33:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2NV_Z_la600; Mon, 13 Apr 2020 22:33:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 38D2940C5D;
	Mon, 13 Apr 2020 22:33:35 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 438A4172565;
	Mon, 13 Apr 2020 18:33:35 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 4/6] sa-lld: limit to k2hk, k2e and k2l
Date: Mon, 13 Apr 2020 18:33:30 -0400
Message-Id: <1586817212-20188-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586817212-20188-1-git-send-email-denis@denix.org>
References: <1586817212-20188-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/sa-lld/sa-lld.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
index 4eaa0f8..a042581 100644
--- a/recipes-bsp/sa-lld/sa-lld.inc
+++ b/recipes-bsp/sa-lld/sa-lld.inc
@@ -1,5 +1,5 @@
 LICENSE = "BSD-3-Clause & TI-TFL"
-COMPATIBLE_MACHINE = "keystone"
+COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/sa/COPYING.txt;md5=cd04fb087063a2a82c4ce61983836871"
 
-- 
2.7.4

