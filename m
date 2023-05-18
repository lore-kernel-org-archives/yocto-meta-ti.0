Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8F2C7EE23
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 16:15:27 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.21769.1684426521929979407
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 May 2023 09:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZRd97tDB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34IGFKw4027624;
	Thu, 18 May 2023 11:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684426520;
	bh=T+Nz3XK1uIYACs76czJt3B6NGFNhSICsCSJU0psB/vA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ZRd97tDB6yH8ag1vMz/pm2TPOD2ljQWcVF6p8i9bPsE/YY/a0XgYB1rhQge2Wse1W
	 G1aWyW1LzDlKl0IAT2RTp5hL05wzUIAzhtaFWY2sdVYHBFnUk7psKiU48ZaOkQxBN2
	 sGQKgINxBcFsmIhNBDtL8TWdy09IWa91ptNLaUdI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34IGFKK1005420
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 May 2023 11:15:20 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 May 2023 11:15:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 May 2023 11:15:20 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34IGFK3e006024;
	Thu, 18 May 2023 11:15:20 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pzgHf-0004Fb-U9; Thu, 18 May 2023 11:15:19 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH v2 2/2] linux-ti-staging: Use vendored kernel-devicetree.bbclass
Date: Thu, 18 May 2023 11:15:19 -0500
Message-ID: <20230518161519.16296-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161519.16296-1-reatmon@ti.com>
References: <20230518161519.16296-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 May 2023 16:15:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16558

Change over to using the kernel_devicetree_vendor_dtb.bbclass to have
the DTBs installed into the same vendored subdirectory that is in the
kernel.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: - Fixed syntax of "1"
    - Fixed name of custom kernel class to match the other patch.

 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index cdee548f..7c992ac5 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-inherit kernel
+inherit kernel_vendor_dtb
 
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
@@ -18,6 +18,9 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
 		      ${EXTRA_DTC_ARGS}"
 
+KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtbs"
+KERNEL_DTBVENDORED = "1"
+
 S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-6.1.y"
-- 
2.17.1


