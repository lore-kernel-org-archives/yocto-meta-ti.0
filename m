Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8A0C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 18:41:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.569.1648233713936740017
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 11:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XEMTneQA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22PIfqUv102698;
	Fri, 25 Mar 2022 13:41:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648233712;
	bh=m3h7j+E1RzkfKWOQeKqCDa2cFx2no7j++Z1v2MejVwI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XEMTneQA2IVPz8YJmLB/ZqXXQav/mfFdYh3SmP0eXGq8S3RBLei6b6DyBL/ebUsWL
	 D2P/ifx08EY9SAxUdTsrXVwLXk1+kfMyujiMxsBzBpQvYIVrKcAWtJ70TvqJ2rBHeJ
	 6kNxuxODRvUB+DCOiD6QVQHw4d6TDxVBuH3iAzMw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22PIfqKV110668
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Mar 2022 13:41:52 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Mar 2022 13:41:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Mar 2022 13:41:51 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22PIfpLt022723;
	Fri, 25 Mar 2022 13:41:51 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Darren Etheridge <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: "Andrew F . Davis" <afd@ti.com>
Subject: [meta-ti][master][PATCH 2/4] meta-ti-bsp: add SoC families for the J7
 SoCs
Date: Fri, 25 Mar 2022 13:41:49 -0500
Message-ID: <20220325184151.16940-2-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220325184151.16940-1-afd@ti.com>
References: <20220325184151.16940-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Mar 2022 18:41:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14548

This allows us to be more specific around what SoCs we support and
lets us add features based on the SoC family not just at the EVM or
whole J7family level.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/j7200.inc  | 2 ++
 meta-ti-bsp/conf/machine/include/j721e.inc  | 4 ++++
 meta-ti-bsp/conf/machine/include/j721s2.inc | 2 ++
 meta-ti-bsp/conf/machine/j7200-evm.conf     | 2 +-
 meta-ti-bsp/conf/machine/j721e-evm.conf     | 4 +---
 meta-ti-bsp/conf/machine/j721s2-evm.conf    | 2 +-
 6 files changed, 11 insertions(+), 5 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/j7200.inc
 create mode 100644 meta-ti-bsp/conf/machine/include/j721e.inc
 create mode 100644 meta-ti-bsp/conf/machine/include/j721s2.inc

diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
new file mode 100644
index 00000000..ce88567c
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -0,0 +1,2 @@
+require conf/machine/include/j7.inc
+SOC_FAMILY:append = ":j7200"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
new file mode 100644
index 00000000..d965327c
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -0,0 +1,4 @@
+require conf/machine/include/j7.inc
+SOC_FAMILY:append = ":j721e"
+
+MACHINE_FEATURES += "gpu"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
new file mode 100644
index 00000000..113f86c4
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -0,0 +1,2 @@
+require conf/machine/include/j7.inc
+SOC_FAMILY:append = ":j721s2"
diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200-evm.conf
index 2565c90c..175d30f8 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: J7200 EVM
 #@DESCRIPTION: Machine configuration for the TI J7200 EVM
 
-require conf/machine/include/j7.inc
+require conf/machine/include/j7200.inc
 
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index 12d4fecb..fe28e6f5 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -2,9 +2,7 @@
 #@NAME: J721e EVM
 #@DESCRIPTION: Machine configuration for the TI J721e EVM
 
-require conf/machine/include/j7.inc
-
-MACHINE_FEATURES += "gpu"
+require conf/machine/include/j721e.inc
 
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 82fd33da..a2c15f74 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: J721S2 EVM
 #@DESCRIPTION: Machine configuration for the TI J721S2 EVM
 
-require conf/machine/include/j7.inc
+require conf/machine/include/j721s2.inc
 
 SERIAL_CONSOLES = "115200;ttyS10"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-- 
2.17.1


