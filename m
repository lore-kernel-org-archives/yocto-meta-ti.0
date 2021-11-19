Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3404.1637290745312664508
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ACDED40BEA
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6en6FRkNg38d for <meta-ti@lists.yoctoproject.org>;
	Fri, 19 Nov 2021 02:59:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3FA2940C16
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 09E621746D4
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Nov 2021 21:59:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 08/20] linux-ti-staging-rt: Bump linux rt version for 08.01.00.003
Date: Thu, 18 Nov 2021 21:58:49 -0500
Message-Id: <1637290741-8603-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637290741-8603-1-git-send-email-denis@denix.org>
References: <1637290741-8603-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Bump linux rt version to 08.01.00.003

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index d2250c4..a02e82d 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "a5427455c650cb9d33e3d5f0b009a773370a5428"
+SRCREV = "d3083b1688af8af4728478c759e56b2a22adf9e5"
 PV = "5.10.65+git${SRCPV}"
-- 
2.7.4

