Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9303C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:37:03 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.11078.1751377019363808810
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 06:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=t4H8Ikew;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: j-sahu@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561DawQL3630021
	for <meta-ti@lists.yoctoproject.org>; Tue, 1 Jul 2025 08:36:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751377018;
	bh=Vw/+Ov5O8hf0CO8sIKpE+7nZWNI+4oJTx7sYRbwj5HE=;
	h=From:To:CC:Subject:Date;
	b=t4H8IkeweGqcofJSLYfl5JDGuDiYOkCCuq75ZeMocIxNQNuuWkT6sOLRQVKdqfE2i
	 JSkirqLbDDo+XgLz015St57q52oj9w4vK5WrgK5KxmMOUiUvrLrrY5a10Ri+cSJ+h+
	 dD+Ceb/44JEKPHVF+ukO2khn5WZ8nLRpH0AS6wMw=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561DawjO4119810
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 1 Jul 2025 08:36:58 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 08:36:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 08:36:58 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.227.236])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561Daupf1639364;
	Tue, 1 Jul 2025 08:36:57 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Chirag <c-shilwant@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Sebin Francis
	<sebin.francis@ti.com>
Subject: [meta-ti][scarthgap][PATCH] trusted-firmware-a: add power state validation patch for K3 SoCs
Date: Tue, 1 Jul 2025 19:06:53 +0530
Message-ID: <20250701133654.2985866-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Jul 2025 13:37:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18741

This commit adds the TI power state validation patch for K3 SoCs to
ensure correct PSCI power state transitions when using the upstream
Trusted Firmware-A (TFA).
This patch is excluded from the am62lxx platform, which uses the
TI-maintained fork.

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 .../trusted-firmware-a-ti.inc                 |  7 +-
 ...e-power-state-validation-for-K3-SoCs.patch | 64 +++++++++++++++++++
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0001-feat-ti-enable-power-state-validation-for-K3-SoCs.patch

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index ec52d09c..588ee9d4 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -5,14 +5,19 @@ PV = "2.13+git"
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
 SRCREV_tfa = "d90bb650fe4cb3784f62214ab5829f4051c38d0a"
 SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https"
+TFA_TI_PATCH = "file://0001-feat-ti-enable-power-state-validation-for-K3-SoCs.patch"
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
 SRCREV_tfa:am62lxx = "2ab59f45ad0a5d95b5cb339c0f64686954377050"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
+TFA_TI_PATCH:am62lxx = ""
 SRCBRANCH:am62lxx = "ti-master"
 
-SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
+SRC_URI = " \
+    ${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH} \
+    ${TFA_TI_PATCH} \
+"
 
 COMPATIBLE_MACHINE = "k3"
 
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0001-feat-ti-enable-power-state-validation-for-K3-SoCs.patch b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0001-feat-ti-enable-power-state-validation-for-K3-SoCs.patch
new file mode 100644
index 00000000..0ed2a933
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0001-feat-ti-enable-power-state-validation-for-K3-SoCs.patch
@@ -0,0 +1,64 @@
+From 8f676fc677752ca432b424b9738aac12357a35e7 Mon Sep 17 00:00:00 2001
+From: Kendall Willis <k-willis@ti.com>
+Date: Tue, 17 Jun 2025 10:43:30 -0500
+Subject: [PATCH] feat(ti): enable power state validation for K3 SoCs
+
+Add power state validation for K3 SoCs to ensure proper PSCI power state
+transitions. Defining validate_power_state enables the
+PSCI_CPU_SUSPEND_AARCH64 capability and, in turn, CPU_SUSPEND.
+
+validate_power_state checks if the requested power level and power state
+are in a valid configuration. If the power state requested is standby,
+set the core power state to the maximum retention state.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/39502]
+Change-Id: Ied3ebdc583b2e5b7c86923705954d763997b324e
+Signed-off-by: Kendall Willis <k-willis@ti.com>
+---
+ plat/ti/k3/common/k3_psci.c | 23 +++++++++++++++++++++++
+ 1 file changed, 23 insertions(+)
+
+diff --git a/plat/ti/k3/common/k3_psci.c b/plat/ti/k3/common/k3_psci.c
+index c679344c8..ec37d9f4c 100644
+--- a/plat/ti/k3/common/k3_psci.c
++++ b/plat/ti/k3/common/k3_psci.c
+@@ -226,6 +226,28 @@ static void __dead2 k3_system_reset(void)
+         wfi();
+ }
+ 
++static int k3_validate_power_state(unsigned int power_state, psci_power_state_t *req_state)
++{
++    unsigned int pwr_lvl = psci_get_pstate_pwrlvl(power_state);
++    unsigned int pstate = psci_get_pstate_type(power_state);
++
++    if (pwr_lvl > PLAT_MAX_PWR_LVL)
++        return PSCI_E_INVALID_PARAMS;
++
++    if (pstate == PSTATE_TYPE_STANDBY) {
++        /*
++         * It's possible to enter standby only on power level 0
++         * Ignore any other power level.
++         */
++        if (pwr_lvl != MPIDR_AFFLVL0)
++            return PSCI_E_INVALID_PARAMS;
++
++        CORE_PWR_STATE(req_state) = PLAT_MAX_RET_STATE;
++    }
++
++    return PSCI_E_SUCCESS;
++}
++
+ static void k3_pwr_domain_suspend_to_mode(const psci_power_state_t *target_state, uint8_t mode)
+ {
+     unsigned int core, proc_id;
+@@ -286,6 +308,7 @@ static plat_psci_ops_t k3_plat_psci_ops = {
+     .get_sys_suspend_power_state = k3_get_sys_suspend_power_state,
+     .system_off = k3_system_off,
+     .system_reset = k3_system_reset,
++    .validate_power_state = k3_validate_power_state,
+ };
+ 
+ int plat_setup_psci_ops(uintptr_t sec_entrypoint,
+-- 
+2.34.1
+
-- 
2.34.1


