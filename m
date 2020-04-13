Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.741.1586817219276119319
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 15:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 91E4740C53;
	Mon, 13 Apr 2020 22:33:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ShdMGIQGyV1g; Mon, 13 Apr 2020 22:33:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7BDAC40C50;
	Mon, 13 Apr 2020 22:33:37 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5ACAB1725BD;
	Mon, 13 Apr 2020 18:33:35 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 6/6] HACK: cppi-lld: enable k2g by building k2h target
Date: Mon, 13 Apr 2020 18:33:32 -0400
Message-Id: <1586817212-20188-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586817212-20188-1-git-send-email-denis@denix.org>
References: <1586817212-20188-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/cppi-lld/cppi-lld.inc    | 2 +-
 recipes-bsp/cppi-lld/cppi-lld_git.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
index 40810f7..77eaff2 100644
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ b/recipes-bsp/cppi-lld/cppi-lld.inc
@@ -16,4 +16,4 @@ DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2l  = "k2l"
 DEVICELIST_k2e  = "k2e"
-
+DEVICELIST_k2g  = "k2h"
diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/cppi-lld_git.bb
index d606993..3cdcd22 100644
--- a/recipes-bsp/cppi-lld/cppi-lld_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld_git.bb
@@ -34,4 +34,5 @@ do_install () {
 INHIBIT_PACKAGE_STRIP_FILES_k2hk = "${PKGD}${libdir}/libcppi_k2h.a ${PKGD}${libdir}/libcppi_k2k.a"
 INHIBIT_PACKAGE_STRIP_FILES_k2e = "${PKGD}${libdir}/libcppi_k2e.a"
 INHIBIT_PACKAGE_STRIP_FILES_k2l = "${PKGD}${libdir}/libcppi_k2l.a"
+INHIBIT_PACKAGE_STRIP_FILES_k2g = "${PKGD}${libdir}/libcppi_k2h.a"
 INHIBIT_PACKAGE_STRIP_FILES_append = " ${PKGD}${libdir}/libcppi.a"
-- 
2.7.4

