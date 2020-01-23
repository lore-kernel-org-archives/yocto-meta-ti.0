Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.3522.1579815834230300046
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jan 2020 13:43:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D229E01605; Thu, 23 Jan 2020 13:43:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SUBJ_OBFU_PUNCT_FEW,SUBJ_OBFU_PUNCT_MANY autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
	*  0.3 SUBJ_OBFU_PUNCT_FEW Possible punctuation-obfuscated Subject: header
	*  1.4 SUBJ_OBFU_PUNCT_MANY Punctuation-obfuscated Subject: header
X-Greylist: delayed 471 seconds by postgrey-1.32 at yocto-www; Thu, 23 Jan 2020 13:43:52 PST
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 039E2E0159B
	for <meta-ti@yoctoproject.org>; Thu, 23 Jan 2020 13:43:52 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 102F340BF7;
	Thu, 23 Jan 2020 21:36:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UqTg6lxdUtBW; Thu, 23 Jan 2020 21:36:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EB43B400E8;
	Thu, 23 Jan 2020 21:35:59 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5B8B61743A7;
	Thu, 23 Jan 2020 16:35:59 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [RFC][PATCH] layer.conf: drop ti-ipc from SIGGEN_EXCLUDERECIPES_ABISAFE for now
Date: Thu, 23 Jan 2020 16:35:59 -0500
Message-Id: <1579815359-3338-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/layer.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 824443d..d82b238 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -17,8 +17,6 @@ LAYERDEPENDS_meta-ti = "core"
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     ti-sgx-ddk-km \
     ti-sgx-ddk-um \
-    ti-ipc \
-    ti-ipc-rtos \
     cmem-mod \
     hplib-mod \
     gdbserverproxy-module-drv \
-- 
2.7.4

