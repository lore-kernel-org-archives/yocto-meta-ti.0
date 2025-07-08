Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863F4C83F0A
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 14:42:34 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.20583.1751985749128436691
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 07:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JO4hkfRl;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 568EgR5e914400;
	Tue, 8 Jul 2025 09:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751985747;
	bh=2pkA5tdb78OpT8/qbyoyavzy72ASf7GHoWs7GAd3hwg=;
	h=From:To:Subject:Date;
	b=JO4hkfRl4Cp8UJ4GF8ddGhQ+5+YlB79n5JtdDYDq4dSJ1tbTYgLtk82SZke4IOVlL
	 +KqYPzIDdsnBtHskfyna0/H0Sfsmw2kacNg2V1qacevgv33Q3Z0ve6IF3MrPFiOK/Z
	 ZUJDy+lQdAoH0Xph04dFW+9JXJVk4ER24q3PFv6I=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 568EgRTv2461558
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 8 Jul 2025 09:42:27 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 8
 Jul 2025 09:42:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 8 Jul 2025 09:42:26 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 568EgQR42240567;
	Tue, 8 Jul 2025 09:42:26 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uZ9Wc-0005I7-7s; Tue, 08 Jul 2025 09:42:26 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] u-boot-ti: Move filenames to use PKGV instead of PV
Date: Tue, 8 Jul 2025 09:42:26 -0500
Message-ID: <20250708144226.20299-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Jul 2025 14:42:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18765

We would like to know the git commit for the build by looking at the
filenames of u-boot files.  Include the value for PKGV in the names of
the files instead of PV.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index ffe50f65..743eb61b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -5,6 +5,10 @@ do_compile:prepend () {
     echo ${scm_version} > ${S}/.scmversion
 }
 
+inherit gitpkgv
+PKGV = "${PV}${GITPKGV}"
+UBOOT_VERSION = "${PKGV}-${PKGR}"
+
 UBOOT_SUFFIX ?= "img"
 SPL_BINARY ?= "MLO"
 
@@ -105,31 +109,31 @@ SYSROOT_DIRS += "/boot"
 SPL_UART_BINARY = "u-boot-spl.bin"
 SPL_UART_BINARY:k3r5 = ""
 
-SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
+SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${UBOOT_VERSION}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
 
 SPL_HS_MLO_BINARY = "u-boot-spl_HS_MLO"
-SPL_HS_MLO_IMAGE = "u-boot-spl_HS_MLO-${MACHINE}-${PV}-${PR}"
+SPL_HS_MLO_IMAGE = "u-boot-spl_HS_MLO-${MACHINE}-${UBOOT_VERSION}"
 SPL_HS_MLO_SYMLINK = "u-boot-spl_HS_MLO-${MACHINE}"
 
 # HS XLD
 UBOOT_HS_XLD_BINARY = "u-boot-spl_HS_X-LOADER"
-UBOOT_HS_XLD_IMAGE = "u-boot-spl_HS_X-LOADER-${MACHINE}-${PV}-${PR}"
+UBOOT_HS_XLD_IMAGE = "u-boot-spl_HS_X-LOADER-${MACHINE}-${UBOOT_VERSION}"
 UBOOT_HS_XLD_SYMLINK = "u-boot-spl_HS_X-LOADER-${MACHINE}"
 
 # HS MLO
 UBOOT_HS_MLO_BINARY = "u-boot_HS_MLO"
-UBOOT_HS_MLO_IMAGE = "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
+UBOOT_HS_MLO_IMAGE = "u-boot_HS_MLO-${MACHINE}-${UBOOT_VERSION}"
 UBOOT_HS_MLO_SYMLINK = "u-boot_HS_MLO-${MACHINE}"
 
 # HS ISSW
 UBOOT_HS_ISSW_BINARY = "u-boot-spl_HS_ISSW"
-UBOOT_HS_ISSW_IMAGE = "u-boot-spl_HS_ISSW-${MACHINE}-${PV}-${PR}"
+UBOOT_HS_ISSW_IMAGE = "u-boot-spl_HS_ISSW-${MACHINE}-${UBOOT_VERSION}"
 UBOOT_HS_ISSW_SYMLINK = "u-boot-spl_HS_ISSW-${MACHINE}"
 
 # HS 2ND
 UBOOT_HS_2ND_BINARY = "u-boot-spl_HS_2ND"
-UBOOT_HS_2ND_IMAGE = "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
+UBOOT_HS_2ND_IMAGE = "u-boot-spl_HS_2ND-${MACHINE}-${UBOOT_VERSION}"
 UBOOT_HS_2ND_SYMLINK = "u-boot-spl_HS_2ND-${MACHINE}"
 
 uboot_compile:append () {
@@ -217,8 +221,8 @@ do_deploy:append:k3r5 () {
 	rm -f ${DEPLOYDIR}/${PN}-initial-env*
 	rm -f ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}*
 	rm -f ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}*
-	rm -f ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR}*
-	rm -f ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR}*
+	rm -f ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${UBOOT_VERSION}*
+	rm -f ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${UBOOT_VERSION}*
 }
 
 uboot_deploy_config:append:k3r5 () {
-- 
2.17.1


