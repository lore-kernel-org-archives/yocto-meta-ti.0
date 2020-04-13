Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1255.1586804532794292641
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 12:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3CF7340BAC;
	Mon, 13 Apr 2020 19:02:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmuNVHf7SqiN; Mon, 13 Apr 2020 19:02:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2149740C34;
	Mon, 13 Apr 2020 19:02:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D466C1725BD;
	Mon, 13 Apr 2020 15:02:06 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 06/10] hyplnk-lld: fix packaging issue due to libhyplnk*.a
Date: Mon, 13 Apr 2020 15:01:59 -0400
Message-Id: <1586804523-23047-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586804523-23047-1-git-send-email-denis@denix.org>
References: <1586804523-23047-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

dwarfsrcfiles: .../work/k2hk_evm-linux-gnueabi/hyplnk-lld/1_2020.2.20-r0.1/package/usr/lib/libhyplnk_k2h.a: not a valid ELF file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
index 08124d7..7848df1 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
@@ -31,3 +31,6 @@ do_install () {
 	done
 	ln -sf libhyplnk_device.so.1 libhyplnk_device.so
 }
+
+INHIBIT_PACKAGE_STRIP_FILES_k2hk = "${PKGD}${libdir}/libhyplnk_k2h.a ${PKGD}${libdir}/libhyplnk_k2k.a"
+INHIBIT_PACKAGE_STRIP_FILES_k2e = "${PKGD}${libdir}/libhyplnk_k2e.a"
-- 
2.7.4

