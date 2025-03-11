Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E679C28B2F
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 16:18:52 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.13731.1741709930767718977
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 09:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VKdN14iy;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BGIn3l812834
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 11 Mar 2025 11:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741709929;
	bh=9wKLHleU8mOuN9emY2sSAiUugITGOZTs/5Y0xNxK+tU=;
	h=From:To:Subject:Date;
	b=VKdN14iy3iT2h7X/YulsMOMxGcY0RanpYjLsmIuO1P13qssizGZ1vTaTI4vABmF8Z
	 G6hhpDVCbfH/8L8y3VJ6FV1t0bqR9LNDKSt9DahibmQek2DIO5avCHNO4IngzmQeib
	 XsDQjgr4YUYyxTeZPaSU+UVDTv/NHoc+kcOJzcq8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BGIneI035057;
	Tue, 11 Mar 2025 11:18:49 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 11:18:49 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 11:18:49 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BGInjQ006715;
	Tue, 11 Mar 2025 11:18:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ts2Jd-00089k-CH; Tue, 11 Mar 2025 11:18:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH 1/2] conf: machine: j721e: Fix overlays for DS90UB954
Date: Tue, 11 Mar 2025 11:18:49 -0500
Message-ID: <20250311161849.31310-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Mar 2025 16:18:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18369

The previous commit incorrectly added the k3-j721e-evm-ub954.dtbo to
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
 meta-ti-bsp/conf/machine/j721e-evm.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index d216bbe2..b0b2a5b6 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -19,7 +19,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
     ti/k3-j721e-sk-csi2-dual-imx219.dtbo \
     ti/k3-j721e-sk.dtb \
-    ti/k3-j721e-evm-ub954.dtbo \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
-- 
2.17.1


