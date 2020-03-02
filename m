Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.8692.1583116298648671957
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 01 Mar 2020 18:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E695E0179A; Sun,  1 Mar 2020 18:31:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31537E0179B
	for <meta-ti@yoctoproject.org>; Sun,  1 Mar 2020 18:31:36 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7E20840A9E;
	Mon,  2 Mar 2020 02:31:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HQTX1iPNBMZv; Mon,  2 Mar 2020 02:31:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6670440C14;
	Mon,  2 Mar 2020 02:31:35 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1005A174082;
	Sun,  1 Mar 2020 21:31:34 -0500 (EST)
From: "Denys Dmytriyenko" <denys@ti.com>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2 3/4] pruss-lld: fix packaging issue due to libpruss.a
Date: Sun,  1 Mar 2020 21:31:31 -0500
Message-Id: <1583116292-24761-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583116292-24761-1-git-send-email-denys@ti.com>
References: <1583116292-24761-1-git-send-email-denys@ti.com>

dwarfsrcfiles: .../work/am57xx_evm-linux-gnueabi/pruss-lld/1_2020.2.20-r0.2/package/usr/lib/libpruss.a: not a valid ELF file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - use INHIBIT_PACKAGE_STRIP_FILES to exclude a single file

 recipes-bsp/pruss-lld/pruss-lld.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-bsp/pruss-lld/pruss-lld.inc b/recipes-bsp/pruss-lld/pruss-lld.inc
index 793ba83..fe5987a 100644
--- a/recipes-bsp/pruss-lld/pruss-lld.inc
+++ b/recipes-bsp/pruss-lld/pruss-lld.inc
@@ -12,3 +12,4 @@ PE = "1"
 
 INC_PR = "r0"
 
+INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libpruss.a"
-- 
2.7.4

