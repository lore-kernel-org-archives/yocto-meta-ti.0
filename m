Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.732.1586817218010353114
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 15:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6B95D40C58;
	Mon, 13 Apr 2020 22:33:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lqr8WFlMKKY1; Mon, 13 Apr 2020 22:33:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3CCA640C5E;
	Mon, 13 Apr 2020 22:33:35 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 37D3F172564;
	Mon, 13 Apr 2020 18:33:35 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 3/6] pa-lld: limit to k2hk, k2e and k2l, skip correct version of .a library
Date: Mon, 13 Apr 2020 18:33:29 -0400
Message-Id: <1586817212-20188-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586817212-20188-1-git-send-email-denis@denix.org>
References: <1586817212-20188-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/pa-lld/pa-lld.inc    | 2 +-
 recipes-bsp/pa-lld/pa-lld_git.bb | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 83c57e3..e8e0731 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -1,7 +1,7 @@
 LICENSE = "BSD-3-Clause & TI-TFL"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=cd04fb087063a2a82c4ce61983836871"
 
-COMPATIBLE_MACHINE = "keystone"
+COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit ti-pdk-fetch
diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_git.bb
index 55b7e81..bbe7aa3 100644
--- a/recipes-bsp/pa-lld/pa-lld_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld_git.bb
@@ -23,4 +23,5 @@ do_install () {
     ln -sf libpa_device.so.1 ${D}${libdir}/libpa_device.so
 }
 
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libpa.a"
+INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libpa2.a"
+INHIBIT_PACKAGE_STRIP_FILES_k2hk = "${PKGD}${libdir}/libpa.a"
-- 
2.7.4

