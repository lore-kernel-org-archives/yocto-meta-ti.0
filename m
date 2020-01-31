Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1258.1580432383726280005
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jan 2020 16:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 925D4E013AE; Thu, 30 Jan 2020 16:59:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBCE5E0049C
	for <meta-ti@yoctoproject.org>; Thu, 30 Jan 2020 16:59:42 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D510D40C33;
	Fri, 31 Jan 2020 00:59:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQzWEG1yeeOm; Fri, 31 Jan 2020 00:59:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BA34340C31;
	Fri, 31 Jan 2020 00:59:40 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 73E2A170F48;
	Thu, 30 Jan 2020 19:59:40 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH] README: update mailing list URL
Date: Thu, 30 Jan 2020 19:59:40 -0500
Message-Id: <1580432380-23868-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 39dde59..778a975 100644
--- a/README
+++ b/README
@@ -20,6 +20,6 @@ Please follow the recommended setup procedures of your OE distribution.
 
 Send pull requests, patches, comments or questions to meta-ti@yoctoproject.org
 Please note - meta-ti mailing list requires subscription for posting:
-https://lists.yoctoproject.org/listinfo/meta-ti
+https://lists.yoctoproject.org/g/meta-ti
 
 Maintainers: Denys Dmytriyenko <denys@ti.com>
-- 
2.7.4

