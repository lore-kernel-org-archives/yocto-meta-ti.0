Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97077C27C76
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 03:08:50 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.65950.1674702520054076952
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 19:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gs2ESJAk;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30Q38dm6106390
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 21:08:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674702519;
	bh=do6vWGbOQ0BwXOcTiCMHQ3Qi9YWjsRtDwgSV6cgBCxA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gs2ESJAkqmRALk0gkxyfY8ez/952Vni2eHGvYCSHF+uO8Nub1oOYsLp1QnH48arns
	 94ol3TBhcA2lec2t3T73w1XE5iIlpuOeSDGlzqzvXVvBG2nSwmsO9kVDa/PR2eZ/3h
	 ilFLQTFbRdpUK6Q/Z8K7Lio4s98apOtDUJseu5S4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30Q38dYg026084
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 21:08:39 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 21:08:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 21:08:38 -0600
Received: from res.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30Q38cla120484;
	Wed, 25 Jan 2023 21:08:38 -0600
From: Randolph Sapp <rs@ti.com>
To: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <k-bhargav@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [kirkstone PATCH 4/4] meta-ti-bsp: machine: Attempt to update DC alias
Date: Wed, 25 Jan 2023 21:08:34 -0600
Message-ID: <20230126030834.3889448-5-rs@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126030834.3889448-1-rs@ti.com>
References: <20230126030834.3889448-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 03:08:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15666

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


