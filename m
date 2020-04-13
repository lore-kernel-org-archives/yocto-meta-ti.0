Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1259.1586804530384760534
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 12:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B901F40C35;
	Mon, 13 Apr 2020 19:02:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fhyhpXtp4wgf; Mon, 13 Apr 2020 19:02:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6AE1240C24;
	Mon, 13 Apr 2020 19:02:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C8C041725A9;
	Mon, 13 Apr 2020 15:02:06 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 05/10] aif2-lld: fix packaging issue due to libaif2.a
Date: Mon, 13 Apr 2020 15:01:58 -0400
Message-Id: <1586804523-23047-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586804523-23047-1-git-send-email-denis@denix.org>
References: <1586804523-23047-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

dwarfsrcfiles: .../work/armv7at2hf-neon-linux-gnueabi/aif2-lld/1_2020.2.20-r0.0/package/usr/lib/libaif2.a: not a valid ELF file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/aif2-lld/aif2-lld_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/aif2-lld/aif2-lld_git.bb b/recipes-bsp/aif2-lld/aif2-lld_git.bb
index 12b1d06..4a640f1 100644
--- a/recipes-bsp/aif2-lld/aif2-lld_git.bb
+++ b/recipes-bsp/aif2-lld/aif2-lld_git.bb
@@ -16,3 +16,5 @@ do_install () {
     oe_runmake install INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
     chown -R root:root ${D}
 }
+
+INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libaif2.a"
-- 
2.7.4

