Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5522.1600908374635346063
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Sep 2020 17:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BA32D40BD1;
	Thu, 24 Sep 2020 00:46:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNNME_7DTMou; Thu, 24 Sep 2020 00:46:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A444740B96;
	Thu, 24 Sep 2020 00:46:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 06648173BAD;
	Wed, 23 Sep 2020 20:46:12 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] README: document dependency on meta-arm
Date: Wed, 23 Sep 2020 20:46:11 -0400
Message-Id: <1600908371-38924-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 README | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/README b/README
index 63eb823..3a1453b 100644
--- a/README
+++ b/README
@@ -10,6 +10,10 @@ URI: git://git.openembedded.org/openembedded-core
 layers: meta
 branch: master
 
+URI: git://git.yoctoproject.org/meta-arm
+layers: meta-arm
+branch: master
+
 
 The base BSP part of meta-ti should work with different OpenEmbedded/Yocto
 distributions and layer stacks, such as:
-- 
2.7.4

