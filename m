Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE95DC369DC
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:42:09 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.48673.1745847727185715922
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Apr 2025 06:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LaOSUADu;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SDg5hB2806751
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 08:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745847725;
	bh=pfXvfHncE5WPuGUyRFTC25w/1RWP7qIixK9vY78EZWI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LaOSUADuesPOe3P6PGzoipuPebc/b4g2k/Xb9IZ8d/+MJA3ZuO+zC4NwcA3Fb1Elv
	 JWUsMAVRAXfCiiR0wKOnsyX3SRXrOV8m2qkH5YoxqFe1gwcYI/FpzcLecZzfMfYf/P
	 GM2/IGljPkaqS+bBl9ifcORIn6m7TpKk5VoUQsac=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SDg5la098375
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 08:42:05 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 08:42:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 08:42:04 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SDg3F9018723;
	Mon, 28 Apr 2025 08:42:04 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH 1/2] recipes-ti: ti-rtos-firmware: Add C7X_1_FW override for am62axx
Date: Mon, 28 Apr 2025 19:11:51 +0530
Message-ID: <20250428134152.1921752-2-c-shilwant@ti.com>
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
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Apr 2025 13:42:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18519

* With [0], the C7x IPC EdgeAI firmware for am62axx will now be
maintained at ti-linux-firmware. Until now, the same firmware was
maintained on psdk_fw [1] with a different name & fetched in TI SDK
via meta-edgeai [2].

* Hence, add a am62axx specific override for C7X_1_FW inorder to
match the firmware name as maintained in "ti-ipc/am62axx" of
ti-linux-firmware.

[0]: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=1e5d64d9385d6472d29e11ac7021765004ddff27

[1]: https://git.ti.com/cgit/processor-sdk/psdk_fw/

[2]: https://git.ti.com/cgit/edgeai/meta-edgeai/tree/recipes-tisdk/ti-psdk-rtos/ti-edgeai-firmware.bb?h=EDGEAI_CICD_20250417

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 00112017..e5cb18c2 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -48,6 +48,7 @@ MCU_4_1_FW = "ipc_echo_test_mcu4_1_release_strip.xer5f"
 C66_1_FW   = "ipc_echo_test_c66xdsp_1_release_strip.xe66"
 C66_2_FW   = "ipc_echo_test_c66xdsp_2_release_strip.xe66"
 C7X_1_FW   = "ipc_echo_test_c7x_1_release_strip.xe71"
+C7X_1_FW:am62axx   = "dsp_edgeai_c7x_1_release_strip.out"
 C7X_2_FW   = "ipc_echo_test_c7x_2_release_strip.xe71"
 C7X_3_FW   = "ipc_echo_test_c7x_3_release_strip.xe71"
 C7X_4_FW   = "ipc_echo_test_c7x_4_release_strip.xe71"
-- 
2.34.1


