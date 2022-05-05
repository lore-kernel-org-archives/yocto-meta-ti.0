Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6190C433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 01:30:11 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.5792.1651714211032715769
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 18:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=zEQK9MUS;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2451U8GB086107;
	Wed, 4 May 2022 20:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651714209;
	bh=o21fvBd0JW/z2kK1Xu1lgkizPULSKA0SA+Y+2KAuNHQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=zEQK9MUS/m4X5qSN1yRqxGaVRzgSsALthHE8GnbOyazFq/R8BGWaPj8ew7S4AYBoO
	 fs64SB35Gl/ClA8r5WBti5b6IFl+fRi8Nqf1tO3U4jCskHW7lHfVIRRt6lP2aDjwTw
	 S/BfaSFQGV/s4/xnaOGKZEd48Y/IVhAGQrmBTTRI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2451U8XW002359
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 May 2022 20:30:08 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 20:30:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 20:30:07 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2451U7NL101474;
	Wed, 4 May 2022 20:30:07 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nmQJi-00074a-W0; Wed, 04 May 2022 20:30:07 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v3 2/2] conf/machine: am62xx: Update build
 flag for low power mode
Date: Wed, 4 May 2022 20:30:06 -0500
Message-ID: <20220505013006.27140-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220505013006.27140-1-reatmon@ti.com>
References: <20220505013006.27140-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 May 2022 01:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14703

From: Nishanth Menon <nm@ti.com>

Update build flag for arm-trusted-firmware to include low power mode
support

K3_PM_SYSTEM_SUSPEND is added in arm-trusted-firmware now which enables
low power mode support for am62xx.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/machine/include/am62xx.inc                              | 2 ++
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 1 +
 2 files changed, 3 insertions(+)

diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
index e8823dd2..ff857b97 100644
--- a/conf/machine/include/am62xx.inc
+++ b/conf/machine/include/am62xx.inc
@@ -6,6 +6,8 @@ MACHINE_FEATURES += "screen touchscreen"
 SERIAL_CONSOLES = "115200;ttyS2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
+TFA_K3_SYSTEM_SUSPEND = "1"
+
 # AM62 supports multi-certificate images, use the same
 IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
 
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 80b1d664..68bfa899 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -9,6 +9,7 @@ TFA_INSTALL_TARGET_k3 = "bl31"
 TFA_SPD_k3 = "opteed"
 
 EXTRA_OEMAKE_append_k3 = "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
+EXTRA_OEMAKE_append_k3 = "${@ 'K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
 
 do_compile_append_am65xx-hs-evm() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-- 
2.17.1


