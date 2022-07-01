Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61962CCA480
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 22:02:42 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.44026.1656712952555760164
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Jul 2022 15:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vOvyfOmm;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 261M2UHQ129181;
	Fri, 1 Jul 2022 17:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656712950;
	bh=ZCNfbExk2scFWqmeGbV4Z25YpPazDHcsrJN+LQoAx2c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vOvyfOmmsUGOnUy9Jk8EV0NrsYmTS/u+rP5AUa5rSTjoup6O5XtW8gZnoSQETtx0V
	 rRwV7OGhYNMWloexekLkFUcNMQKMgvw4UHAWIJDKUHARUOm1SCm2j/BxK8Xy3KOYSH
	 kKweRkDs0cdN0zM/pBNLuSaF0LReF8V43XZ/NyXA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 261M2U9U123561
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Jul 2022 17:02:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 1
 Jul 2022 17:02:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 1 Jul 2022 17:02:30 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 261M2SS6029974;
	Fri, 1 Jul 2022 17:02:29 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][RFC 3/6] ti-sci-fw: Deploy all SYSFW firmware
 types
Date: Fri, 1 Jul 2022 17:02:25 -0500
Message-ID: <20220701220228.5449-4-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701220228.5449-1-afd@ti.com>
References: <20220701220228.5449-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Jul 2022 22:02:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14863

This allows us to rebuild and re-sign the SYSFW image if needed from
the deploy directory for any SoC type.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 28 +++++++++++---------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index d1f2859e..1bb4fd3e 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -22,24 +22,20 @@ TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
 SYSFW_SOC ?= "unknown"
-SYSFW_CONFIG ?= "unknown"
-
-SYSFW_PREFIX = "ti-sci-firmware"
-SYSFW_PREFIX_j7-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX_j7-hs-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
-SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX_j7200-hs-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX_j721s2-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX_am62xx-evm-k3r5 = "ti-fs-firmware"
-
 SYSFW_SUFFIX ?= "unknown"
+SYSFW_CONFIG ?= "unknown"
 
-SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
-SYSFW_BASE_append = "${@['','*']['${SYSFW_SUFFIX}' == 'hs']}"
-
-SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}.bin"
+SYSFW_PREFIX = "sci"
+SYSFW_PREFIX_j7-evm-k3r5 = "fs"
+SYSFW_PREFIX_j7-hs-evm-k3r5 = "fs"
+SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "fs"
+SYSFW_PREFIX_j7200-evm-k3r5 = "fs"
+SYSFW_PREFIX_j7200-hs-evm-k3r5 = "fs"
+SYSFW_PREFIX_j721s2-evm-k3r5 = "fs"
+SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
+SYSFW_PREFIX_am62xx-evm-k3r5 = "fs"
+
+SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
 
 SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-- 
2.36.1


