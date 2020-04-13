Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1253.1586804531992023055
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 12:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2C1A740C1E;
	Mon, 13 Apr 2020 19:02:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZ3YqCeV8c1w; Mon, 13 Apr 2020 19:02:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DEF7D40C1F;
	Mon, 13 Apr 2020 19:02:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E01491725BE;
	Mon, 13 Apr 2020 15:02:06 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 07/10] cppi-lld: fix packaging issue due to libcppi*.a
Date: Mon, 13 Apr 2020 15:02:00 -0400
Message-Id: <1586804523-23047-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586804523-23047-1-git-send-email-denis@denix.org>
References: <1586804523-23047-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

dwarfsrcfiles: .../work/k2hk_evm-linux-gnueabi/cppi-lld/1_2020.2.20-r0.1/package/usr/lib/libcppi_k2h.a: not a valid ELF file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/cppi-lld/cppi-lld_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/cppi-lld_git.bb
index 6ac72cf..d606993 100644
--- a/recipes-bsp/cppi-lld/cppi-lld_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld_git.bb
@@ -30,3 +30,8 @@ do_install () {
     done
     ln -sf libcppi_device.so.1 libcppi_device.so
 }
+
+INHIBIT_PACKAGE_STRIP_FILES_k2hk = "${PKGD}${libdir}/libcppi_k2h.a ${PKGD}${libdir}/libcppi_k2k.a"
+INHIBIT_PACKAGE_STRIP_FILES_k2e = "${PKGD}${libdir}/libcppi_k2e.a"
+INHIBIT_PACKAGE_STRIP_FILES_k2l = "${PKGD}${libdir}/libcppi_k2l.a"
+INHIBIT_PACKAGE_STRIP_FILES_append = " ${PKGD}${libdir}/libcppi.a"
-- 
2.7.4

