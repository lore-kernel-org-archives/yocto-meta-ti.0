Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F4EC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 09:53:58 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.3557.1749117228926285877
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 02:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mg+ZwVUz;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: j-sahu@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5559rmeQ1034612
	for <meta-ti@lists.yoctoproject.org>; Thu, 5 Jun 2025 04:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749117228;
	bh=ht6CoTdnZ3pdvdEhRUlDFxbCXJLPVqZ5I3n3adTeDCk=;
	h=From:To:CC:Subject:Date;
	b=mg+ZwVUz8VXImLo1tL+5eBLlNaRH1wbqtGOrydwxdvFJFdUYWBDzCrjPQaQvWeBYt
	 zSmdwiGB+Eqws2XMnCh31OF4ypigbo9lymfBCMM4VNEWscfYSG22EAwJnhePTSy3CN
	 H5Bjn/icO/GM79I7MojYPU0azLRutXOhTyriBxhs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5559rmLX818655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 5 Jun 2025 04:53:48 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 04:53:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 04:53:47 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.227.236])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5559rjgs3397418;
	Thu, 5 Jun 2025 04:53:46 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Praneeth <praneeth@ti.com>, Chirag <c-shilwant@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: am62pxx: Add support for HS-SE variant
Date: Thu, 5 Jun 2025 15:23:43 +0530
Message-ID: <20250605095343.2708888-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Jun 2025 09:53:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18620

Since ti-u-boot supports HS-SE variant builds[1],
Add support in the machine configurations to package this
HS-SE variant tiboot3 binary in the built images.

[1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2025.01&id=75602edad16c840b2611afb9fc0e2718c026bb8a

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62pxx.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
index 2c6a729a..061d0e67 100644
--- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -11,6 +11,9 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 # Default tiboot3.bin on AM62Px is for HS-FS
 IMAGE_BOOT_FILES += "tiboot3-am62px-hs-fs-evm.bin"
 
+# Since default tiboot3.bin on AM62Px is for HS-FS, add a version for HS-SE
+IMAGE_BOOT_FILES += "tiboot3-am62px-hs-evm.bin"
+
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
-- 
2.34.1


