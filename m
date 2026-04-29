Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4C3FF8873
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 20:47:56 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6038.1777495672428805509
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 13:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=TG8dAAP8;
 spf=pass (domain: ti.com, ip: 40.107.208.51, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PgU0b++hr3gFPUlSIoLHZfN5poV1Ti7PEESDe8Kp3iHHcpTFIhz5Ldnb0X5Nzc9Ozbe9vDGVHDYUS0yto8NeE67ER5b9YffzdH5Sk2T9kCNVqJrqhIuN+EEn0dP2pCYPGqRsccOHns7mBRKvmtPm8PIj8o9ychrxb1a1G5UnApNW5d39h6fdapR7ZzRBQdk5GNPhXrATo7eAEtWRDWrzNjB+PRO7WSEDC537y+Kq7EKpmgtdtlCyUqirf/3u/PkHS4BWX7pixJeNDfboC4hTQktisVlGy3AK3dekQvypT+afle13SWcH5Rz1FzZ5qrQZqO3RZSTsJfuWSLXVO6S7Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhlBmm6go2NPyIymT/wwWwrpI1XovoVuc/iVQkyNMqk=;
 b=Qzy0dq9wV+zx2QnmM1LtSKYONOOML2VF1/eFoqWUEtpFy/Uu3+clC66Ic2xl8c9QOf+lSKPIlJ/e9cMrzE0dX06m6erFuXG1ZsCiLVMteu/ZdfCseeXiyZD20L1O9E4wA5gA64oZV4yfGvBkrvXxkB0yN2zf3LDIHl6gCB3qwStx5M8sQ7ouJwFLKCWL+K4+R1ztG0EuiGmkYCF4ORQ8FTwN2VSIOOCx+QONwAeowy7lR9O6l8dd6LMlNCnxyYgJA69xoaFC6deMv/Yt5M6ojb+Qeb6Db1duJFdOLYcY7iCcdt4Pdh36dEcPECTR0slUOuM0x5i2miSoBsAYVzh9kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhlBmm6go2NPyIymT/wwWwrpI1XovoVuc/iVQkyNMqk=;
 b=TG8dAAP8eqXfJ39cdECmb9RMCWjWwRSKiRSsTDZXGks30qtIqRkSDhDgn+9L67R1BOZIpus/6fGK1UNPNGNMVmsfQPOBd43bbteOxrTaC6Pk7DXMR0fkpsQe7DvyxSSJ6mwLTRy75Yhh1XD7fON7+7qCenFnF3x+qeTXMKO2eeM=
Received: from BYAPR03CA0031.namprd03.prod.outlook.com (2603:10b6:a02:a8::44)
 by PH8PR10MB6574.namprd10.prod.outlook.com (2603:10b6:510:226::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 20:47:48 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a02:a8:cafe::9c) by BYAPR03CA0031.outlook.office365.com
 (2603:10b6:a02:a8::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 20:47:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 20:47:47 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 15:47:46 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 15:47:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 15:47:45 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TKlj9D3857176;
	Wed, 29 Apr 2026 15:47:45 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wIBov-0000000AshS-37co;
	Wed, 29 Apr 2026 15:47:45 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ltp-ddt: Remove orphaned patch
Date: Wed, 29 Apr 2026 15:47:45 -0500
Message-ID: <20260429204745.2593539-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|PH8PR10MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: d7eb8735-1c97-4375-50dc-08dea630922c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	KM6aPl3mVdQmUKRzicmWg170XyIzhsWyzUBBrDs3bNqpcSZL0u41eDOArOtIzBTh1Z0uzWPK29lQxi+nX6LcNrWvPYx2Fe5CrU8oev5RMt2acGHopOb8LEXh2wELvc19Sz+WbASup/DLahSSpnpu/IWHus3uwUCvhS4Tjw82j4DyCnPgXizxvy1pKQCgJLZ6KL7nJ5+Ol7Be5NOZJJ9T4DHBPVRlahJU2vT7QxiJkq7wM4sxTo9olUvqVkxIP/tdFZ4Ygmjyey2V+0riMUCI+TAO+3jHyZhtVMO2gCufQi0DxLyN7piyA78O0DjzCUif7wUJ0TcdFPY7aAroiSUg0aXbA3IaI2+BKJpc+KJ/RFPvqGCivdC8QL+MhblCD9qdeBffWA7ZwMUwjBDAsp9CvzBkAp51dDr4WgXpMHANgfXZO1KkptxR03sphySBvJPsK2JI9lklbdC3C1y78PH2hGOwaV9rABE0Lws/Vb0yJPy2HKmXmF+uhF51SkIp1c4573L375H+dY5h0t8Y/PRQla3NhfFY74gXv4tYXw48TkiiwW4EvMxMHc3MiqTD0r3BHWlIexTHOBz5qyZlDidpb7BZS/V4OT7Io9DZnjC2nRHbQA6Q0jOrcj3U54DHWrQIpxC5I3LQVkWEfxPnZSl365bUNSfBj5XtKu5DDn2qHQWUzuvLGvrA/Pg9+ieowRocXbKwr36tDiH8GRfpJZT1289pG0K1mGPu4GWDIG/d1H+953nUWZG6vzNo74nJ5j5IdWC+uBsBOBwv2/fVXziHzA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vtZtT/bFT25eNDwnDyrVRJvuLXEiUGacK2HcB6jlGdZ/jyDA4nZtFR0qO0+kRjcFx4CeRfvUFcuSKlMKfBoL5Pi56Ku79np5GzJKBngNX6egE0PJAbvVbE5Zwpd4pPPYBjy5iR+a8+DfVzqj/j2eE5lgxGmKNX5XrPe4ujOmoGq3IJD71uWqF7udDb210QEc3EiGpCuO+0CePpIHkn+8QbGswaVSpx5JgvxbrTdMtTpzZJGF+P6/B1ziw56e8V9YOfaFamqmIW3N1UMfUZOVQyjWdceTiqh0oN7uW5YF8o0pJRN+jIfVe2leCRAdsnTKihumwOHv2xmdN3xcgfo8YqGMGewJux065jMMPdHZl+2OvT2vV0q30NjXcnah0iGJ9QtMvpSnxgMwEoiUENyUv9TdWPAI68bBbrM7hTxtn+hwnGNAVjsr6RocN6+C/8xE
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 20:47:47.2859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7eb8735-1c97-4375-50dc-08dea630922c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6574
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 20:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19920

When I rebased before moving from meta-arago to meta-ti, I accidentally
removed the wrong patch.  Net result was this orphaned patch was left
and imported incorrectly.  Remove it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...01-include-mk-Fix-installing-subdirs.patch | 49 -------------------
 1 file changed, 49 deletions(-)
 delete mode 100644 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-incl=
ude-mk-Fix-installing-subdirs.patch

diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-=
Fix-installing-subdirs.patch b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-dd=
t/0001-include-mk-Fix-installing-subdirs.patch
deleted file mode 100644
index 5f970a12..00000000
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-Fix-ins=
talling-subdirs.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 5907227ad86a93b084a52a7ff8dd8cb791c228a5 Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Mon, 27 Apr 2026 11:02:32 -0500
-Subject: [PATCH] include/mk: Fix installing subdirs
-
-When installing sub directories, the INSTALL_MODE was being used for the
-dirs as well.  But in runtest/Makefile the INSTALL_MODE is being set to
-00644.  This causes the ddt dir to lose the execute bits and stop acting
-like a directory.
-
-Simple fix is create INSTALL_MODE_DIR and use it when installing
-directories.
-
-Upstream-Status: Pending
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- include/mk/env_post.mk  | 1 +
- include/mk/functions.mk | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
-index ab31da73a..c2e85439a 100644
---- a/include/mk/env_post.mk
-+++ b/include/mk/env_post.mk
-@@ -58,6 +58,7 @@ INSTALL_TARGETS			:=3D $(patsubst $(abs_srcdir)/%,%,$(IN=
STALL_TARGETS))
- # The large majority of the files that we install are going to be apps an=
d
- # scripts, so let's chmod them like that.
- INSTALL_MODE			?=3D 00775
-+INSTALL_MODE_DIR		?=3D 00775
-=20
- $(abspath $(addprefix $(DESTDIR)/$(INSTALL_DIR)/,$(sort $(dir $(INSTALL_T=
ARGETS) $(MAKE_TARGETS))))):
- 	mkdir -p "$@"
-diff --git a/include/mk/functions.mk b/include/mk/functions.mk
-index 60dbed395..8e4bc973c 100644
---- a/include/mk/functions.mk
-+++ b/include/mk/functions.mk
-@@ -18,7 +18,7 @@ INSTALL_FILES		+=3D $$(abspath $$(DESTDIR)/$(3)/$(1))
-=20
- $$(abspath $$(DESTDIR)/$(3)/$(1)): \
-     $$(abspath $$(dir $$(DESTDIR)/$(3)/$(1)))
--	install -m $$(INSTALL_MODE) $(shell test -d "$(2)/$(1)" && echo "-d") $(=
PARAM) "$(2)/$(1)" $$@
-+	install $(shell test -d "$(2)/$(1)" || echo "-m $(INSTALL_MODE)") $(shel=
l test -d "$(2)/$(1)" && echo "-m $(INSTALL_MODE_DIR) -d") $(PARAM) "$(2)/$=
(1)" $$@
- 	$(shell test -d "$(2)/$(1)" && echo "install -m "'$$(INSTALL_MODE) $(PAR=
AM)' "$(2)/$(1)/*" -t '$$@')
- endef
-=20
---=20
-2.43.0
-
--=20
2.43.0


