Return-Path: <anandb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B9BC3DA66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 09:23:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.9707.1692955431263368049
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Aug 2023 02:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pgnkqB9P;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: anandb@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37P9NoYx110707
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Aug 2023 04:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692955430;
	bh=Yk/aVXJcjwh3F2HAzNkIDArpYUXttCymneETYF/zkP8=;
	h=From:To:CC:Subject:Date;
	b=pgnkqB9PaDFtRbptpcVs+DZxLRzh+qfXsEkuUkynryjbnO5UyIFehNojo3kMBHAyW
	 HmqavP6orH3hn2a9+NfWg+Afr9V6/XfFqbcraWlcF7ZOfnN21N+mtfBk3/zUulZWyX
	 ezeTiBGJug0neiDwJpr9GJv9AEUYRiJY+OZG274Q=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37P9No6j062884
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Aug 2023 04:23:50 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Aug 2023 04:23:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Aug 2023 04:23:50 -0500
Received: from uda0876520.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37P9NmCF029162;
	Fri, 25 Aug 2023 04:23:49 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anand Balagopalakrishnan <anandb@ti.com>
Subject: [master/kirkstone][PATCH 1/1] ti-sgx-ddk-km: move to 6.1 kernel
Date: Fri, 25 Aug 2023 14:53:47 +0530
Message-ID: <20230825092347.385308-1-anandb@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Aug 2023 09:23:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16891

Update SGX kernel module for 6.1 Linux kernel.

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index bf4fa98a..82650888 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -9,20 +9,20 @@ PROVIDES = "virtual/gpudriver"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
 
-MACHINE_KERNEL_PR:append = "x"
+MACHINE_KERNEL_PR:append = "y"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "virtual/kernel"
 
-BRANCH = "ti-img-sgx/${PV}/k5.10"
+BRANCH = "ti-img-sgx/${PV}/k6.1"
 
 SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "eda7780bfd5277e16913c9bc0b0e6892b4e79063"
+SRCREV = "bfd9edef3f976906fb7fececbfa29d16801154f5"
 
 TARGET_PRODUCT:omap-a15 = "jacinto6evm"
 TARGET_PRODUCT:ti33x = "ti335x"
-- 
2.34.1


