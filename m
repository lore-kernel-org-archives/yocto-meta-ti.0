Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B371C64ED6
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 14:54:05 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.8830.1676386435768877496
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 06:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pZeA1noz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31EErrm3101578;
	Tue, 14 Feb 2023 08:53:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676386433;
	bh=TUPC9inbSw3m3u+jOCe5c4H85Ga2jvPCfr/Sd41vAbk=;
	h=From:To:CC:Subject:Date;
	b=pZeA1noz/mjfD4Da5Ik/84205EtmvMlpeMPTvnh06sCSDzkVNYciHk4qvE6GI30UQ
	 8vuSlm0lr6WYoiA/nW7iHMlqsKCk8S5um3/ykJSzJU8n8Y8W9U6FWwyGwskkeG+zKr
	 BvUVW+8QSP1PoT/cMDE0eeeGFLYK+4mf/M1Z8rZs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31EErrln076686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Feb 2023 08:53:53 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 14
 Feb 2023 08:53:53 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 14 Feb 2023 08:53:53 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31EErqPd048291;
	Tue, 14 Feb 2023 08:53:52 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/4] u-boot-ti: Do not depend on DM firmware for R5 builds
Date: Tue, 14 Feb 2023 08:53:49 -0600
Message-ID: <20230214145352.12093-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 14:54:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15838

This is not needed as the R5 builds do not use the firmware and can
cause issues as ti-rtos-firmware does not handle MULTICONFIG well.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index ae87ec6a..866c0314 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -33,11 +33,11 @@ PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/b
 PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE},,ti-rtos-firmware"
 
 PACKAGECONFIG:append:aarch64 = " atf optee"
-PACKAGECONFIG:append:j721e = " dm"
-PACKAGECONFIG:append:j7200 = " dm"
-PACKAGECONFIG:append:j721s2 = " dm"
-PACKAGECONFIG:append:j784s4 = " dm"
-PACKAGECONFIG:append:am62xx = " dm"
+PACKAGECONFIG:append:aarch64:j721e = " dm"
+PACKAGECONFIG:append:aarch64:j7200 = " dm"
+PACKAGECONFIG:append:aarch64:j721s2 = " dm"
+PACKAGECONFIG:append:aarch64:j784s4 = " dm"
+PACKAGECONFIG:append:aarch64:am62xx = " dm"
 
 COMPATIBLE_MACHINE = "(ti-soc)"
 
-- 
2.39.1


