Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD72C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 21:25:12 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.3130.1659734705017355324
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Aug 2022 14:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Uv7N6mN4;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 275LP4FY064286;
	Fri, 5 Aug 2022 16:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659734704;
	bh=iUdjG9/fZD9f7twNsFMt4bK2NDHu3ygh5JLNBwKDBaE=;
	h=From:To:CC:Subject:Date;
	b=Uv7N6mN4iTbhKM/HXjeJ4RInciIODebfuseUSiYudeCIQzZ2fOTOa0tvnFPRCQgni
	 TQGkmV2w4LSGcIDeR74ehqVMpy9ybLhd1PAEukTs2S/KPZWh6J/vEC0PbS2ZKD/vxi
	 y5xEGCgze3AR1Silv/SuzqVvVWyycVVZsU7W7J3o=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 275LP4Hi117451
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Aug 2022 16:25:04 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 5
 Aug 2022 16:25:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 5 Aug 2022 16:25:03 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 275LP3rK056480;
	Fri, 5 Aug 2022 16:25:03 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH] u-boot-ti-staging: Update to the latest
 ti-u-boot-2021.01
Date: Fri, 5 Aug 2022 16:25:02 -0500
Message-ID: <20220805212502.24330-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Aug 2022 21:25:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14936

Update to the latest commit of ti-u-boot-2021.01.

As part of this U-Boot update the non-HS AM64x-evm defconfig was removed.
This is okay as building this defconfig without defining TI_SECURE_DEV_PKG
will still result in usable binaries for the non-HS devices. Use the
HS defconfig for both the HS and non-HS machines.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 conf/machine/am64xx-evm.conf                    | 4 ++++
 conf/machine/am64xx-hs-evm-k3r5.conf            | 2 +-
 conf/machine/am64xx-hs-evm.conf                 | 2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
index c6ba2a87..2cb7f55a 100644
--- a/conf/machine/am64xx-evm.conf
+++ b/conf/machine/am64xx-evm.conf
@@ -5,3 +5,7 @@
 require conf/machine/include/am64xx.inc
 
 UBOOT_MACHINE = "am64x_evm_a53_defconfig"
+
+SPL_BINARY = "tispl.bin_HS"
+UBOOT_BINARY = "u-boot.img_HS"
+UBOOT_SYMLINK = "u-boot.img"
diff --git a/conf/machine/am64xx-hs-evm-k3r5.conf b/conf/machine/am64xx-hs-evm-k3r5.conf
index 647c8beb..95e68751 100644
--- a/conf/machine/am64xx-hs-evm-k3r5.conf
+++ b/conf/machine/am64xx-hs-evm-k3r5.conf
@@ -9,4 +9,4 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 SYSFW_SYMLINK = ""
 
-UBOOT_MACHINE = "am64x_hs_evm_r5_defconfig"
+UBOOT_MACHINE = "am64x_evm_r5_defconfig"
diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
index 3ab9a49e..614eba4b 100644
--- a/conf/machine/am64xx-hs-evm.conf
+++ b/conf/machine/am64xx-hs-evm.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/am64xx.inc
 
-UBOOT_MACHINE = "am64x_hs_evm_a53_defconfig"
+UBOOT_MACHINE = "am64x_evm_a53_defconfig"
 
 UBOOT_ENTRYPOINT =       "0x80080000"
 UBOOT_LOADADDRESS =      "0x80080000"
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 5560d1a1..bac87cf4 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r32"
+PR = "r33"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "a3f87b40a1b6744261d1ac351fe2566dbf64bc66"
+SRCREV = "1c29865c3106a1e6c8e2036601ff61a8bf70590b"
-- 
2.36.1


