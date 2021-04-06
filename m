Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1220.1617724916424312677
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 09:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 53C0940C22;
	Tue,  6 Apr 2021 16:01:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJ8LiixBjMz6; Tue,  6 Apr 2021 16:01:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3B0FD409AE;
	Tue,  6 Apr 2021 16:01:54 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 58F861745A6;
	Tue,  6 Apr 2021 12:01:53 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH] README: update maintainers
Date: Tue,  6 Apr 2021 12:01:51 -0400
Message-Id: <1617724911-49018-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

Noticed maintainers list was outdated.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README b/README
index 31e6bc4..44544c6 100644
--- a/README
+++ b/README
@@ -29,5 +29,5 @@ Please note - meta-ti mailing list requires subscription for posting:
 https://lists.yoctoproject.org/g/meta-ti
 
 Maintainers:
-Dan Murphy <dmurphy@ti.com>
-Denys Dmytriyenko <denys@ti.com>
+Praneeth Bajjuri <praneeth@ti.com>
+Denys Dmytriyenko <denys@konsulko.com>
-- 
2.7.4

