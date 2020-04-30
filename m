Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1280.1588207190415125648
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2020 17:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 538D040C0F;
	Thu, 30 Apr 2020 00:39:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29OzmkdFALpA; Thu, 30 Apr 2020 00:39:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3CAC740A9E;
	Thu, 30 Apr 2020 00:39:48 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DBFC217272F;
	Wed, 29 Apr 2020 20:39:47 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] u-boot-ti: remove initial-env, it's safe to depend on optee now
Date: Wed, 29 Apr 2020 20:39:47 -0400
Message-Id: <1588207187-22947-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index a4a15f6..736efc0 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -36,8 +36,7 @@ DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native"
 PACKAGECONFIG[atf] = "ATF=${STAGING_DIR_HOST}/boot/bl31.bin,,arm-trusted-firmware"
 PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}/boot/bl32.bin,,optee-os"
 
-# optee-os is not a direct dependency, do not enable optee by default
-PACKAGECONFIG_append_k3 = " atf"
+PACKAGECONFIG_append_aarch64 = " atf optee"
 
 EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
 
@@ -258,9 +257,12 @@ do_deploy_append () {
 		fi
 	fi
 
-	mv ${DEPLOYDIR}/u-boot-initial-env ${DEPLOYDIR}/${PN}-initial-env || true
-	mv ${DEPLOYDIR}/u-boot-initial-env-${MACHINE} ${DEPLOYDIR}/${PN}-initial-env-${MACHINE} || true
-	mv ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR} ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR} || true
+	rm ${DEPLOYDIR}/u-boot-initial-env || true
+	rm ${DEPLOYDIR}/${PN}-initial-env || true
+	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE} || true
+	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE} || true
+	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR} || true
+	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR} || true
 }
 
 do_install_append_keystone () {
-- 
2.7.4

