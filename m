Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACAFC02199
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 01:24:48 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.1173.1738977885362620251
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 17:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SC+ktAd9;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5181Ohwu3926725
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Feb 2025 19:24:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738977884;
	bh=dGmuAmJNfJqjQPP6HfaaWX453W5IvtboAfOrT3v/ZXI=;
	h=From:To:CC:Subject:Date;
	b=SC+ktAd9Cy5sDZD5TpByFha3MT7XFa0RyRmEdI10FQEia7abi5cTjWdPMku1+OmpI
	 jjdmlzHjDdW2beMd/oH9yOf/qxzUPvqnuGppj2YsKaBbCj43aUoNyv4jmpTB/egWRR
	 /RwyduN5Pi1Ph081MUX31q8i5OhYECGputSUv9wU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5181OheO032113
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Feb 2025 19:24:43 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Feb 2025 19:24:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Feb 2025 19:24:43 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5181Oh95113260;
	Fri, 7 Feb 2025 19:24:43 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][master][PATCH 1/2] ti-sgx-ddk-km: bump revision for kernel 6.12
Date: Fri, 7 Feb 2025 19:24:33 -0600
Message-ID: <20250208012434.2405458-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 08 Feb 2025 01:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18288

From: Randolph Sapp <rs@ti.com>

Bump the source revision to allow this module to work on kernel 6.12.
Originally this was going to be a separate branch, but considering the
bsp selector logic, this makes just as much sense.

Also enable the sgx driver in the ti_6.12 bsp selector.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc                | 7 +++----
 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb          | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 1e84d0fb..dd86dc30 100644
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
 # GC320 support requires out-of-tree drivers not yet available in 6.12
 MACHINE_FEATURES:remove:bsp-ti-6_12 = "gc320"
 
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


