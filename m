Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95EBC77B71
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 11:51:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5442.1680868278477196180
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Apr 2023 04:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RSDlBI+V;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: u-kumar1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 337BpInQ071164
	for <meta-ti@lists.yoctoproject.org>; Fri, 7 Apr 2023 06:51:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680868278;
	bh=xlMXz8aI6aUBRQiPYOJHmFEQ/34Fu0l1RHBLAPgGFAc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RSDlBI+VyabBT3NImdw5e9tcVvSFr3XWLM9Z3JqdE0MZMn7xXl/emV7i6NILzG0l9
	 aUVkdqQXqhQGLs9vAMUYcsm7sgZzNWzn6L9h5tCYLOYUjUlEu1toVS7IQ3jVjwe9Ph
	 cghFfUXaNERLQuviMDm3fNx+9j/3Zk9eklfrjn1Y=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 337BpIlB008798
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 7 Apr 2023 06:51:18 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 7
 Apr 2023 06:51:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 7 Apr 2023 06:51:17 -0500
Received: from udit-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 337BpDVb035857;
	Fri, 7 Apr 2023 06:51:16 -0500
From: Udit Kumar <u-kumar1@ti.com>
To: <praneeth@ti.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <m-chawdhry@ti.com>, Udit Kumar <u-kumar1@ti.com>
Subject: [PATCH 1/4] meta-ti-bsp: conf: machine: j7200: Update SPL_BINARY
Date: Fri, 7 Apr 2023 17:21:04 +0530
Message-ID: <20230407115107.839204-2-u-kumar1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407115107.839204-1-u-kumar1@ti.com>
References: <20230407115107.839204-1-u-kumar1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 11:51:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16321

u-boot 2023.4 merged SPL build target for HS and GP
as tispl.bin_HS.
This patch updates SPL_BINARY to align with u-boot.

Signed-off-by: Udit Kumar <u-kumar1@ti.com>
---
 meta-ti-bsp/conf/machine/j7200-evm.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200-evm.conf
index b17b65b7..e4a4ca01 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
@@ -14,3 +14,5 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "j7200_evm_a72_config"
+
+SPL_BINARY = "tispl.bin_HS"
-- 
2.34.1


