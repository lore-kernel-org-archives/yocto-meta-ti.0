Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F81C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 07:01:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.5683.1718348496914675294
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 00:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NBynGIi4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45E71aFq094614
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Jun 2024 02:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718348496;
	bh=BMNpmnaKzqfN/JPW0dxifi4yj7E0DAro2hTGpt4mh/g=;
	h=From:To:CC:Subject:Date;
	b=NBynGIi42xOI6jHJFlWE32wouq4Q7v8tAaUT2rG+V4WSIzwKDHJX1fSkFuC0ap4oW
	 PejDdjSXMjv1c+QuzZkiPI5C4di12xR8UbrZfYH4h/U9t5Z/NgK0fxeAQoa1LuXnar
	 fmKwpDB6EVcFeU2Z2oiTN2O1O70WHzi7bqlDIyoI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45E71add032226
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Jun 2024 02:01:36 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Jun 2024 02:01:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Jun 2024 02:01:36 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45E71ZkM107142;
	Fri, 14 Jun 2024 02:01:35 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>,
        Vignesh
	<vigneshr@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: Update UBOOT_MACHINE for am62xxsip-evm
Date: Fri, 14 Jun 2024 12:31:23 +0530
Message-ID: <20240614070123.1155319-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Jun 2024 07:01:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17730

Modify the U-Boot defconfig names for A53 and R5
machine configurations based on ti-u-boot-2024.04 [1]

[1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2024.04&id=df5181f8c6c41bf018ec043d565581b5d8a291c5

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 7 +------
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 2 +-
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
index 0daff2b9..c35edc6e 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -8,9 +8,4 @@ SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
-UBOOT_MACHINE = "am62x_evm_r5_defconfig"
-
-# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
-# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
-# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
-UBOOT_CONFIG_FRAGMENTS = "am62xsip_sk_r5.config"
+UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index b5dd18f1..38fe04c9 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -13,4 +13,4 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
 "
 
-UBOOT_MACHINE = "am62x_evm_a53_defconfig"
+UBOOT_MACHINE = "am62xsip_evm_a53_defconfig"
-- 
2.34.1


