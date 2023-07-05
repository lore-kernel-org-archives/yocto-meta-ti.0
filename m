Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1CEEB64DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 22:07:46 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8023.1688594860726437019
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 15:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZFNGiPVO;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 365M7dCm120899;
	Wed, 5 Jul 2023 17:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688594859;
	bh=P/yyD1e2iJeJhSQFmD/SdK3N6xmskltiO1P3YODp11c=;
	h=From:To:CC:Subject:Date;
	b=ZFNGiPVOp4VJeOzzmEJX1K3JMs2xv8J89bXteRC1oFMx7+djTcpq94+E7e6r0ba40
	 vfmtfj6vI0Y+PPifRftb4Zodvk81b/8J8FXNY3dt1NvYUhYdZQDPMmokNQ2qNLUit0
	 oSAcNRgo5ZPdgyAq0VekB1d+/B3yw8aZyYjSLPSE=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 365M7dQB015818
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 17:07:39 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 17:07:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 17:07:39 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 365M7cee126298;
	Wed, 5 Jul 2023 17:07:38 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2] conf: machine: k3: Use ARM64 kernel load address in FIT
Date: Wed, 5 Jul 2023 17:07:37 -0500
Message-ID: <20230705220737.3951895-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Jul 2023 22:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16819

The address 0x80008000 was used in pre-K3 devices. ARM64 requires the
kernel loaded to a 2MB aligned address when not using KASLR. For FIT
set the address to 0x81000000 which gives the kernel 32MB before running
into the FDT at 0x83000000.

If you get this error someday then your kernel is too large and either it
or FDT needs relocated in memory:
    ERROR: image is not a fdt - must RESET the board to recover.

Signed-off-by: Andrew Davis <afd@ti.com>
Tested-by: Praneeth Bajjuri <praneeth@ti.com>
---

Changes from v1:
 - Use 0x81000000 to allow more space for the kernel image

 meta-ti-bsp/conf/machine/include/k3.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 494c667e..8f6f4014 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -19,8 +19,8 @@ KERNEL_IMAGETYPES = "Image fitImage"
 KERNEL_CLASSES += "kernel-fitimage"
 
 UBOOT_ARCH = "arm"
-UBOOT_ENTRYPOINT = "0x80008000"
-UBOOT_LOADADDRESS = "0x80008000"
+UBOOT_ENTRYPOINT = "0x81000000"
+UBOOT_LOADADDRESS = "0x81000000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 UBOOT_DTB_LOADADDRESS = "0x83000000"
-- 
2.39.2


