Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDC1C28B2F
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 16:17:12 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.13836.1741709828979628543
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 09:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fbYjYkQV;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BGH7qV812527
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 11:17:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741709827;
	bh=uyTbb9ZIAfvPm3C8IFbHxsNiaHQOF3Wd0532vVCXkIM=;
	h=From:To:Subject:Date;
	b=fbYjYkQVksfTOmKt4hVs5febNNm5guX9N5X8fPnXjzZCMID3mfBIv+VX0q56P2R6W
	 JYVjKItjsysL6yKMFQdRgSNJi59rWrpzzIQ+xboxfLDJgucKySDXj3xMSHOfjGG9NJ
	 2kHHRc8txzoXD4hNhkIRMLK7UD/4/YuEGq7QCpyA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52BGH7kK008146
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 11:17:07 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 11:17:07 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 11:17:07 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BGH7TD005246;
	Tue, 11 Mar 2025 11:17:07 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ts2Hy-00082f-Qt; Tue, 11 Mar 2025 11:17:06 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: j721s2/j784s4: Fix overlays for DS90UB954
Date: Tue, 11 Mar 2025 11:17:06 -0500
Message-ID: <20250311161706.30874-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Mar 2025 16:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18368

The previous commit incorrectly added the k3-j721s2-evm-ub954.dtbo to
the KERNEL_DEVICETREE and it was missed during a quick review.

The correct way to add dtbs is to add a prefix string to the
KERNEL_DEVICETREE_PREFIX variable so that all files that match the
string will be picked up.  This allows for multiple kernels to be
swapped out that may have different DTBs in their respective trees and
not break a build.

The upstream testing on the kernel will automatically update the
KERNEL_DEVICETREE variable when the final kernel version is available.
That way the KERNEL_DEVICETREE always points to what is available in the
mainline.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/j721s2-evm.conf | 1 -
 meta-ti-bsp/conf/machine/j784s4-evm.conf | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index f0600f33..5cb28309 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -20,7 +20,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721s2-common-proc-board.dtb \
     ti/k3-j721s2-evm-gesi-exp-board.dtbo \
     ti/k3-j721s2-evm-pcie1-ep.dtbo \
-    ti/k3-j721s2-evm-ub954.dtbo \
 "
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 3940a95f..bf53b07c 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -13,6 +13,7 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j7200-evm-mcspi-loopback \
     ti/k3-j721s2-evm-csi2-ov5640 \
     ti/k3-j721s2-evm-fusion \
+    ti/k3-j721s2-evm-ub954 \
     ti/k3-am69-sk \
     ti/k3-v3link \
 "
@@ -23,7 +24,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-j784s4-evm-quad-port-eth-exp1.dtbo \
     ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtbo \
     ti/k3-j784s4-evm.dtb \
-    ti/k3-j721s2-evm-ub954.dtbo \
 "
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
-- 
2.17.1


