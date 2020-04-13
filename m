Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1260.1586804531990448990
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 12:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2FC5940C3A;
	Mon, 13 Apr 2020 19:02:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bfGMHExk9AXk; Mon, 13 Apr 2020 19:02:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E236B40C33;
	Mon, 13 Apr 2020 19:02:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0F0E417272F;
	Mon, 13 Apr 2020 15:02:07 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 10/10] ipc-transport-srio: fix packaging issue due to libTransportSrio.a
Date: Mon, 13 Apr 2020 15:02:03 -0400
Message-Id: <1586804523-23047-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586804523-23047-1-git-send-email-denis@denix.org>
References: <1586804523-23047-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

dwarfsrcfiles: .../work/armv7at2hf-neon-linux-gnueabi/ipc-transport-srio/02.00.00.02A-r0.1.0/package/usr/lib/libTransportSrio.a: not a valid ELF file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ipc/ipc-transport-srio_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-ti/ipc/ipc-transport-srio_git.bb b/recipes-ti/ipc/ipc-transport-srio_git.bb
index ca7f7b6..6001585 100644
--- a/recipes-ti/ipc/ipc-transport-srio_git.bb
+++ b/recipes-ti/ipc/ipc-transport-srio_git.bb
@@ -15,3 +15,5 @@ do_install () {
 		INSTALL_LIB_BASE_DIR=${D}${libdir}
 	chown -R root:root ${D}
 }
+
+INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libTransportSrio.a"
-- 
2.7.4

