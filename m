Return-Path: <anandb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1F7E71067
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 12:48:56 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.15863.1695300534052133791
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Sep 2023 05:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=egtDg1gn;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: anandb@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38LCmpVC052582;
	Thu, 21 Sep 2023 07:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695300531;
	bh=Yk/aVXJcjwh3F2HAzNkIDArpYUXttCymneETYF/zkP8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=egtDg1gnhvr1TS6mwnzDmefuqgx2UYYqATHmbGF+lww6yhdo5Nj8/o84rbinKQ1K2
	 WyWoue2Xqb09Kwg7QvPDh2bV/7HeTSjU1zufBia4+CgEr2h5ydtKd9fqfmJ0sT2B0i
	 lBtBbEO05yT5VTPSDcmM1DmrXBZopVLfUKBhzpAw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38LCmpol097081
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Sep 2023 07:48:51 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Sep 2023 07:48:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Sep 2023 07:48:50 -0500
Received: from udta0871049.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38LCmoCd024143;
	Thu, 21 Sep 2023 07:48:50 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <s-adivi@ti.com>, <praneeth@ti.com>, <rs@ti.com>, <reatmon@ti.com>,
        <detheridge@ti.com>, <denis@denix.org>,
        Anand Balagopalakrishnan
	<anandb@ti.com>
Subject: [master|kirkstone][PATCH 1/2] ti-sgx-ddk-km: move to 6.1 kernel
Date: Thu, 21 Sep 2023 07:48:47 -0500
Message-ID: <20230921124848.3663826-2-anandb@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921124848.3663826-1-anandb@ti.com>
References: <20230921124848.3663826-1-anandb@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Sep 2023 12:48:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17000

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


