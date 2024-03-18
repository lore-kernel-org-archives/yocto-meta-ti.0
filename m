Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE67C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 06:18:12 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.36913.1710742684912690485
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 17 Mar 2024 23:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WFOkY7Os;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42I6I4rY123919
	for <meta-ti@lists.yoctoproject.org>; Mon, 18 Mar 2024 01:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710742684;
	bh=JlMaMNwZtuLJkvwGvdg1WdIPPJ+0IVfZ0v4EoBo98zs=;
	h=From:To:CC:Subject:Date;
	b=WFOkY7Os8SOx8GsUPBlEgMYyBUb2nhJ+6fYW5uIZOnDve5r+f6HZMycWLy2n23PTG
	 /KwG/bp+6ySr3+ssmZ+AR/IGlEwsPZcWei/nJonPQO+5LR0/jtfSN2CRaDv6zEPAZc
	 PPYjwScDrMeZVzmlt00jSrdcLJFUGPQeZYASo50g=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42I6I4JV034514
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 18 Mar 2024 01:18:04 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 18
 Mar 2024 01:18:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 18 Mar 2024 01:18:04 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42I6I2EO111478;
	Mon, 18 Mar 2024 01:18:03 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] conf: machine: j722s: Add support for HS-SE variant
Date: Mon, 18 Mar 2024 11:47:58 +0530
Message-ID: <20240318061758.2052328-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 18 Mar 2024 06:18:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17536

ti-u-boot [1] already supports building the HS-SE variant.
Add support in the machine conf to package this tiboot3.bin in the built wic images.

[1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/arch/arm/dts/k3-j722s-binman.dtsi?h=ti-u-boot-2023.04&id=d2612223375a25f81068d7a7abd86c08cd129a2c

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/conf/machine/include/j722s.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
index e165f51b..3b051f1b 100644
--- a/meta-ti-bsp/conf/machine/include/j722s.inc
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -9,6 +9,9 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 # Default tiboot3.bin on J722S is for HS-FS
 IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
 
+# Since default tiboot3.bin on J722S is for HS-FS, add a version for HS-SE
+IMAGE_BOOT_FILES += "tiboot3-j722s-hs-evm.bin"
+
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
-- 
2.34.1


