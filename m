Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3408.1637378773101556194
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 19:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2F91840C83
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4e0Gqh5uqy2 for <meta-ti@lists.yoctoproject.org>;
	Sat, 20 Nov 2021 03:26:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 18E6740C53
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C524B1746D7
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 22:26:11 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH v2 03/26] linux-ti-staging: Bump linux version for 08.01.00.002
Date: Fri, 19 Nov 2021 22:25:48 -0500
Message-Id: <1637378771-24987-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637378771-24987-1-git-send-email-denis@denix.org>
References: <1637378771-24987-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Bump linux version for 08.01.00.002 release

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index a08f264..e97235c 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "f22103162c771ddd47372b579682445e6dc8dd0e"
+SRCREV = "33574931b48f50c37abb58e0a9c617cbec472b01"
 PV = "5.10.65+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.7.4

