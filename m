Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1484.1639602669738813493
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 13:11:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3827740A3D
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lUBue7Sd_XSO for <meta-ti@lists.yoctoproject.org>;
	Wed, 15 Dec 2021 21:11:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 23B6440C88
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B958C174720
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 16:11:03 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 08/11] conf: j7200-hs: fix the wrong machine configuration included
Date: Wed, 15 Dec 2021 16:11:00 -0500
Message-Id: <1639602663-32787-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639602663-32787-1-git-send-email-denis@denix.org>
References: <1639602663-32787-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

j7-evm instead of j7200-evm was included causing boot failure

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/j7200-hs-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
index c55be00..a5bd637 100644
--- a/conf/machine/j7200-hs-evm.conf
+++ b/conf/machine/j7200-hs-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: J7200 HS EVM
 #@DESCRIPTION: Machine configuration for the TI J7200 HS EVM
 
-require conf/machine/j7-evm.conf
+require conf/machine/j7200-evm.conf
 
 UBOOT_MACHINE = "j7200_hs_evm_a72_defconfig"
 
-- 
2.7.4

