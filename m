Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.195.1602545490196245363
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Oct 2020 16:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0320440C28;
	Mon, 12 Oct 2020 23:31:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RY6IZXsxfhvx; Mon, 12 Oct 2020 23:31:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BA07040C1E;
	Mon, 12 Oct 2020 23:31:27 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9C768174495;
	Mon, 12 Oct 2020 19:31:26 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 3/3] u-boot-ti-mainline: add mainline 2020.10
Date: Mon, 12 Oct 2020 19:31:19 -0400
Message-Id: <1602545479-715-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602545479-715-1-git-send-email-denis@denix.org>
References: <1602545479-715-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Update md5 README checksum for u-boot. No actual licensing changes.

Change is with u-boot commit
35bd70c5107f0 ("Convert CONFIG_SPLASH_SCREEN et al to Kconfig")

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{u-boot-ti-staging_2020.01.bb => u-boot-ti-mainline_git.bb}  | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 copy recipes-bsp/u-boot/{u-boot-ti-staging_2020.01.bb => u-boot-ti-mainline_git.bb} (9%)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
similarity index 9%
copy from recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
copy to recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index 5b09cb5..ee0b176 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -1,7 +1,10 @@
 require u-boot-ti.inc
 
-PR = "r18"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-BRANCH = "ti-u-boot-2020.01"
+PR = "r0"
 
-SRCREV = "eea73800730b3d9125f5c12a629db2f88e566b71"
+PV = "2020.10"
+UBOOT_GIT_URI = "git://gitlab.denx.de/u-boot/u-boot.git"
+UBOOT_GIT_PROTOCOL = "http"
+SRCREV = "050acee119b3757fee3bd128f55d720fdd9bb890"
-- 
2.7.4

