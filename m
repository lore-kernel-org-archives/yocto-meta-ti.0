Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D088C3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 13:37:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.15349.1721223473581233226
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jul 2024 06:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZflmSzod;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46HDbrd2005329
	for <meta-ti@lists.yoctoproject.org>; Wed, 17 Jul 2024 08:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721223473;
	bh=oS85NmBZ/wu51jBKC0hygUJpEFJa65Fvweoz7uj3N0E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZflmSzod/RQK3YLdivGakAVglAsufBJKk6azQifY5TP6H7UiRSnzgqCbu3NlJYpSk
	 FSO09hqtJe4uzOwT4OEX2XwTQym83Ro2/0Tdzeg60WIEMH55fM4ZAbL3sflTl5bRNK
	 56kZDGmHiKtzBoiUdpaWLqM9lSJcInsK+vTQrWdw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46HDbr6e027838
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 17 Jul 2024 08:37:53 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Jul 2024 08:37:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Jul 2024 08:37:52 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46HDaflE025857;
	Wed, 17 Jul 2024 08:37:50 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <m-chawdhry@ti.com>, <n-francis@ti.com>,
        <u-kumar1@ti.com>, <detheridge@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH 3/3] meta-ti-bsp: j742s2: add Rogue GPU driver to machine definition
Date: Wed, 17 Jul 2024 19:06:15 +0530
Message-ID: <20240717133614.787998-4-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240717133614.787998-1-a-limaye@ti.com>
References: <20240717133614.787998-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Jul 2024 13:37:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17876

Add ti-img-rogue-driver as the preferred provider and enable the gpu
driver in the image.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/conf/machine/include/j742s2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc b/meta-ti-bsp/conf/machine/include/j742s2.inc
index 41f3a73d..60d91f16 100644
--- a/meta-ti-bsp/conf/machine/include/j742s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append = ":j742s2"
 MACHINE_FEATURES += "screen gpu"
 
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
 # Default tiboot3.bin on J742S2 is for HS-FS
 IMAGE_BOOT_FILES += "tiboot3-j742s2-hs-fs-evm.bin"
-- 
2.34.1


