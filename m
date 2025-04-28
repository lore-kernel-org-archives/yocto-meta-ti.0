Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D160C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:42:19 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.48586.1745847730229094086
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Apr 2025 06:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YNr2KNCc;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SDg7WW3558448
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 08:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745847727;
	bh=ejMTV87MvLoO2D4d8xlJV9FkGY+iQOR4wv8/w57ZKnQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YNr2KNCckAx+vljveB/VvFZ4JwRGT5n4o0FxUpMD1dCziRPoGvIMop8LjyDKOP1C1
	 6XO4K34FQOnNZwNlBtf/duLrblFWQlSlTA87aI2wX8NwP8VAb8m6zy0ZdYda08MGaD
	 75F76qpzdCnZXCon2jrEU2UgldhO9r+khMVMrahA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SDg7d4098405
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 08:42:07 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 08:42:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 08:42:07 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SDg6Df018776;
	Mon, 28 Apr 2025 08:42:07 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH 2/2] recipes-bsp: Add DM_FIRMWARE override for am62axx
Date: Mon, 28 Apr 2025 19:11:52 +0530
Message-ID: <20250428134152.1921752-3-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428134152.1921752-1-c-shilwant@ti.com>
References: <20250428134152.1921752-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Apr 2025 13:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18520

* With [0], the EdgeAI DM R5 firmware for am62axx will now be
maintained at ti-linux-firmware. Until now, the same firmware was
maintained on psdk_fw [1] with a different name & fetched in TI SDK
via meta-edgeai [2]

* Hence, add a am62axx specific override for DM_FIRMWARE inorder to
match the firmware name as maintained in "ti-dm/am62axx" of
ti-linux-firmware.

[0]: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=eee26bfeb6469af30e5309ba8859e9b65670fcc3

[1]: https://git.ti.com/cgit/processor-sdk/psdk_fw/

[2]: https://git.ti.com/cgit/edgeai/meta-edgeai/tree/recipes-tisdk/ti-psdk-rtos/ti-edgeai-firmware.bb?h=EDGEAI_CICD_20250417

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb | 1 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index 638138f4..a7d15e30 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -39,6 +39,7 @@ DM_FW_DIR = "ti-dm/${PLAT_SFX}"
 INSTALL_DM_FW_DIR  = "${nonarch_base_libdir}/firmware/${DM_FW_DIR}"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
+DM_FIRMWARE:am62axx = "dm_edgeai_mcu1_0_release_strip.out"
 
 DM_FW_LIST = ""
 DM_FW_LIST:j721e =   "${DM_FIRMWARE}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index e337f84f..57bf7a4e 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -45,6 +45,7 @@ DEPENDS:append:j721s2 = " ti-hsm-demo-fw"
 DEPENDS:append:j784s4 = " ti-hsm-demo-fw"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
+DM_FIRMWARE:am62axx = "dm_edgeai_mcu1_0_release_strip.out"
 
 PLAT_SFX = ""
 PLAT_SFX:j721e = "j721e"
-- 
2.34.1


