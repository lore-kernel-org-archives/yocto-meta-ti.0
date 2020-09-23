Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.4356.1600889708977398304
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Sep 2020 12:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F11F840C29;
	Wed, 23 Sep 2020 19:35:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4C1nsbTVGUiy; Wed, 23 Sep 2020 19:35:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CFD6540AB7;
	Wed, 23 Sep 2020 19:35:06 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 17BFF1741D0;
	Wed, 23 Sep 2020 15:35:06 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] README: add Dan Murphy to maintainers list
Date: Wed, 23 Sep 2020 15:35:05 -0400
Message-Id: <1600889705-37731-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 README | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/README b/README
index e6d342b..63eb823 100644
--- a/README
+++ b/README
@@ -24,4 +24,6 @@ meta-ti@lists.yoctoproject.org
 Please note - meta-ti mailing list requires subscription for posting:
 https://lists.yoctoproject.org/g/meta-ti
 
-Maintainers: Denys Dmytriyenko <denys@ti.com>
+Maintainers:
+Dan Murphy <dmurphy@ti.com>
+Denys Dmytriyenko <denys@ti.com>
-- 
2.7.4

