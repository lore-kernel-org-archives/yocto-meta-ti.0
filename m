Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75740D5D687
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 19:35:22 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1391.1731008119711728273
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Nov 2024 11:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nVQEXCfY;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A7JZGNg052739;
	Thu, 7 Nov 2024 13:35:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731008116;
	bh=DpRowLga/Ysqk0WiE7fAalfKFRIidbPzBEptVx4apDk=;
	h=From:To:CC:Subject:Date;
	b=nVQEXCfYWf7Pf53JhelP0TqwA1vrcrp85pVfQOwHjt7nPse1RFr43mKyT++zKHOEJ
	 xwEDq5Lt2K0GGHmiuvwwQxglXmeirJNL8CQIHGeLiiDv/OP0cJKJ1XUgGDJoMhB9EC
	 PN2JqJkzgMTIAHfCAr+yfz9CiAHHM+YCFlF3tJAc=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A7JZGIh096109
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Nov 2024 13:35:16 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 7
 Nov 2024 13:35:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 7 Nov 2024 13:35:15 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A7JZFgp115250;
	Thu, 7 Nov 2024 13:35:15 -0600
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>, <mike@mdb977.de>
Subject: [meta-ti][scarthgap/master][PATCHv2] sgx: bump version for kernel 6.6 / mesa 23.2.1
Date: Thu, 7 Nov 2024 13:33:32 -0600
Message-ID: <20241107193330.935900-3-rs@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 07 Nov 2024 19:35:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18052

From: Randolph Sapp <rs@ti.com>

Bump versions of mesa-pvr and ti-sgx-ddk-km to support SGX with kernel
6.6 and the same version of mesa rogue is using.

Enable SGX by default in the 6.6 BSP provider section logic.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

v2: address qa issues by passing yocto kernel_* variables through to our build
scripts

 meta-ti-bsp/conf/machine/include/ti-bsp.inc            |  4 +++-
 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb      | 10 +++++++++-
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb   |  2 +-
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index d27bbe3c..814c6ca8 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -57,7 +57,9 @@ BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6.%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_6 = "u-boot-ti-staging"
 BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
 
-# Only Rogue is enabled so far, SGX falls back to SW rendering
+BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-ti-6_6 = "1.17%"
+BSP_SGX_UMLIBS_VERSION:bsp-ti-6_6 = "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 = "24%"
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 100c10c1..5e9c6e6e 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "652ae16657cc4acda664e669d0c9b4891252f37f"
+SRCREV = "3005cf8145a6720daa47e4e273f9e421ff77cb58"
 
 TARGET_PRODUCT:omap-a15 = "ti572x_linux"
 TARGET_PRODUCT:ti33x = "ti335x_linux"
@@ -31,6 +31,14 @@ PVR_WS = "lws-generic"
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} \
 WINDOW_SYSTEM=${PVR_WS} PVR_BUILD_DIR=${TARGET_PRODUCT}'
 
+# There are useful flags here that are interpreted by the final kbuild pass
+# These variables are not necessary when compiling outside of Yocto
+export KERNEL_CC
+export KERNEL_LD
+export KERNEL_AR
+export KERNEL_OBJCOPY
+export KERNEL_STRIP
+
 do_install() {
     make -C ${STAGING_KERNEL_DIR} M=${B}/eurasiacon/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_armhf/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
 }
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
index 21134bc7..fa765a64 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
@@ -25,7 +25,7 @@ PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
 "
 
-SRCREV = "b12290126ba6a154f0e8b0a8c8b2b0d64f98e427"
+SRCREV = "0e75e7ded360ea6aee4140393b30960e152f3994"
 PV = "23.2.1"
 
 PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
-- 
2.47.0


