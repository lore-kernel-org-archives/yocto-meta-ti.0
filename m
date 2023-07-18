Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374C1EB64DD
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:52:20 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.9821.1689691931897859959
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 07:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nDMxd41r;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36IEqAMF085657;
	Tue, 18 Jul 2023 09:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689691930;
	bh=mIi8Lu9wpF6zV02lLwsU+8bkHDfwpkMZLaux/zJpxDE=;
	h=From:To:CC:Subject:Date;
	b=nDMxd41rEJMemQ27pGSm4oKNIRVWwJN86s3SfufAhp28PqrANocgpcsmClYyJux8c
	 G/Sf4tyZCzVmXPFgXkBw1Z6v0iGMjShW77s4XK7vCjluK/gatbcNv1dUpJurd7UlCz
	 ht9cscaL3xjAuC9rpaxju3DrC4SPiqFe/XUtjh60=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36IEqAga039095
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jul 2023 09:52:10 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jul 2023 09:52:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jul 2023 09:52:09 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36IEq9NY005203;
	Tue, 18 Jul 2023 09:52:09 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/3] conf: Remove leftover UIO Device Tree overlay files
Date: Tue, 18 Jul 2023 09:52:06 -0500
Message-ID: <20230718145208.18584-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Jul 2023 14:52:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16850

We do not use UIO anymore, remove these files.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am57xx-evm.conf   | 2 --
 meta-ti-bsp/conf/machine/include/ti33x.inc | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
index 9b12f383..26b7f78c 100644
--- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
@@ -30,8 +30,6 @@ KERNEL_DEVICETREE = " \
     am574x-idk.dtb \
 "
 
-KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
-
 UBOOT_MACHINE = "am57xx_evm_config"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index bce88309..ec53e612 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -35,8 +35,6 @@ KERNEL_DEVICETREE = " \
     am335x-sancloud-bbe.dtb \
 "
 
-KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
-
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am335x_evm_config"
 
-- 
2.39.2


