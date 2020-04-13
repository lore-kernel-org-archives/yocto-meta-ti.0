Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8712.1586747593575835464
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 12 Apr 2020 20:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8FD8040B30;
	Mon, 13 Apr 2020 03:13:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qivQuA09FwqE; Mon, 13 Apr 2020 03:13:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 79BBC40A93;
	Mon, 13 Apr 2020 03:13:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 94CA41724AB;
	Sun, 12 Apr 2020 23:13:10 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2] u-boot-ti.inc: renmae u-boot-initial-env to ${PN}-initial-env
Date: Sun, 12 Apr 2020 23:13:10 -0400
Message-Id: <1586747590-30828-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

#$%^#$%^

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 8f88a1a..a4a15f6 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -257,6 +257,10 @@ do_deploy_append () {
 			ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_BINARY}
 		fi
 	fi
+
+	mv ${DEPLOYDIR}/u-boot-initial-env ${DEPLOYDIR}/${PN}-initial-env || true
+	mv ${DEPLOYDIR}/u-boot-initial-env-${MACHINE} ${DEPLOYDIR}/${PN}-initial-env-${MACHINE} || true
+	mv ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR} ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR} || true
 }
 
 do_install_append_keystone () {
-- 
2.7.4

