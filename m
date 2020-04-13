Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1250.1586804530469212248
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 12:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D6C7040A93;
	Mon, 13 Apr 2020 19:02:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CrXxjTp9bqbC; Mon, 13 Apr 2020 19:02:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5BAD340C1E;
	Mon, 13 Apr 2020 19:02:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 97E6F1724AB;
	Mon, 13 Apr 2020 15:02:06 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 01/10] sa-lld: fix packaging issue due to libsa.a
Date: Mon, 13 Apr 2020 15:01:54 -0400
Message-Id: <1586804523-23047-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

dwarfsrcfiles: .../work/armv7at2hf-neon-linux-gnueabi/sa-lld/04.00.00.03B-r0.1/package/usr/lib/libsa.a: not a valid ELF file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/sa-lld/sa-lld_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/sa-lld/sa-lld_git.bb b/recipes-bsp/sa-lld/sa-lld_git.bb
index df41c65..a45fe1f 100644
--- a/recipes-bsp/sa-lld/sa-lld_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld_git.bb
@@ -22,3 +22,5 @@ do_install () {
 	ln -sf libsa.so.1.0.0 ${D}${libdir}/libsa_device.so.1
 	ln -sf libsa_device.so.1 ${D}${libdir}/libsa_device.so
 }
+
+INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libsa.a"
-- 
2.7.4

