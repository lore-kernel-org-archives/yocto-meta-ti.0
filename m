Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836ECE732C3
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 11:15:45 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.10957.1695899740114040764
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 28 Sep 2023 04:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jThyu7Fq;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38SBFdQM044746
	for <meta-ti@lists.yoctoproject.org>; Thu, 28 Sep 2023 06:15:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695899739;
	bh=LPo6IftdPGALsMhmwbbL28QcH9XjgnbZLggGz2OA6Tw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jThyu7FqNsL+b9L2A0ISp+RcBFW1f2v6w92OVWXMx7LacDzN8n25BbBlxQZRvlc33
	 m2eozX4DpCrD/Ln6F0/k4WZQPwlUBCKAobdcagxU8nta3ameGJDRGA10JqOI3mk/Eg
	 SCn8qA4Sd9S7m8c2Uin0zoSbl4bsaQyheG9BvNGY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38SBFdox010461
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 28 Sep 2023 06:15:39 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 28
 Sep 2023 06:15:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 28 Sep 2023 06:15:39 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38SBFQ0w018145;
	Thu, 28 Sep 2023 06:15:38 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/2] recipes-bsp: u-boot-ti.inc: Remove ti-sci-fw from DEPENDS for k3 machine
Date: Thu, 28 Sep 2023 16:44:55 +0530
Message-ID: <20230928111456.420785-2-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928111456.420785-1-a-limaye@ti.com>
References: <20230928111456.420785-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Sep 2023 11:15:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17020

ti-sci-fw should be needed by the binman u-boot build only for the k3r5
machines and not for the k3 machines

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 5292517b..c957feb0 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -30,7 +30,6 @@ DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-se
 DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-native"
 
 # SYSFW/TIFS Firmware
-DEPENDS:append:k3 = " ti-sci-fw"
 DEPENDS:append:k3r5 = " ti-sci-fw"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
-- 
2.34.1


