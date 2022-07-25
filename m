Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B620C43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 21:35:29 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.1651.1658784924753212027
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Jul 2022 14:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=U78qsYET;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26PLZMfh028799;
	Mon, 25 Jul 2022 16:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658784922;
	bh=R4eNvEi667/A8BwPzgbCIsr4bHQzyYxZVWZlhIfGx3M=;
	h=From:To:Subject:Date;
	b=U78qsYETpl+Hex8nG1dYhPf7GmY46wO/trQ6eftl2gv9akWRglRx8H9zRSPFCOmRC
	 8CTza/FufDXJVQkSM2vE8lNteRF6wxn/MpHqcCykFsZtUZYymvtjvGGF/+HJcP+9Xi
	 lXLUkzmAxF1t6PaeoLR/PfJXRylmSmFvTPBt+Lkw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26PLZMH3103753
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Jul 2022 16:35:22 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 25
 Jul 2022 16:35:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 25 Jul 2022 16:35:22 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26PLZMtl059977;
	Mon, 25 Jul 2022 16:35:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oG5jW-0003GZ-7N; Mon, 25 Jul 2022 16:35:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] cadence-mhdp-fw: Lock firmware to j721e
Date: Mon, 25 Jul 2022 16:35:22 -0500
Message-ID: <20220725213522.12516-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 25 Jul 2022 21:35:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14903

This firmware is only applicable to the j721e platform and not
all j7 devices.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 2 +-
 recipes-kernel/linux/kernel-rdepends.inc           | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index 5cbbceb6..ec102761 100644
--- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -10,7 +10,7 @@ PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "j7"
+COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index 2ebf4948..2ac6eac4 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -38,7 +38,8 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2 p
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-evm = " prueth-fw-am65x-sr2"
 
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7-evm = " cadence-mhdp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7-hs-evm = " cadence-mhdp-fw"
 
 # Add run-time dependency for Video Decoding firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
-- 
2.17.1


