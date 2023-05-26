Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13DAC7EE31
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 18:27:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1413.1685125656253342583
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 11:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=V8vLEPP8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34QIRZ7I072126;
	Fri, 26 May 2023 13:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685125655;
	bh=AzOZYE7eLqhr42KKoFZILIIbEGcAWQy3cuDKw0EzOMM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=V8vLEPP8L8NqRNzx3umbkCnSfZpmJSRaF5/XwdPfBQgzYgw9jkTn/fTVuUwqAoZZL
	 Lwv6SzSeNL+WqVQkc2nEdHlMbNc8ZOYLWw1DFEcUeA0697q8jlU5VlrPNM835VYMge
	 cdAS9+Ew//TI8RSZNgoUUBTOpMYogpxR+aHuZu/E=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34QIRZoM054630
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 13:27:35 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 13:27:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 13:27:35 -0500
Received: from fllv0040.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34QIRWlu013297;
	Fri, 26 May 2023 13:27:34 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 6/8] conf: machine: Do not override SPL_BINARY on AM65x and J721e
Date: Fri, 26 May 2023 13:27:29 -0500
Message-ID: <20230526182731.284783-6-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230526182731.284783-1-afd@ti.com>
References: <20230526182731.284783-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 May 2023 18:27:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16602

In U-Boot the names of these files have been updated to match our
expected defaults. Remove these fixups.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf    | 2 --
 meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf | 2 --
 meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf     | 2 --
 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf  | 2 --
 4 files changed, 8 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
index 2a7b5990..b1b2490e 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
@@ -8,6 +8,4 @@ SYSFW_SOC = "am65x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
-SPL_BINARY = "tiboot3.${SPL_SUFFIX}_unsigned"
-
 UBOOT_MACHINE = "am65x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
index 5ac0c578..4fb2bf50 100644
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
@@ -8,6 +8,4 @@ SYSFW_SOC = "am65x_sr2"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 
-SPL_BINARY = "tiboot3.${SPL_SUFFIX}"
-
 UBOOT_MACHINE = "am65x_hs_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
index d54af565..070bf7aa 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
@@ -8,6 +8,4 @@ SYSFW_SOC = "j721e"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
-SPL_BINARY = "tiboot3.${SPL_SUFFIX}_unsigned"
-
 UBOOT_MACHINE = "j721e_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
index c529985f..7904c660 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
@@ -8,6 +8,4 @@ SYSFW_SOC = "j721e_sr1_1"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 
-SPL_BINARY = "tiboot3.${SPL_SUFFIX}"
-
 UBOOT_MACHINE = "j721e_evm_r5_defconfig"
-- 
2.39.2


