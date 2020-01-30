Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3931.1580361088261619857
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 21:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3F63E01661; Wed, 29 Jan 2020 21:11:27 -0800 (PST)
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
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 416AAE015B5
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2020 21:11:25 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 43F1C40C29;
	Thu, 30 Jan 2020 05:11:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vmHMnS-43n4C; Thu, 30 Jan 2020 05:11:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 27B5F40C0C;
	Thu, 30 Jan 2020 05:11:24 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A216316E7F5;
	Thu, 30 Jan 2020 00:11:22 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH 1/4] u-boot-ti-staging: upgrade to 2020.01
Date: Thu, 30 Jan 2020 00:11:17 -0500
Message-Id: <1580361080-40866-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{u-boot-ti-staging_2019.01.bb => u-boot-ti-staging_2020.01.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-bsp/u-boot/{u-boot-ti-staging_2019.01.bb => u-boot-ti-staging_2020.01.bb} (21%)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
similarity index 21%
rename from recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
rename to recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 472f569..533e72e 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r32"
+PR = "r0"
 
-BRANCH = "ti-u-boot-2019.01"
+BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "350f3927b89bc06ce1c9ddb618280d298c418b94"
+SRCREV = "7903c7038afdc12758c101a42b628137d8c276c9"
-- 
2.7.4

