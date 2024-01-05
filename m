Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EEAC47079
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 08:29:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.19515.1704443370488683731
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 00:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=T3PFRR5X;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4058TUE4058017
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 02:29:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704443370;
	bh=xqmXO4bhF7oYgB3GjJkrHqUEAhHRva3NcEHAuc+2CHQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=T3PFRR5XlS3Bx/cHJF9uOJ6zAY6s0Jr5sGHhhoJ6H8DafTY6GFEoSQCKlnJ+VhTqE
	 9K5piG9VmkMxMWeYNy1/5vSiYYp6ppGzIF/m438k2xdMDtIzp/eeUW6IDB76l90S6a
	 g8op7q7kn4jUOaJJ7BXd/9NzFOjoihHXDHo34HZM=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4058TUqP116187
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 02:29:30 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 02:29:29 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 02:29:29 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4058TNS5114539;
	Fri, 5 Jan 2024 02:29:28 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <a-nandan@ti.com>, Darren Etheridge <detheridge@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][kirkstone][PATCH 2/2] meta-ti-bsp: j722s: add Rogue GPU driver to machine defintion
Date: Fri, 5 Jan 2024 13:58:44 +0530
Message-ID: <20240105082844.879372-3-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105082844.879372-1-a-limaye@ti.com>
References: <20240105082844.879372-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jan 2024 08:29:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17380

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


