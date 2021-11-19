Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3486.1637290743183973584
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0920940BEA
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W83YQdJJkAE5 for <meta-ti@lists.yoctoproject.org>;
	Fri, 19 Nov 2021 02:59:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EC3D540C47
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id AD55D1746D4
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Nov 2021 21:59:01 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 01/20] u-boot-ti-staging: Bump u-boot version for 08.01.00.002
Date: Thu, 18 Nov 2021 21:58:42 -0500
Message-Id: <1637290741-8603-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637290741-8603-1-git-send-email-denis@denix.org>
References: <1637290741-8603-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Bump u-boot version to 08.01.00.002 release

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index db8dc9d..6765572 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r12"
+PR = "r13"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "316948e851b21f1f79e78fdd364a754cf9817038"
+SRCREV = "377e0f7041d1863bf9b3d23e90fb4b0c0a2cd6bf"
-- 
2.7.4

