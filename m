Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF32C6370C
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 21:43:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.29813.1670449395787317121
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 13:43:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jzcHQVnw;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B7LhDnh045380;
	Wed, 7 Dec 2022 15:43:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670449393;
	bh=ALpMJBU3M0VYdQnf1MtkiCeBUWnYBVC7X/CoyUpfsC0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jzcHQVnwEoQa3rsJd68Q0kT9vyU0mvs5mG5JVtV0WwQH2xuXJWAimjMMU6H45QJh7
	 gDo74bgOjvpQKMsAw43fizJIO8Pdw3sQSRUDS0yslteMDpZHtOyLWjrk5eiuugB4nv
	 EUyflTCmx7cFWN6ntsGRUmGrTbTxbaJ43VwIFjX8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B7LhD4B001712
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Dec 2022 15:43:13 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 7
 Dec 2022 15:43:13 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 7 Dec 2022 15:43:12 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B7LhCOV007888;
	Wed, 7 Dec 2022 15:43:12 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/7] conf: machine: j784s4: Move common defines into j784s4.inc
Date: Wed, 7 Dec 2022 15:43:07 -0600
Message-ID: <20221207214312.21735-2-afd@ti.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207214312.21735-1-afd@ti.com>
References: <20221207214312.21735-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Dec 2022 21:43:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15423

Like we do with J721e, J7200, and J721s2, use a SoC header include file
to define common properties. This eases adding new boards based on these
SoC.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/j784s4.inc | 10 ++++++++++
 meta-ti-bsp/conf/machine/j784s4-evm.conf    |  4 +---
 2 files changed, 11 insertions(+), 3 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/j784s4.inc

diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
new file mode 100644
index 00000000..d7a598d6
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -0,0 +1,10 @@
+require conf/machine/include/j7.inc
+SOC_FAMILY:append = ":j784s4"
+
+MACHINE_FEATURES += "gpu"
+
+PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 96acca13..10d8aad0 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -2,9 +2,7 @@
 #@NAME: J784S4 EVM
 #@DESCRIPTION: Machine configuration for the TI J784S4 EVM
 
-require conf/machine/include/j7.inc
-
-MACHINE_FEATURES += "gpu"
+require conf/machine/include/j784s4.inc
 
 SERIAL_CONSOLES = "115200;ttyS2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-- 
2.38.1


