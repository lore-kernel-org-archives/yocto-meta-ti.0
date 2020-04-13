Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.7965.1586743699688800463
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 12 Apr 2020 19:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C548440A93;
	Mon, 13 Apr 2020 02:08:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xNCDsoj7wPtl; Mon, 13 Apr 2020 02:08:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8D6B5409AA;
	Mon, 13 Apr 2020 02:08:17 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id AEC951724AB;
	Sun, 12 Apr 2020 22:08:16 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] u-boot-ti.inc: rename u-boot-initial-env to ${PN}-initial-env
Date: Sun, 12 Apr 2020 22:08:16 -0400
Message-Id: <1586743696-5827-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

#$%^

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 8f88a1a..3dae42e 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -257,6 +257,8 @@ do_deploy_append () {
 			ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_BINARY}
 		fi
 	fi
+
+	mv ${DEPLOYDIR}/u-boot-initial-env ${DEPLOYDIR}/${PN}-initial-env
 }
 
 do_install_append_keystone () {
-- 
2.7.4

