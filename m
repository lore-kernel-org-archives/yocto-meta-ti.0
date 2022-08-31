Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031A9C54EE9
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 17:53:28 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.2162.1661968398724049896
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 10:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jVkDnBRt;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27VHrH9Y004762;
	Wed, 31 Aug 2022 12:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661968397;
	bh=7vvQeqWBeMSaJ+GGs0yxDUAzSHfd5fYn/EpBgPPyYWU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jVkDnBRtmSOb58tzjX1T8RTGwKkac8Lts4wY5aGNqqgK0X+XzA4XMFD84FO8P1y4b
	 j3aCDyvXKq9g/de/rRk1hIM4rZzZMCxAxztCA1nXYmSsbGuFQ59+t3igDsDWrlp/bT
	 yd2YgVpCNl0XbaxFUmj/V+n/C3YzpvCHS4pBEpYQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27VHrHiu079798
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Aug 2022 12:53:17 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 31
 Aug 2022 12:53:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 31 Aug 2022 12:53:17 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27VHrFtu033174;
	Wed, 31 Aug 2022 12:53:16 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 2/3] meta-ti: Add SoC families for the J7
 SoCs
Date: Wed, 31 Aug 2022 12:53:14 -0500
Message-ID: <20220831175315.15942-3-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220831175315.15942-1-afd@ti.com>
References: <20220831175315.15942-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 31 Aug 2022 17:53:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14981

This allows us to be more specific around what SoCs we support and
lets us add features based on the SoC family not just at the EVM or
whole J7 family level.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 conf/machine/include/j7200.inc  | 2 ++
 conf/machine/include/j721e.inc  | 4 ++++
 conf/machine/include/j721s2.inc | 2 ++
 conf/machine/j7200-evm.conf     | 2 +-
 conf/machine/j721e-evm.conf     | 4 +---
 conf/machine/j721s2-evm.conf    | 2 +-
 6 files changed, 11 insertions(+), 5 deletions(-)
 create mode 100644 conf/machine/include/j7200.inc
 create mode 100644 conf/machine/include/j721e.inc
 create mode 100644 conf/machine/include/j721s2.inc

diff --git a/conf/machine/include/j7200.inc b/conf/machine/include/j7200.inc
new file mode 100644
index 00000000..ce88567c
--- /dev/null
+++ b/conf/machine/include/j7200.inc
@@ -0,0 +1,2 @@
+require conf/machine/include/j7.inc
+SOC_FAMILY:append = ":j7200"
diff --git a/conf/machine/include/j721e.inc b/conf/machine/include/j721e.inc
new file mode 100644
index 00000000..d965327c
--- /dev/null
+++ b/conf/machine/include/j721e.inc
@@ -0,0 +1,4 @@
+require conf/machine/include/j7.inc
+SOC_FAMILY:append = ":j721e"
+
+MACHINE_FEATURES += "gpu"
diff --git a/conf/machine/include/j721s2.inc b/conf/machine/include/j721s2.inc
new file mode 100644
index 00000000..113f86c4
--- /dev/null
+++ b/conf/machine/include/j721s2.inc
@@ -0,0 +1,2 @@
+require conf/machine/include/j7.inc
+SOC_FAMILY:append = ":j721s2"
diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
index c8a03a7b..303ec182 100644
--- a/conf/machine/j7200-evm.conf
+++ b/conf/machine/j7200-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: J7200 EVM
 #@DESCRIPTION: Machine configuration for the TI J7200 EVM
 
-require conf/machine/include/j7.inc
+require conf/machine/include/j7200.inc
 
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
diff --git a/conf/machine/j721e-evm.conf b/conf/machine/j721e-evm.conf
index 8598c672..030edc73 100644
--- a/conf/machine/j721e-evm.conf
+++ b/conf/machine/j721e-evm.conf
@@ -2,9 +2,7 @@
 #@NAME: J721e EVM
 #@DESCRIPTION: Machine configuration for the TI J721e EVM
 
-require conf/machine/include/j7.inc
-
-MACHINE_FEATURES += "gpu"
+require conf/machine/include/j721e.inc
 
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index ba5e8def..3a28dc61 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: J721S2 EVM
 #@DESCRIPTION: Machine configuration for the TI J721S2 EVM
 
-require conf/machine/include/j7.inc
+require conf/machine/include/j721s2.inc
 
 MACHINE_FEATURES += "gpu"
 
-- 
2.36.1


