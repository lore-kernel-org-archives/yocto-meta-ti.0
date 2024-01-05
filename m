Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEB4C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 08:33:44 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.19613.1704443615248805291
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 00:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Uvg2nZNE;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4058XYhT059020
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 02:33:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704443614;
	bh=xqmXO4bhF7oYgB3GjJkrHqUEAhHRva3NcEHAuc+2CHQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Uvg2nZNEogDbogchE7JQ4k5vp00LQ8jfJ4xnVMAneGMH9+AHoIQJFMKSlzMK5pQIr
	 WNMKea5WVLNKc9TZ0rGpjXy3J5Zdydtoka8yu5ypqoUSmCfw79cjhZBQ1/fwbkPBif
	 bcs8i477Sz3a8iNEOZ9XBh15LArlDwIBAUkXcND4=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4058XYa8120187
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 02:33:34 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 02:33:34 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 02:33:34 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4058XTUW115665;
	Fri, 5 Jan 2024 02:33:33 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Darren Etheridge <detheridge@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-ti][master][PATCH 2/2] meta-ti-bsp: j722s: add Rogue GPU driver to machine defintion
Date: Fri, 5 Jan 2024 14:03:24 +0530
Message-ID: <20240105083324.879907-3-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105083324.879907-1-a-limaye@ti.com>
References: <20240105083324.879907-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jan 2024 08:33:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17383

From: Darren Etheridge <detheridge@ti.com>

j722s is same GPU as am62p,  need to add this into machine definition so
that Rogue driver gets included in the image.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/conf/machine/include/j722s.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
index 59f45c93..e165f51b 100644
--- a/meta-ti-bsp/conf/machine/include/j722s.inc
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append = ":j722s"
 MACHINE_FEATURES += "screen gpu"
 
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
 # Default tiboot3.bin on J722S is for HS-FS
 IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
-- 
2.34.1


