Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95ACC54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 23:20:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1294.1675120845781403174
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 15:20:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dYJSTelZ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30UNKioV090055
	for <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 17:20:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675120844;
	bh=do6vWGbOQ0BwXOcTiCMHQ3Qi9YWjsRtDwgSV6cgBCxA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dYJSTelZFpcyy9tp78B/a6+LOreeBfxptWdj6wVClaAkbQviKPmDv6dEE3DaF1y38
	 vgwGpVVUTT+grbe9Uxyk+tL0smhexBwaI8hNcUFJWgjOv1+tQXP6tfpHqT3DXL4uQK
	 e26I+aJRvrefm7fv3/0q8dIUvFBVqtPjJg8McG+E=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30UNKiVg026498
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 17:20:44 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 30
 Jan 2023 17:20:43 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 30 Jan 2023 17:20:43 -0600
Received: from res.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30UNKdM6024673;
	Mon, 30 Jan 2023 17:20:43 -0600
From: Randolph Sapp <rs@ti.com>
To: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>, <afd@ti.com>
CC: Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <k-bhargav@ti.com>
Subject: [kirkstone][PATCH v7 3/3] meta-ti-bsp: machine: Attempt to update DC alias
Date: Mon, 30 Jan 2023 17:20:07 -0600
Message-ID: <20230130232007.2393097-4-rs@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130232007.2393097-1-rs@ti.com>
References: <20230130232007.2393097-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 23:20:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15710

Attempt to update the SGX display controller alias variable according to
what Andrew told me. SGX apparently had a few different aliases across
platforms.

Signed-off-by: Randolph Sapp <rs@ti.com>
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
2.34.1


