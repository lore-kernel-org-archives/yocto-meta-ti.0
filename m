Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294EAC7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 10:59:52 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.5479.1750935591351423225
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 03:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SgtUNh72;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: m-chawdhry@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QAxohZ2126840
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 05:59:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750935590;
	bh=v5osohdrEhOzhmVBm9H2Ap3C0UryBI+m9ywJPmBfRWA=;
	h=From:To:CC:Subject:Date;
	b=SgtUNh72FcpT7/iddwzwnIm3zi44r1KM+Ij6gogGE/HAfp/8IS/ZPoxGWuVsy1ksd
	 dGBJaXy5FCmt2OYdsmp0YLClIZu4jD7N6NY8zfxzdgG/W0U3bl8FELVfy5ps5E5SZN
	 +kTBsrAOQ6vJEpuLQOS984y4bdheZKvE+phcQKc8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QAxoZ11913444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 05:59:50 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 05:59:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 05:59:50 -0500
Received: from uda0497581-HP.dhcp.ti.com (uda0497581-hp.dhcp.ti.com [172.24.227.253])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QAxkcP1144008;
	Thu, 26 Jun 2025 05:59:47 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Manorit Chawdhry <m-chawdhry@ti.com>, Bryan
 Brattlof <bb@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] Revert "conf: machine: k3: disable all fit signing for uboot"
Date: Thu, 26 Jun 2025 16:29:33 +0530
Message-ID: <20250626105933.564282-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 10:59:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18692

The following revert requires a patch in U-boot as well which has been
posted upstream [0] and backported internally too.

This reverts commit 9656b79cb557a46d2611b67e7e51702f6da05594.

[0]: https://lore.kernel.org/all/20250626-b4-upstream-fix-icssg-fit-v1-1-95eff1c853a4@ti.com/

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 9b85f867c206..14d7db8a1184 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -25,6 +25,10 @@ SPL_BINARY = "tispl.bin"
 SPL_BINARYNAME = "tispl.bin"
 UBOOT_SUFFIX = "img"
 
+UBOOT_SIGN_ENABLE = "1"
+UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
+UBOOT_SIGN_KEYNAME ?= "custMpk"
+UBOOT_SIGN_KEYDIR ?= "${TI_SECURE_DEV_PKG}/keys"
 FIT_HASH_ALG ?= "sha512"
 FIT_SIGN_ALG ?= "rsa4096"
 
-- 
2.34.1


