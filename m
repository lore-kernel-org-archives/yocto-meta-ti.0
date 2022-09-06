Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CA9ECAAA1
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 15:51:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.881.1662479482385931257
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 08:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WRloTY+K;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a0123456@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 286FpLHY047660
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Sep 2022 10:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662479481;
	bh=Vwp+6oC/8ImMjaTKceNARxzwlM4EWX92QJ5BGpGaWc4=;
	h=From:To:CC:Subject:Date;
	b=WRloTY+Ko3gHW5H/ALFZHl52ray4pTEp50TzkaXN1+AXmDEBmyL3ddaZ3AI975UD6
	 fBLoRb+NRs1PEbdCJ8qMEVm9Leq0EWUOwdqBO5tKQx1xslAv03TsAqsjfCFGYcVyMj
	 YIqd8rIG5DsnlyvfAexq5Io0LnxhFtVOQcO/3V2I=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 286FpLYF071195
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Sep 2022 10:51:21 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 6 Sep
 2022 10:51:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 6 Sep 2022 10:51:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 286FpJI1053869;
	Tue, 6 Sep 2022 10:51:20 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <nsekhar@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>, <r-ravikumar@ti.com>, <rs@ti.com>
Subject: [meta-ti][dunfell][PATCH] cadence-mhdp-fw: Add dependency for j721s2
Date: Tue, 6 Sep 2022 21:21:16 +0530
Message-ID: <20220906155116.7563-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Sep 2022 15:51:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14993

cdns mhdp bridge is present in j721s2 soc.
Add the dependency for the same

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 2 +-
 recipes-kernel/linux/kernel-rdepends.inc           | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index ec102761..f4ee5f78 100644
--- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -10,7 +10,7 @@ PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm"
+COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index c181c893..ae855a88 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -40,6 +40,8 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx = " prueth-fw-am65x-sr2"
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7-evm = " cadence-mhdp-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7-hs-evm = " cadence-mhdp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm = " cadence-mhdp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-hs-evm = " cadence-mhdp-fw"
 
 # Add run-time dependency for Video Decoding firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
-- 
2.37.2


