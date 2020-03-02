Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.8781.1583116298349970572
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 01 Mar 2020 18:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 39BDAE0179C; Sun,  1 Mar 2020 18:31:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A170E003DB
	for <meta-ti@yoctoproject.org>; Sun,  1 Mar 2020 18:31:36 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 43DB040C2B;
	Mon,  2 Mar 2020 02:31:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gp19mFEC4caT; Mon,  2 Mar 2020 02:31:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2680F40A9E;
	Mon,  2 Mar 2020 02:31:35 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EACC116D1BD;
	Sun,  1 Mar 2020 21:31:33 -0500 (EST)
From: "Denys Dmytriyenko" <denys@ti.com>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2 1/4] ti-cgt6x: fix packaging issue due to libc.a
Date: Sun,  1 Mar 2020 21:31:29 -0500
Message-Id: <1583116292-24761-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4

dwarfsrcfiles: .../work/armv7at2hf-neon-linux-gnueabi/ti-cgt6x/1_8.3.2-r0/package/usr/share/ti/cgt-c6x/lib/libc.a: not a valid ELF file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - use INHIBIT_PACKAGE_STRIP_FILES to exclude a single file

 recipes-ti/devtools/ti-cgt6x_8.3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
index c63c3f6..38f5597 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
@@ -100,6 +100,7 @@ FILES_${PN} += "${datadir}/ti/*"
 FILES_${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
 
 INSANE_SKIP_${PN} += "staticdev"
+INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${datadir}/ti/cgt-c6x/lib/libc.a"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.7.4

