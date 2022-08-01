Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E79DC3F6B0
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 21:40:16 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3279.1659390015681963421
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 14:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wvuu5x/h;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 271LeBu2059718;
	Mon, 1 Aug 2022 16:40:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659390011;
	bh=o/uJ02OLwGNew8WCZhlqwdAOD3JEzhWdIXrHIwRbAiw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wvuu5x/hbOsPs8lYYkkHuOIBp8z5yihsjaAHtCJGkW+KdH1Sf7AQ8r5oXwguhCXER
	 O/4jpkOmCpNaoJ5CcichQ0Q1hcLmCUkcicmXVwwMZmgKrWiC3GItgSWF7I9gNobOtd
	 GKjGiPwZv51dU6Zox20Su7EIFBcGq0s4AXN9yVug=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 271LeBpw019760
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Aug 2022 16:40:11 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 1
 Aug 2022 16:40:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 1 Aug 2022 16:40:11 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 271Le78j035718;
	Mon, 1 Aug 2022 16:40:10 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 4/4] ti-sci-fw: Use SYSFW_TIBOOT3 to point
 to the SYSFW image
Date: Mon, 1 Aug 2022 16:40:07 -0500
Message-ID: <20220801214007.25463-4-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220801214007.25463-1-afd@ti.com>
References: <20220801214007.25463-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 01 Aug 2022 21:40:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14917

Currently we reuse UBOOT_* names which usually are the same we
want to give to the name of the SYSFW binary. This isn't always
correct, we should use a SYSFW specific variable in case the
UBOOT names are changed.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 1bb4fd3e..1b2ea184 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -37,6 +37,8 @@ SYSFW_PREFIX_am62xx-evm-k3r5 = "fs"
 
 SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
 
+SYSFW_TIBOOT3 = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.bin"
+
 SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_IMAGE = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
@@ -78,10 +80,9 @@ do_install() {
 		fi
 	fi
 
-	if [ -f "${WORKDIR}/imggen/${UBOOT_BINARY}" ]; then
-		install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-		ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-		ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+	if [ -f "${WORKDIR}/imggen/${SYSFW_TIBOOT3}" ]; then
+		install -m 644 ${WORKDIR}/imggen/${SYSFW_TIBOOT3} ${D}/boot/${SYSFW_TIBOOT3}
+		ln -sf ${SYSFW_TIBOOT3} ${D}/boot/tiboot3.bin
 	fi
 }
 
@@ -100,10 +101,9 @@ do_deploy () {
 		fi
 	fi
 
-	if [ -f "${WORKDIR}/imggen/${UBOOT_BINARY}" ]; then
-		install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-		ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-		ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	if [ -f "${WORKDIR}/imggen/${SYSFW_TIBOOT3}" ]; then
+		install -m 644 ${WORKDIR}/imggen/${SYSFW_TIBOOT3} ${DEPLOYDIR}/${SYSFW_TIBOOT3}
+		ln -sf ${SYSFW_TIBOOT3} ${DEPLOYDIR}/tiboot3.bin
 	fi
 
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-- 
2.36.1


