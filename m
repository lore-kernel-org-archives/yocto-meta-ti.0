Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC71C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 16:32:12 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.507.1659976324853177182
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 09:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HioKPm2Q;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 278GW3KW126790;
	Mon, 8 Aug 2022 11:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659976323;
	bh=Pku/Rwt9cU93dY8fXZ0LHTfj1bvbD/sOJtdWYRWH2GM=;
	h=From:To:CC:Subject:Date;
	b=HioKPm2QseRkLpGo+dmWTlsDCm2H9OJSHZjgPjpgnW+WXj4cjaiFUnwMKW9fEaYtd
	 WA39DXi65bCdeS8E47AWI7I5emLWWUpwSET0JKRkcxZh3M2sIaeGowMwKvbN2K6Hgw
	 WE4aFbbAPfJuvgiOejaboQBp2ryTvVx9xaGt+ooA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 278GW3UX091555
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Aug 2022 11:32:03 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 8
 Aug 2022 11:32:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 8 Aug 2022 11:32:03 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 278GW28W033805;
	Mon, 8 Aug 2022 11:32:02 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH] conf: machine: k3: Add fitImage to the
 default kernel image types
Date: Mon, 8 Aug 2022 11:32:02 -0500
Message-ID: <20220808163202.17220-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Aug 2022 16:32:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14938

FIT Image based kernels are valid for all K3 devices, not just HS, deploy
this kernel image type by default so it doesn't have to be appended on
a per-device-type basis.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 conf/machine/include/k3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index a5f96087..8109cd02 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -15,7 +15,7 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 KERNEL_IMAGETYPE = "Image"
-KERNEL_IMAGETYPES = "Image vmlinux.gz"
+KERNEL_IMAGETYPES = "Image vmlinux.gz fitImage"
 
 UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
-- 
2.36.1


