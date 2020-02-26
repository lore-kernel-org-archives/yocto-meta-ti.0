Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1386.1582680230307772216
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 17:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 app.sgizmo.com}: SPF record not found (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F2ECE016B6; Tue, 25 Feb 2020 17:23:50 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F514E0107C
	for <meta-ti@yoctoproject.org>; Tue, 25 Feb 2020 17:23:48 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9B0F240A23;
	Wed, 26 Feb 2020 01:23:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ik2hNEsznEYp; Wed, 26 Feb 2020 01:23:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 76F6F4006B;
	Wed, 26 Feb 2020 01:23:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2F55817407B;
	Tue, 25 Feb 2020 20:23:46 -0500 (EST)
From: "Denys Dmytriyenko" <denys@ti.com>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] osal: fix packaging issue due to libosal.a
Date: Tue, 25 Feb 2020 20:23:46 -0500
Message-Id: <1582680226-52315-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4

dwarfsrcfiles: .../work/am57xx_evm-linux-gnueabi/osal/1_2020.2.20-r0.1/package/usr/lib/libosal.a: not a valid ELF file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/osal/osal.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-bsp/osal/osal.inc b/recipes-bsp/osal/osal.inc
index 1f0a077..36b21e7 100644
--- a/recipes-bsp/osal/osal.inc
+++ b/recipes-bsp/osal/osal.inc
@@ -12,3 +12,4 @@ PE = "1"
 
 INC_PR = "r0"
 
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.7.4

