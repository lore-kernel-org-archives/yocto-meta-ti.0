Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41785C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 19:30:09 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1518.1751052606655949144
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 12:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BAPv1Trx;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RJU5ZA2828576;
	Fri, 27 Jun 2025 14:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751052605;
	bh=d375Ei1aWfhDWH7s185gb2XePoH4flqkOHQWijmFaOc=;
	h=From:To:CC:Subject:Date;
	b=BAPv1Trxd3krNElp6fZDRES9pg4MfXiFUK0GUYNhzgN5oRZinm/Xe75NsNyvdZzyv
	 jSdw86LtlSA1MjQAmPNQwXvb+eH6ljJvwivRyJEXpdlEWH94gCQsGLTD+MR1Dbos+r
	 MLorroOtJkUu2AIQRg34kMcP8cRj7jl2yAOteneI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RJU5Qu734987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 14:30:05 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 14:30:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 14:30:04 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RJU4l63330306;
	Fri, 27 Jun 2025 14:30:04 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 1/2] meta-ti-bsp: conf: machine: Deploy all versions of tiboot3.bin
Date: Fri, 27 Jun 2025 14:30:02 -0500
Message-ID: <20250627193003.575911-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 19:30:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18709

For some version of U-Boot some versions of tiboot3.bin were not
available. This has since been fixed and now all versions of U-Boot
that are supported here have all versions of tiboot3.bin. Deploy
these all here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/j7200.inc |  8 ++------
 meta-ti-bsp/conf/machine/include/j721e.inc | 19 +++++++++----------
 meta-ti-bsp/conf/machine/include/j722s.inc |  5 +----
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
index 3cba71b6..e7ab409f 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -7,14 +7,10 @@ SOC_FAMILY:append = ":j7200"
 IMAGE_BOOT_FILES += "tiboot3-j7200-gp-evm.bin"
 
 # Since default tiboot3.bin on J7200 is for GP, add a version for SR1.0 HS-FS
-IMAGE_SR1_HS_FS_FILES = "tiboot3-j7200-hs-fs-evm.bin"
-IMAGE_SR1_HS_FS_FILES:bsp-mainline = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_FS_FILES}"
+IMAGE_BOOT_FILES += "tiboot3-j7200-hs-fs-evm.bin"
 
 # Since default tiboot3.bin on J7200 is for GP, add a version for SR1.0 HS-SE
-IMAGE_SR1_HS_SE_FILES = "tiboot3-j7200-hs-evm.bin"
-IMAGE_SR1_HS_SE_FILES:bsp-mainline = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_SE_FILES}"
+IMAGE_BOOT_FILES += "tiboot3-j7200-hs-evm.bin"
 
 # Since default tiboot3.bin on J7200 is for GP, add a version for SR2.0 HS-FS
 IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-fs-evm.bin"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 30aa2a69..3a5a9af6 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -15,22 +15,21 @@ IMAGE_BOOT_FILES += "tiboot3-j721e-gp-evm.bin"
 IMAGE_BOOT_FILES += "sysfw-j721e-gp-evm.itb"
 
 # Since default on J721e is for GP, add a version for SR1.1 HS-FS
-IMAGE_SR1_1_HS_FS_FILES = "tiboot3-j721e_sr1_1-hs-fs-evm.bin sysfw-j721e_sr1_1-hs-fs-evm.itb"
-IMAGE_SR1_1_HS_FS_FILES:bsp-mainline = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR1_1_HS_FS_FILES}"
+IMAGE_BOOT_FILES += "tiboot3-j721e_sr1_1-hs-fs-evm.bin"
+IMAGE_BOOT_FILES += "sysfw-j721e_sr1_1-hs-fs-evm.itb"
 
 # Since default on J721e is for GP, add a version for SR1.1 HS-SE
-IMAGE_SR1_1_HS_SE_FILES = "tiboot3-j721e_sr1_1-hs-evm.bin sysfw-j721e_sr1_1-hs-evm.itb"
-IMAGE_BOOT_FILES += "${IMAGE_SR1_1_HS_SE_FILES}"
+IMAGE_SR1_1_HS_SE_FILES = " "
+IMAGE_BOOT_FILES += "tiboot3-j721e_sr1_1-hs-evm.bin"
+IMAGE_BOOT_FILES += "sysfw-j721e_sr1_1-hs-evm.itb"
 
 # Since default on J721e is for GP, add a version for SR2.0 HS-FS
-IMAGE_SR2_HS_FS_FILES = "tiboot3-j721e_sr2-hs-fs-evm.bin sysfw-j721e_sr2-hs-fs-evm.itb"
-IMAGE_BOOT_FILES += "${IMAGE_SR2_HS_FS_FILES}"
+IMAGE_BOOT_FILES += "tiboot3-j721e_sr2-hs-fs-evm.bin"
+IMAGE_BOOT_FILES += "sysfw-j721e_sr2-hs-fs-evm.itb"
 
 # Since default on J721e is for GP, add a version for SR2.0 HS-SE
-IMAGE_SR2_HS_SE_FILES = "tiboot3-j721e_sr2-hs-evm.bin sysfw-j721e_sr2-hs-evm.itb"
-IMAGE_SR2_HS_SE_FILES:bsp-mainline = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR2_HS_SE_FILES}"
+IMAGE_BOOT_FILES += "tiboot3-j721e_sr2-hs-evm.bin"
+IMAGE_BOOT_FILES += "sysfw-j721e_sr2-hs-evm.itb"
 
 TFA_BOARD = "generic"
 
diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
index e0b77d96..d49da340 100644
--- a/meta-ti-bsp/conf/machine/include/j722s.inc
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -12,10 +12,7 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
 
 # Since default tiboot3.bin on J722S is for HS-FS, add a version for HS-SE
-IMAGE_SR1_HS_SE_FILES = "tiboot3-j722s-hs-evm.bin"
-IMAGE_SR1_HS_SE_FILES:bsp-mainline = ""
-IMAGE_SR1_HS_SE_FILES:bsp-next = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_SE_FILES}"
+IMAGE_BOOT_FILES += "tiboot3-j722s-hs-evm.bin"
 
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
-- 
2.39.2


