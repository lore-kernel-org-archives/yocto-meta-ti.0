Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.733.1586817218073944175
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 15:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 73DE340C5D;
	Mon, 13 Apr 2020 22:33:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZ7ySw-hFMnI; Mon, 13 Apr 2020 22:33:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 42A0740C62;
	Mon, 13 Apr 2020 22:33:35 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4E7E91725A9;
	Mon, 13 Apr 2020 18:33:35 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 5/6] HACK: qmss-lld: enable k2g by building k2h target
Date: Mon, 13 Apr 2020 18:33:31 -0400
Message-Id: <1586817212-20188-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586817212-20188-1-git-send-email-denis@denix.org>
References: <1586817212-20188-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/qmss-lld/qmss-lld.inc    | 2 +-
 recipes-bsp/qmss-lld/qmss-lld_git.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index 5c9620f..108383d 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -16,4 +16,4 @@ DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2l = "k2l"
 DEVICELIST_k2e = "k2e"
-
+DEVICELIST_k2g = "k2h"
diff --git a/recipes-bsp/qmss-lld/qmss-lld_git.bb b/recipes-bsp/qmss-lld/qmss-lld_git.bb
index fb2ed7e..04f82d9 100644
--- a/recipes-bsp/qmss-lld/qmss-lld_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld_git.bb
@@ -34,4 +34,5 @@ do_install () {
 INHIBIT_PACKAGE_STRIP_FILES_k2hk = "${PKGD}${libdir}/libqmss_k2h.a ${PKGD}${libdir}/libqmss_k2k.a"
 INHIBIT_PACKAGE_STRIP_FILES_k2e = "${PKGD}${libdir}/libqmss_k2e.a"
 INHIBIT_PACKAGE_STRIP_FILES_k2l = "${PKGD}${libdir}/libqmss_k2l.a"
+INHIBIT_PACKAGE_STRIP_FILES_k2g = "${PKGD}${libdir}/libqmss_k2h.a"
 INHIBIT_PACKAGE_STRIP_FILES_append = " ${PKGD}${libdir}/libqmss.a"
-- 
2.7.4

