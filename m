Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5C0C7EE33
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 00:37:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.12131.1677544671319841305
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Feb 2023 16:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vxp/smyN;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31S0bouC013606
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 18:37:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677544670;
	bh=kjP/T0bZEcsEo7XinYUNwI+uh8XQ5e8hEZLl7WyEa4g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vxp/smyNLVPm6PNyGXD5d6nrH2D7LB+PiVXLlAE6k2s99UeAkS2+5X0epXHLLNFic
	 McDrBeDU+X9HVYnVvvFTlGO67DAUeB7D5llcsz1eqvZANlGsGpTiRu/7YRd19KisTy
	 uTb523Q9CrNY3a2EhEi9ZV6nqgGVl9U+bS+8/jc8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31S0bou5105584
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 18:37:50 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 27
 Feb 2023 18:37:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 27 Feb 2023 18:37:49 -0600
Received: from res-desktop.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31S0bnpI029039;
	Mon, 27 Feb 2023 18:37:49 -0600
From: Randolph Sapp <rs@ti.com>
To: denys <denys@ti.com>, reatmon <reatmon@ti.com>, afd <afd@ti.com>
CC: detheridge <detheridge@ti.com>, meta-ti <meta-ti@lists.yoctoproject.org>,
        Randolph Sapp <rs@ti.com>
Subject: [kirkstone][PATCH v8 3/4] meta-ti-bsp: machine: Attempt to update DC alias
Date: Mon, 27 Feb 2023 18:37:44 -0600
Message-ID: <20230228003745.2884357-4-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15960

Attempt to update the SGX display controller alias variable according to
what Andrew told me. SGX apparently had a few different aliases across
platforms.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 3 +++
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 3 +++
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index efa33a10..e5349134 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -10,7 +10,10 @@ MACHINE_KERNEL_PR = "r7"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
+
+# Graphics providers and variables
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
+PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
 KERNEL_IMAGETYPES = "zImage uImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index e2f75359..97c7d3c8 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -11,7 +11,10 @@ MACHINE_KERNEL_PR = "r22"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
+
+# Graphics providers and variables
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
+PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
 
 KERNEL_IMAGETYPE = "zImage"
 
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index e9999910..ddd430d5 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -11,7 +11,10 @@ MACHINE_KERNEL_PR = "r3"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
+
+# Graphics providers and variables
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
+PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
 
-- 
2.39.2


