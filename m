Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1191.1635795194257604718
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 12:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 36D3B40C6C
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6QUxWSSUjSB3 for <meta-ti@lists.yoctoproject.org>;
	Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2AFB940C53
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E08191746B4
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 15:33:12 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 04/22] linux-ti-staging-rt: Update SRCREV to 5.10.65
Date: Mon,  1 Nov 2021 15:32:54 -0400
Message-Id: <1635795192-43144-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635795192-43144-1-git-send-email-denis@denix.org>
References: <1635795192-43144-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Update SRCREV to 5.10.65

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 7148c71..ae3904c 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "c0d9886f48dda1788995c4e0d6a7286d177df2f1"
-PV = "5.10.59+git${SRCPV}"
+SRCREV = "890b86772cff397e32c66ea6528fe8702d7e44a5"
+PV = "5.10.65+git${SRCPV}"
-- 
2.7.4

