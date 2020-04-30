Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.480.1588271384053005318
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 11:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6D5B540C0F
	for <meta-ti@lists.yoctoproject.org>; Thu, 30 Apr 2020 18:29:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5yg9x7TjVcsp for <meta-ti@lists.yoctoproject.org>;
	Thu, 30 Apr 2020 18:29:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5F554400E7
	for <meta-ti@lists.yoctoproject.org>; Thu, 30 Apr 2020 18:29:43 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1FC1317272F
	for <meta-ti@lists.yoctoproject.org>; Thu, 30 Apr 2020 14:29:43 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH] test4, please ignore
Date: Thu, 30 Apr 2020 14:29:43 -0400
Message-Id: <1588271383-52107-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 README | 1 +
 1 file changed, 1 insertion(+)

diff --git a/README b/README
index e6d342b..078e159 100644
--- a/README
+++ b/README
@@ -1,3 +1,4 @@
+
 The official OpenEmbedded/Yocto BSP layer for Texas Instruments platforms.
 
 It is hosted on http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/ with the
-- 
2.7.4

