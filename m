Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B9AC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:20:04 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5179.1720077596828404917
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Jul 2024 00:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hH/QFSfC;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4647JtZT080101
	for <meta-ti@lists.yoctoproject.org>; Thu, 4 Jul 2024 02:19:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720077595;
	bh=EIn/U1wkiKekXEAZ3wa/8tYgRpcmADmr6vXUZ94Vxp0=;
	h=From:To:CC:Subject:Date;
	b=hH/QFSfC1H4C/Ppyf0rkRQrDxX8kq8YriIGbnSE87BBHiKdsN8to+C2c6TGSx1/3t
	 1WCWxs3/VmQyox3x2+TGfVlKPJ8CJCnpjAqewneVwXuxMh8iWisEpVKOlGLR87g9y7
	 Hyz9Y2kOcpoZH16/v9Y1LnAfAm2LSpFb/9iSwKlM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4647JtYc117458
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 4 Jul 2024 02:19:55 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 4
 Jul 2024 02:19:55 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 4 Jul 2024 02:19:55 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4647Js6K092152;
	Thu, 4 Jul 2024 02:19:55 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>,
        Devarsh
	<devarsht@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: Update am62pxx-evm for multi-BSP support
Date: Thu, 4 Jul 2024 12:49:35 +0530
Message-ID: <20240704071935.840815-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 Jul 2024 07:20:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17820

- In ti-u-boot-2024.04, the config fragment to disable splashscreen
is now renamed to am62x_evm_prune_splashscreen.config [1]
Hence, update UBOOT_CONFIG_FRAGMENTS for the same.

- Add UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 which ensures that
am62pxx-evm machine configuration still supports Display Cluster usecase [2]
with ti-u-boot-2023.04

[1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2024.04&id=981eddc83dfdbbf176a4984977f9779dc1d56f87

[2]: https://software-dl.ti.com/mcu-plus-sdk/esd/AM62PX/09_01_00_39/exports/docs/api_guide_am62px/EXAMPLES_DRIVERS_DSS_DISPLAY_SHARE.html

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/am62pxx-evm.conf | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index fab96bd8..8d94c2b4 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -22,5 +22,7 @@ UBOOT_MACHINE = "am62px_evm_a53_defconfig"
 # along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
 # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
 # For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
-# Hence, disable the A53 based splash screen using the am62px_evm_prune_splashscreen.config fragment present in ti-u-boot tree
-UBOOT_CONFIG_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62px_evm_prune_splashscreen.config', '', d)}"
+# Hence, disable the A53 based splash screen using the am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
+UBOOT_CONFIG_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
+
+UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62px_evm_prune_splashscreen.config', '', d)}"
-- 
2.34.1


