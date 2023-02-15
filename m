Return-Path: <vaishnav.a@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC0EC64ED6
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 12:19:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.13590.1676463593544872761
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 04:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Wt8DAm1W;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: vaishnav.a@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FCJr9W102599
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 06:19:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676463593;
	bh=p5He/NG0UERcbHwds36MC+Z43lxzV2wBvpEa82PAbB4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Wt8DAm1WXHfpytdGwywFqgHUhwfrh0YuABxCcZLKKJ30d4IVINj7boXg6/dpBo/LF
	 i5aNJLsAxCtGsocjO+1G2JAjdaZY8abVBupStlw5G0LQOfbAknm3Tc3WfpFsr8wgUv
	 1fiI545bwv6dUgvWKrhH8R8Wr4U+H95Mm7qjYSF0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FCJrvt015732
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 06:19:53 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 06:19:52 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 06:19:52 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FCJpZg046236;
	Wed, 15 Feb 2023 06:19:52 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@ti.com>,
        <detheridge@ti.com>
CC: <m-chawdhry@ti.com>, <j-choudhary@ti.com>, <vaishnav.a@ti.com>
Subject: [meta-ti][dunfell][PATCH 4/4] conf: machine: j784s4-evm: Add camera overlays for J784S4 EVM
Date: Wed, 15 Feb 2023 17:49:45 +0530
Message-ID: <20230215121945.3631-4-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230215121945.3631-1-vaishnav.a@ti.com>
References: <20230215121945.3631-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 12:19:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15854

Add the following overlay files on J784S4 EVM:

1. Fusion board (For FPDLink-III cameras)
2. OV5640 camera module

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---
 conf/machine/j784s4-evm.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.conf
index e892f597..ee1c0da3 100644
--- a/conf/machine/j784s4-evm.conf
+++ b/conf/machine/j784s4-evm.conf
@@ -35,6 +35,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
     ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
     ti/k3-j784s4-evm.dtb \
+    ti/k3-j784s4-evm-csi2-ov5640.dtbo \
+    ti/k3-j784s4-fpdlink-fusion.dtbo \
 "
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
-- 
2.17.1


