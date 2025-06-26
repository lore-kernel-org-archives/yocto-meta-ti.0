Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FB5C7EE33
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 09:52:41 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.4507.1750931551628039105
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 02:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XzCAKflO;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: anshuld@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q9qUMa2117474
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 04:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750931550;
	bh=gq8fG1of392Mvhc35nCyBFwCV1JF6PT+FcONdEqB5CE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XzCAKflOHDX/F+3Qm1nmjmbKo3rxyIKGNogWvqehaj75ECGdOW+b3ep9dLQlYvnLi
	 Qbof9ASZ4x4QrckI43x9QDoDF1yfG0FJJ1qG2u1ueEqiuFvzOMy+yaYRpLJyBdMaAs
	 pBJVFALNpdPAR8SYamQty6aLxYY9TtAzO/jJo81A=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q9qUF23485131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 04:52:30 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 04:52:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 04:52:30 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q9qTmD802160;
	Thu, 26 Jun 2025 04:52:30 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2 2/4] meta-ti-bsp: tfa: add build flags for am62xxsip-evm
Date: Thu, 26 Jun 2025 15:21:41 +0530
Message-ID: <20250626095144.952261-3-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626095144.952261-1-anshuld@ti.com>
References: <20250626095144.952261-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 09:52:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18689

Due to 512MiB DDR limitation of am62x SiP, the memory map has been
modified with OP-TEE moved to bottom of DDR after atf to 0x80080000,
this requires modifications to ATF's BL32_BASE. PRELOADED_BL33_BASE has
also been updated to 0x82000000 to reflect the updated SPL_TEXT_BASE
from u-boot.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf               | 8 ++++++++
 .../trusted-firmware-a/trusted-firmware-a-ti.inc          | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index 38bd4407..fc525a9a 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -4,6 +4,14 @@
 
 require conf/machine/include/am62xx.inc
 
+TFA_K3_BL32_BASE = "0x80080000"
+TFA_K3_BL32_BASE:bsp-ti-6_6 = ""
+TFA_K3_BL32_BASE:bsp-ti-6_1 = ""
+
+TFA_K3_PRELOADED_BL33 = "0x82000000"
+TFA_K3_PRELOADED_BL33:bsp-ti-6_6 = ""
+TFA_K3_PRELOADED_BL33:bsp-ti-6_1 = ""
+
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am625 \
     ti/k3-am62x-sk \
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index cb956a00..c17ac9de 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -18,5 +18,7 @@ TFA_INSTALL_TARGET:am62lxx = "bl31 bl1"
 TFA_SPD:am62lxx = ""
 
 EXTRA_OEMAKE += "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
+EXTRA_OEMAKE += "${@ 'BL32_BASE=' + d.getVar('TFA_K3_BL32_BASE') if d.getVar('TFA_K3_BL32_BASE') else ''}"
+EXTRA_OEMAKE += "${@ 'PRELOADED_BL33_BASE=' + d.getVar('TFA_K3_PRELOADED_BL33') if d.getVar('TFA_K3_PRELOADED_BL33') else ''}"
 EXTRA_OEMAKE += "${@ 'K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
 EXTRA_OEMAKE:append:ti-falcon = " PRELOADED_BL33_BASE=0x82000000 K3_HW_CONFIG_BASE=0x88000000"
-- 
2.49.0


