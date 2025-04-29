Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868BBC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 15:17:54 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.1056.1745939866353012687
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Apr 2025 08:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sHwSdig4;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFHjg93129812
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 10:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745939865;
	bh=iUzrig7rbls3h+4vsKJznvPShl28y/XgeXDmIN2oj4w=;
	h=From:To:Subject:Date;
	b=sHwSdig4DTJwcInxBIsblmifzZ9EomtcfhaHWM+QkhMAnWKD7q8SvReghU/rtrK3r
	 AF8Bq2/JloNhw5pRWYH98u/NYh7RVVq6ryvBiQqLkSuVCo/uneB90/sIC1PtkMip6u
	 n7bam8pUDo57Beodhh1uDAOD6NhTERt+GQExbgTU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFHiEd001892
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 10:17:44 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 10:17:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 10:17:44 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TFHimn002442;
	Tue, 29 Apr 2025 10:17:44 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1u9miO-0005Vq-Ci; Tue, 29 Apr 2025 10:17:44 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2] recipes-ti: ti-rtos-echo-test-fw: Add C7X_1_FW override for am62axx
Date: Tue, 29 Apr 2025 10:17:44 -0500
Message-ID: <20250429151744.21150-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Apr 2025 15:17:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18523

From: Chirag Shilwant <c-shilwant@ti.com>

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
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Rebased on a missing patch.  The patched file changed locations and
names.

 .../ti-rtos-fw/ti-rtos-echo-test-fw.bb        | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
index 00112017..86e319c7 100644
--- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
@@ -37,20 +37,21 @@ IPC_FW_DIR = "ti-ipc/${PLAT_SFX}"
 
 INSTALL_IPC_FW_DIR = "${nonarch_base_libdir}/firmware/${IPC_FW_DIR}"
 
-MCU_1_0_FW = "ipc_echo_test_mcu1_0_release_strip.xer5f"
-MCU_1_1_FW = "ipc_echo_test_mcu1_1_release_strip.xer5f"
-MCU_2_0_FW = "ipc_echo_test_mcu2_0_release_strip.xer5f"
-MCU_2_1_FW = "ipc_echo_test_mcu2_1_release_strip.xer5f"
-MCU_3_0_FW = "ipc_echo_test_mcu3_0_release_strip.xer5f"
-MCU_3_1_FW = "ipc_echo_test_mcu3_1_release_strip.xer5f"
-MCU_4_0_FW = "ipc_echo_test_mcu4_0_release_strip.xer5f"
-MCU_4_1_FW = "ipc_echo_test_mcu4_1_release_strip.xer5f"
-C66_1_FW   = "ipc_echo_test_c66xdsp_1_release_strip.xe66"
-C66_2_FW   = "ipc_echo_test_c66xdsp_2_release_strip.xe66"
-C7X_1_FW   = "ipc_echo_test_c7x_1_release_strip.xe71"
-C7X_2_FW   = "ipc_echo_test_c7x_2_release_strip.xe71"
-C7X_3_FW   = "ipc_echo_test_c7x_3_release_strip.xe71"
-C7X_4_FW   = "ipc_echo_test_c7x_4_release_strip.xe71"
+MCU_1_0_FW =       "ipc_echo_test_mcu1_0_release_strip.xer5f"
+MCU_1_1_FW =       "ipc_echo_test_mcu1_1_release_strip.xer5f"
+MCU_2_0_FW =       "ipc_echo_test_mcu2_0_release_strip.xer5f"
+MCU_2_1_FW =       "ipc_echo_test_mcu2_1_release_strip.xer5f"
+MCU_3_0_FW =       "ipc_echo_test_mcu3_0_release_strip.xer5f"
+MCU_3_1_FW =       "ipc_echo_test_mcu3_1_release_strip.xer5f"
+MCU_4_0_FW =       "ipc_echo_test_mcu4_0_release_strip.xer5f"
+MCU_4_1_FW =       "ipc_echo_test_mcu4_1_release_strip.xer5f"
+C66_1_FW =         "ipc_echo_test_c66xdsp_1_release_strip.xe66"
+C66_2_FW =         "ipc_echo_test_c66xdsp_2_release_strip.xe66"
+C7X_1_FW =         "ipc_echo_test_c7x_1_release_strip.xe71"
+C7X_1_FW:am62axx = "dsp_edgeai_c7x_1_release_strip.out"
+C7X_2_FW =         "ipc_echo_test_c7x_2_release_strip.xe71"
+C7X_3_FW =         "ipc_echo_test_c7x_3_release_strip.xe71"
+C7X_4_FW =         "ipc_echo_test_c7x_4_release_strip.xe71"
 
 IPC_FW_LIST = ""
 IPC_FW_LIST:am65xx =  "${MCU_1_0_FW} ${MCU_1_1_FW}"
-- 
2.17.1


