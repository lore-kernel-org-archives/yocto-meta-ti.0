Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5905.1600909659883934728
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Sep 2020 18:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 42BEB40BD1;
	Thu, 24 Sep 2020 01:07:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RuEqnWn6DBwt; Thu, 24 Sep 2020 01:07:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 274F640B96;
	Thu, 24 Sep 2020 01:07:38 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D849517446E;
	Wed, 23 Sep 2020 21:07:37 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell][PATCH] README: fix branch name for dunfell
Date: Wed, 23 Sep 2020 21:07:33 -0400
Message-Id: <1600909653-39547-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README b/README
index 3a1453b..31e6bc4 100644
--- a/README
+++ b/README
@@ -8,11 +8,11 @@ This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 layers: meta
-branch: master
+branch: dunfell
 
 URI: git://git.yoctoproject.org/meta-arm
 layers: meta-arm
-branch: master
+branch: dunfell
 
 
 The base BSP part of meta-ti should work with different OpenEmbedded/Yocto
-- 
2.7.4

