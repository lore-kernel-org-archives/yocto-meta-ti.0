Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.472.1588271378587276321
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 11:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32E85E01AB5; Thu, 30 Apr 2020 11:29:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
X-Greylist: delayed 314 seconds by postgrey-1.32 at yocto-www; Thu, 30 Apr 2020 11:29:36 PDT
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49258E01AB3
	for <meta-ti@yoctoproject.org>; Thu, 30 Apr 2020 11:29:36 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 31FC340C0F;
	Thu, 30 Apr 2020 18:24:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3uqhOsvAMdp; Thu, 30 Apr 2020 18:24:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9DA01400E7;
	Thu, 30 Apr 2020 18:24:20 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6468517272F;
	Thu, 30 Apr 2020 14:24:20 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] test2, please ignore
Date: Thu, 30 Apr 2020 14:24:15 -0400
Message-Id: <1588271055-51243-1-git-send-email-denis@denix.org>
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

