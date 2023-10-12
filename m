Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB45CDB482
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:30:23 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.18534.1697131821051375453
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 10:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jtvlFp3j;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39CHUKNe115566
	for <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 12:30:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697131820;
	bh=IDui1jL8wLJEMIS5hlkEY6ZV9HCGn5aV8mp02Ezf/kE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jtvlFp3jauyGsjy6DSQ4bEgaad3LD+oJWL+b67bm2ho0TPqgKypkTgMmy77y82djg
	 0IWy+idwxORXv4eSSkKWycMfBoA0fGU9pDiWFqzoTsXCcbii+9BPpY984c/9KQ8tBB
	 Sj5oWc0WLfnzY4uRim0MGSaJKq9EhATIOtSxaogI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39CHUKAU126491
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 12:30:20 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Oct 2023 12:30:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Oct 2023 12:30:19 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39CHU546065173;
	Thu, 12 Oct 2023 12:30:17 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <d-gole@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>,
        <vigneshr@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/2] Revert "recipes-bsp: u-boot-ti.inc: Remove ti-sci-fw from DEPENDS for k3 machine"
Date: Thu, 12 Oct 2023 22:59:47 +0530
Message-ID: <20231012172947.1359231-3-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012172947.1359231-1-a-limaye@ti.com>
References: <20231012172947.1359231-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 17:30:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17098

This reverts commit cd13cafd659f7784f4131fd0bafb8a3c7c9ef126.
Some devices need ti-fs-stub-* firmware for the uboot aarch64 build

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 355e9868..99a2daeb 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -30,6 +30,7 @@ DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-se
 DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-native"
 
 # SYSFW/TIFS Firmware
+DEPENDS:append:k3 = " ti-sci-fw"
 DEPENDS:append:k3r5 = " ti-sci-fw"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
-- 
2.34.1


