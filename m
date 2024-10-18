Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2627FD3DEA9
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 18:30:51 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.29221.1729276242792320251
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 18 Oct 2024 11:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WXukwqX3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49IIUdw5057963;
	Fri, 18 Oct 2024 13:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729276239;
	bh=EjXXgfi/U1ZHFpae8uDNuxNwwKJ5jRTzH7KwkedIXys=;
	h=From:To:CC:Subject:Date;
	b=WXukwqX3wjOIgIJfsV7KuKrqW+g1FuYmBx4jNMEdXXRwgrblT+W/+Wvxtba1BzuWn
	 Y6R5uR1ghI3ZtHRidTbvMK+WxTY9BvkHctCWJ3YzYrex2TX+to9vIaGz6f8MAzMZo3
	 aiN7AHa6qDc8xz/INzlQBAnza6wzZ1J48mKSdjT4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49IIUdOn005879
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Oct 2024 13:30:39 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Oct 2024 13:30:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Oct 2024 13:30:39 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49IIUdtb085065;
	Fri, 18 Oct 2024 13:30:39 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] ti-img-rogue-umlibs: fix j721e NPOT texture issues
Date: Fri, 18 Oct 2024 13:30:33 -0500
Message-ID: <20241018183033.2789313-1-rs@ti.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 18 Oct 2024 18:30:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18020

From: Randolph Sapp <rs@ti.com>

Resolve some issues with J721E and compressed NPOT (Non-Power-Of-Two)
textures.

Also, add some additional allocation tracking in render process specific
tasks.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
index e2bf4799..720a3cff 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
@@ -14,7 +14,7 @@ PR = "r3"
 
 BRANCH = "linuxws/scarthgap/k6.6/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "707e042ee632f61c1f931402d8fc491358598373"
+SRCREV = "ba93a3e38c683ccb03a7cf8f2e7dffe2f9cbcf1c"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
-- 
2.46.0


