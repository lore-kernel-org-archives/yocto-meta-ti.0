Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71F9EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 20:26:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5710.1688588809532258003
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 13:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oXGIVN6Z;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 365KQkZe094825;
	Wed, 5 Jul 2023 15:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688588806;
	bh=o6wgX5FGPOO2dA3aTcusohKqMbbcfHIg16p8N4TSjSk=;
	h=From:To:CC:Subject:Date;
	b=oXGIVN6ZagvH1eH5mARgA2P3yOE/o4jLMZEfjHdPb6yQwhqTVmaxGWCHKcY8D/Xl0
	 dvD2bCteI1OjgJmC2Dxez4ABBGdmPAn0XpJLtS7q+FZkl0I2xgA70BPy90nT8Oq7m7
	 65nl1LDnqXBbvgmIFfreInUmEZo282Z01BwsJYcM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 365KQkoC012496
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 15:26:46 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 15:26:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 15:26:45 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 365KQj2t046759;
	Wed, 5 Jul 2023 15:26:45 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] conf: machine: k3: Use ARM64 kernel load address in FIT
Date: Wed, 5 Jul 2023 15:26:44 -0500
Message-ID: <20230705202644.3871623-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Jul 2023 20:26:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16814

The address 0x80008000 was used in pre-K3 devices. ARM64 requires the
kernel loaded to a 2MB aligned address when not using KASLR. For non-FIT
we use 0x82000000, let's use the same when loading from FIT.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 494c667e..8e145084 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -19,8 +19,8 @@ KERNEL_IMAGETYPES = "Image fitImage"
 KERNEL_CLASSES += "kernel-fitimage"
 
 UBOOT_ARCH = "arm"
-UBOOT_ENTRYPOINT = "0x80008000"
-UBOOT_LOADADDRESS = "0x80008000"
+UBOOT_ENTRYPOINT = "0x82000000"
+UBOOT_LOADADDRESS = "0x82000000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 UBOOT_DTB_LOADADDRESS = "0x83000000"
-- 
2.39.2


