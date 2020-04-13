Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1258.1586804530384609790
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 12:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B672640C2B;
	Mon, 13 Apr 2020 19:02:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NaNiu8UE8gJV; Mon, 13 Apr 2020 19:02:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 675FF40C1F;
	Mon, 13 Apr 2020 19:02:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B157E172564;
	Mon, 13 Apr 2020 15:02:06 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 03/10] pa-lld: fix packaging issue due to libpa.a
Date: Mon, 13 Apr 2020 15:01:56 -0400
Message-Id: <1586804523-23047-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586804523-23047-1-git-send-email-denis@denix.org>
References: <1586804523-23047-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

dwarfsrcfiles: .../work/k2hk_evm-linux-gnueabi/pa-lld/1_2020.2.20-r0.1/package/usr/lib/libpa.a: not a valid ELF file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/pa-lld/pa-lld_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_git.bb
index f636ce4..55b7e81 100644
--- a/recipes-bsp/pa-lld/pa-lld_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld_git.bb
@@ -22,3 +22,5 @@ do_install () {
     ln -sf ${LIBPA}.so.1.0.0 ${D}${libdir}/libpa_device.so.1
     ln -sf libpa_device.so.1 ${D}${libdir}/libpa_device.so
 }
+
+INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libpa.a"
-- 
2.7.4

