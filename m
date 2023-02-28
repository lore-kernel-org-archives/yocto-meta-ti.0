Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10281C7EE31
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 00:37:55 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.12005.1677544670897329253
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Feb 2023 16:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZuvHjgRF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31S0bog0034918
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 18:37:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677544670;
	bh=Cr/eN2z+DwKyD4tXp4L0iK5NJavHviVHP9Sa6N/nJ6c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZuvHjgRF1NDyQXR8hpeeL2WmrZdu3xffXO9EpzmL3Gsg4wUZV1iiZivtoSuMw+hAX
	 XH9l30CtKhBL4ZaiUtQ/iOeumoEfY9MMOJB0QP2fE2yUhHMzI45C49D0W2iCn5nn32
	 Us5LkIEwBhBcTjXOUf6Q4J0paFsnf/PE8kQ7YoJk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31S0boiR096206
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 18:37:50 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 27
 Feb 2023 18:37:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 27 Feb 2023 18:37:49 -0600
Received: from res-desktop.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31S0bnpJ029039;
	Mon, 27 Feb 2023 18:37:50 -0600
From: Randolph Sapp <rs@ti.com>
To: denys <denys@ti.com>, reatmon <reatmon@ti.com>, afd <afd@ti.com>
CC: detheridge <detheridge@ti.com>, meta-ti <meta-ti@lists.yoctoproject.org>,
        Randolph Sapp <rs@ti.com>
Subject: [kirkstone][PATCH v8 4/4] conf: sgx: Unset graphics preferred providers
Date: Mon, 27 Feb 2023 18:37:45 -0600
Message-ID: <20230228003745.2884357-5-rs@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228003745.2884357-1-rs@ti.com>
References: <20230228003745.2884357-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Feb 2023 00:37:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15958

Waiting for the kernel migration before revisiting the SGX platforms.
Unset the preferred provider for gpudriver on these platforms to allow
them to fallback to software rendering for now.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 2 +-
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 385bb164..75a7e2a2 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -6,7 +6,7 @@ MACHINE_FEATURES += "screen touchscreen"
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
-PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
+#PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb \
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index e5349134..70b4d4a4 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
 # Graphics providers and variables
-PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
+#PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index 97c7d3c8..6daac3e2 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -13,7 +13,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
 # Graphics providers and variables
-PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
+#PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
 
 KERNEL_IMAGETYPE = "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index ddd430d5..99cb5143 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -13,7 +13,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
 # Graphics providers and variables
-PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
+#PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
-- 
2.39.2


