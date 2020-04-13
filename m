Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.733.1586817218075044638
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 15:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6C5F540C69;
	Mon, 13 Apr 2020 22:33:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4TDRbwcl6f6f; Mon, 13 Apr 2020 22:33:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3FB3140C61;
	Mon, 13 Apr 2020 22:33:35 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2D0421724AE;
	Mon, 13 Apr 2020 18:33:35 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 2/6] iqn2-lld: fix packaging issue due to libpruss.a
Date: Mon, 13 Apr 2020 18:33:28 -0400
Message-Id: <1586817212-20188-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586817212-20188-1-git-send-email-denis@denix.org>
References: <1586817212-20188-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

dwarfsrcfiles: .../work/armv7at2hf-neon-linux-gnueabi/iqn2-lld/1_2020.2.20-r0.0/package/usr/lib/libiqn2.a: not a valid ELF file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/iqn2-lld/iqn2-lld_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
index 169ab6e..a0c2ef8 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
+++ b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
@@ -21,3 +21,5 @@ do_install () {
 	oe_runmake install INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
 	chown -R root:root ${D}
 }
+
+INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libiqn2.a"
-- 
2.7.4

