Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943C6C7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 15:21:24 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.17326.1685546480770122562
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 May 2023 08:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sZzvyUnA;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34VFLI3m020040;
	Wed, 31 May 2023 10:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685546478;
	bh=lffY+GMKuNNIMKxD3VorCArfHKSfqmwLfNpqqIIrs14=;
	h=From:To:CC:Subject:Date;
	b=sZzvyUnAHZkL/zphxnDm5EZcaSd6aVagubj9Y6AiatgiJ0ZaLGiwvM+paN69Zv8fd
	 QEEaUY+0F5t0YdOz72ZcxuDD691Pr2p+6rdLjw5LIWUlmkh3CRabH+HybKy3nskPgk
	 y29BnrfA+LTWLnFDYDPLwEd8I7CSPnrukSYALjOo=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34VFLIvL020165
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 May 2023 10:21:18 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 31
 May 2023 10:21:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 31 May 2023 10:21:18 -0500
Received: from fllv0039.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34VFLI2n009247;
	Wed, 31 May 2023 10:21:18 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] conf: machine: am65xx: Update GP to SR2 firmware
Date: Wed, 31 May 2023 10:21:17 -0500
Message-ID: <20230531152117.147582-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 31 May 2023 15:21:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16645

SR2.0 firmware binaries should be used here as SR1.0 has been descoped.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf | 2 +-
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
index b1b2490e..8744ac3e 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/k3r5.inc
 
-SYSFW_SOC = "am65x"
+SYSFW_SOC = "am65x_sr2"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 4b2c05e7..405d82ad 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -15,8 +15,8 @@ KERNEL_DEVICETREE = " \
 IMAGE_BOOT_FILES += "sysfw.itb"
 
 # Default on AM65x is for GP
-IMAGE_BOOT_FILES += "tiboot3-am65x-gp-evm.bin"
-IMAGE_BOOT_FILES += "sysfw-am65x-gp-evm.itb"
+IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-gp-evm.bin"
+IMAGE_BOOT_FILES += "sysfw-am65x_sr2-gp-evm.itb"
 
 # Since default on AM65x is for GP, add a version for HS-SE
 IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-hs-evm.bin"
-- 
2.39.2


