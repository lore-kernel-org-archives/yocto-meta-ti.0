Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAACCC3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 09:10:33 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.72255.1746522629817099100
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 May 2025 02:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gXku9IL8;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5469ASZp1008489
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 04:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746522628;
	bh=Ym/5AdRrIm4qdcJOO5ELDZdFQ8MXaT7wuzU0TL9cgaA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gXku9IL8HRfnkcUxyCluhW4TXlJLO8sEwla5GQANOfQnOrWU0fk2mGBXcaeMaFR7N
	 0U4TV6HuD8Ed/+dl5iP7Z4TEe9+nXajHULLiHszQOBiKbeQQlOopMJE8rrT49RCMvE
	 WfCGMt/ldFfihQ0bF6L39Lncp++Cs5D91W+5MmzE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5469ASDA124874
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 04:10:28 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 04:10:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 04:10:28 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5469ARuV129016;
	Tue, 6 May 2025 04:10:27 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH 1/1] recipes-bsp: Add DM_FIRMWARE override for am62pxx display cluster
Date: Tue, 6 May 2025 14:40:15 +0530
Message-ID: <20250506091015.4049616-2-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506091015.4049616-1-c-shilwant@ti.com>
References: <20250506091015.4049616-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 May 2025 09:10:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18533

* For AM62P display cluster usecase, we need to pick
"dss_display_share.wkup-r5f0_0.release.strip.out" from ti-linux-firmware [0]
Hence, pick the display cluster firmware only when DISPLAY_CLUSTER_ENABLE is set to 1.

* When DISPLAY_CLUSTER_ENABLE is not set to 1, fallback to pick the "ipc_echo_testb_mcu1_0_release_strip.xer5f"
DM firmware.

[0]: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tree/ti-dm/am62pxx?h=11.00.12

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb | 1 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index a7d15e30..eaa82a62 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -40,6 +40,7 @@ INSTALL_DM_FW_DIR  = "${nonarch_base_libdir}/firmware/${DM_FW_DIR}"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 DM_FIRMWARE:am62axx = "dm_edgeai_mcu1_0_release_strip.out"
+DM_FIRMWARE:am62pxx = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'dss_display_share.wkup-r5f0_0.release.strip.out', 'ipc_echo_testb_mcu1_0_release_strip.xer5f', d)}"
 
 DM_FW_LIST = ""
 DM_FW_LIST:j721e =   "${DM_FIRMWARE}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 57bf7a4e..6b7e2bea 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -46,6 +46,7 @@ DEPENDS:append:j784s4 = " ti-hsm-demo-fw"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 DM_FIRMWARE:am62axx = "dm_edgeai_mcu1_0_release_strip.out"
+DM_FIRMWARE:am62pxx = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'dss_display_share.wkup-r5f0_0.release.strip.out', 'ipc_echo_testb_mcu1_0_release_strip.xer5f', d)}"
 
 PLAT_SFX = ""
 PLAT_SFX:j721e = "j721e"
-- 
2.34.1


