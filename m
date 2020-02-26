Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.838.1582679385644386365
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 17:09:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C221E016B6; Tue, 25 Feb 2020 17:09:45 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE698E0107C
	for <meta-ti@yoctoproject.org>; Tue, 25 Feb 2020 17:09:42 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 72E9240BFE;
	Wed, 26 Feb 2020 01:09:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qp5rU2c8LGPD; Wed, 26 Feb 2020 01:09:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 32BC940A23;
	Wed, 26 Feb 2020 01:09:41 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6134C161A11;
	Tue, 25 Feb 2020 20:09:40 -0500 (EST)
From: "Denys Dmytriyenko" <denys@ti.com>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] ti-cgt6x: fix packaging issue due to libc.a
Date: Tue, 25 Feb 2020 20:09:39 -0500
Message-Id: <1582679379-48365-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4

dwarfsrcfiles: .../work/armv7at2hf-neon-linux-gnueabi/ti-cgt6x/1_8.3.2-r0/package/usr/share/ti/cgt-c6x/lib/libc.a: not a valid ELF file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/devtools/ti-cgt6x_8.3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
index c63c3f6..1188b4e 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
@@ -100,6 +100,7 @@ FILES_${PN} += "${datadir}/ti/*"
 FILES_${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
 
 INSANE_SKIP_${PN} += "staticdev"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.7.4

