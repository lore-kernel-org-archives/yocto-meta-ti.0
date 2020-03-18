Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2072.1584558027295106092
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2020 12:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: ti.com, ip: 64.68.198.64, mailfrom: denys@ti.com)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5D70140C1E;
	Wed, 18 Mar 2020 19:00:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHGltuGSKiNX; Wed, 18 Mar 2020 19:00:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E6A5240C0C;
	Wed, 18 Mar 2020 19:00:24 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B12A31710D5;
	Wed, 18 Mar 2020 15:00:23 -0400 (EDT)
From: "Denys Dmytriyenko" <denys@ti.com>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [thud/zeus/master][PATCH] sciclient-rtos: suppress package/sysroot/debug split/strip errors
Date: Wed, 18 Mar 2020 15:00:23 -0400
Message-Id: <1584558023-11935-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index 3bd0727..d14c4a1 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -106,3 +106,6 @@ FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
 INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
 
 INSANE_SKIP_${PN}-dbg = "arch"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.7.4

