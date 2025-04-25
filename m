Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1803C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 20:49:21 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.1287.1745614154502899858
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Apr 2025 13:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aNEbvMen;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKnA6e2883164
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 15:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745614150;
	bh=KuVmUnmOIi2EIVoToaBT4KKdRg6M6dIAHgWyrvqNfvA=;
	h=From:To:CC:Subject:Date;
	b=aNEbvMen1Y8qjlnI0hCVQT5HiRAsnFvE5+sz++eSzRd0wlIFHYpjaCq6BlY0iXX6e
	 lcF3Aia8yfBoFw0Gubqv2Z74IA4Ibq1dnCkBLD/J1tkzw/wGDsrRWDteOCvMRZewKo
	 2XC/fkAf/aUMhatdBcOXDNr3lrKMaTb3sGnfJojs=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKnAYx061428
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 15:49:10 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 15:49:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 15:49:10 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PKn9YT070099;
	Fri, 25 Apr 2025 15:49:10 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Andrew
	<afd@ti.com>, Neha <n-francis@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] recipes-bsp: u-boot: Fix PACKAGECONFIG[dm] arguments
Date: Sat, 26 Apr 2025 02:18:57 +0530
Message-ID: <20250425204857.3271868-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Apr 2025 20:49:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18511

* As observed in the u-boot makefile [0][1], the argument
anticipated by u-boot binman is "TI_DM" instead of "DM".
Hence, fix the same in meta-ti-bsp.

* The behavior went unnoticed until now because "ti-dm"
was still being sourced from BINMAN_INDIRS, which referred
to "ti-linux-firmware" and the PACKAGECONFIG[dm] feature
was redundant.

[0]: https://github.com/u-boot/u-boot/blob/v2025.01/Makefile#L1408

[1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/Makefile?h=ti-u-boot-2025.01#n1409

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 9a74b840..e337f84f 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -63,7 +63,7 @@ PLAT_SFX:am62pxx = "am62pxx"
 PACKAGECONFIG[ap-trusted-rom] = "BL1=${STAGING_DIR_HOST}/firmware/bl1.bin,,trusted-firmware-a"
 PACKAGECONFIG[atf] = "BL31=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
 PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
-PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
+PACKAGECONFIG[dm] = "TI_DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
 
 PACKAGECONFIG:append:aarch64 = " atf optee"
 PACKAGECONFIG:append:j721e = " dm"
-- 
2.34.1


