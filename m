Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF91C54E60
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 15:42:47 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.16334.1710430965019210575
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 08:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=i3/ORhdm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42EFgijl075391
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 10:42:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710430964;
	bh=O9uDmZ72Ja4e6K7HD4bTcvheFqnM8c9WY1PSMnsA44U=;
	h=From:To:CC:Subject:Date;
	b=i3/ORhdm001qACgWNd7ikXQyCV+MQ1tlg3Z4PquhnRXpiGgApCdZqnDbwzBnPHleM
	 QVWgYz+Udb4isG7iVwWedJv4lehgAFB/CJVeM9iTEyhdlQjswwaFafUmbA/T9mu0GY
	 EF05XWhSB37U2KpDJmtBHzAd3332FZm855qR16zg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42EFgi7w075470
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 10:42:44 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Mar 2024 10:42:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Mar 2024 10:42:44 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42EFggoU102804;
	Thu, 14 Mar 2024 10:42:42 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <m-chawdhry@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] conf: machine: j721s2/j784s4: Add support for HS-SE variants
Date: Thu, 14 Mar 2024 21:12:40 +0530
Message-ID: <20240314154240.506053-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 15:42:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17530

ti-u-boot [1][2] already supports building the HS-SE variants of these platforms.
Add support in the machine confs to package them in the built wic images.

[1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/arch/arm/dts/k3-j721s2-binman.dtsi?h=ti-u-boot-2023.04
[2]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/arch/arm/dts/k3-j784s4-binman.dtsi?h=ti-u-boot-2023.04

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/conf/machine/include/j721s2.inc | 3 +++
 meta-ti-bsp/conf/machine/include/j784s4.inc | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
index 4b63694c..5289ec5a 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -12,6 +12,9 @@ IMAGE_BOOT_FILES += "tiboot3-j721s2-gp-evm.bin"
 # Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-FS
 IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
 
+# Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-SE
+IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-evm.bin"
+
 TFA_BOARD = "generic"
 
 OPTEEMACHINE = "k3-j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index 559877e0..92062cdf 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -12,6 +12,9 @@ IMAGE_BOOT_FILES += "tiboot3-j784s4-gp-evm.bin"
 # Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-FS
 IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
 
+# Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-SE
+IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-evm.bin"
+
 TFA_BOARD = "j784s4"
 
 OPTEEMACHINE = "k3-j784s4"
-- 
2.34.1


