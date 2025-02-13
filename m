Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F779C021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 23:48:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.8737.1739490505322475312
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 15:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NrGO6DP0;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51DNmOGu838152
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2025 17:48:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739490504;
	bh=SsERiVMLYyfJYTl6Chb/1LJqmomOZ/2iflIA0AVAhmU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NrGO6DP0FbV6DM6k49V8r57Rd3eyaKcdmM5LYV7mRUglAZV658YIoP+oZ8wdUmQ5U
	 X4yYh7MAZXjozvI91LAJ+wvr0iUu1PEQPgxyEHzFEa9xnbdrF8TU51M8Rk+clDu5aW
	 PAa9CJw8a8lCNlXUqyeEDv1hPFi+ESqXz0W8lkzg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51DNmOlG085328
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Feb 2025 17:48:24 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Feb 2025 17:48:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Feb 2025 17:48:23 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DNmNcR056749;
	Thu, 13 Feb 2025 17:48:23 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][scarthgap][PATCH 6/7] ti-sgx-ddk-km: bump revision for kernel 6.12
Date: Thu, 13 Feb 2025 17:48:12 -0600
Message-ID: <20250213234813.3618729-7-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213234813.3618729-1-rs@ti.com>
References: <20250213234813.3618729-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2025 23:48:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18310

From: Randolph Sapp <rs@ti.com>

Bump the source revision to allow this module to work on kernel 6.12.
Originally this was going to be a separate branch, but considering the
bsp selector logic, this makes just as much sense.

Also enable the sgx driver in the ti_6.12 bsp selector.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc                | 7 +++----
 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb          | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 796564b8..054aa6cb 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -50,15 +50,14 @@ BSP_KERNEL_VERSION:bsp-ti-6_12 = "6.12%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_12 = "u-boot-ti-staging"
 BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2025.01%"
 
+BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-ti-6_12 = "1.17%"
+BSP_SGX_UMLIBS_VERSION:bsp-ti-6_12 = "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "24%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_12 = "24%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_12 = "24%"
 
-# GPU support requires out-of-tree SGX and Rogue drivers not available
-# in 6.12 yet
-MACHINE_FEATURES:remove:bsp-ti-6_12 = "gpu"
-
 # ==========
 # ti-6_6
 # TI staging kernel 6.6, u-boot 2024.04
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 5e9c6e6e..49376221 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "3005cf8145a6720daa47e4e273f9e421ff77cb58"
+SRCREV = "f555b9e1ae4b2baf68ac778ca41dc0c17e96f89a"
 
 TARGET_PRODUCT:omap-a15 = "ti572x_linux"
 TARGET_PRODUCT:ti33x = "ti335x_linux"
-- 
2.48.1


