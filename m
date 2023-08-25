Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F99C71133
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 17:15:08 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.495.1692983703797709765
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Aug 2023 10:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xxQk+aTj;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37PHF2mj108963;
	Fri, 25 Aug 2023 12:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692983702;
	bh=nmKYZc6OyPzv7QAM4hkEjQLIzOUSfJoLsfT/cZmEY4I=;
	h=From:To:Subject:Date;
	b=xxQk+aTjwIU34hxHLcDwQIub/4CglhirbrhfwPdUZoiddimSTAt65JxCEBXv4F8BI
	 sUi3DzJiVhpygXzfM08zySQ0+Jcd4W823mmynZog4o8An2u+A0icGd9yHa2UozB8Il
	 kAgPx5HABR0ZtY6ZZl9PdfCDlWHCDbIoHOEtq/MY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37PHF1tF015962
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Aug 2023 12:15:01 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Aug 2023 12:15:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Aug 2023 12:15:01 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37PHF1eK069193;
	Fri, 25 Aug 2023 12:15:01 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qZaOj-0006fn-Ag; Fri, 25 Aug 2023 12:15:01 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH]  conf/machine/include/am65xx,omap-a15,ti33x,ti43x: Enable gpudriver
Date: Fri, 25 Aug 2023 12:15:01 -0500
Message-ID: <20230825171501.25609-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Aug 2023 17:15:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16893

Now that we have a solution for the SGX parts we can enable gpudriver
support for the affected platforms.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 2 +-
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 405d82ad..2c427b88 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append = ":am65xx"
 MACHINE_FEATURES += "screen touchscreen gpu"
 
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 
 KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
 
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index c9d16f3c..c1eb659b 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -13,7 +13,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index ad19798d..567cf128 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -14,7 +14,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
 
 KERNEL_IMAGETYPE = "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index ea5d1505..c70a8363 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -14,7 +14,7 @@ PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
-- 
2.17.1


