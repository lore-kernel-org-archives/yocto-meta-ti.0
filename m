Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6495103E197
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 14:59:00 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16240.1773845936866707010
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 07:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hayx/QHt;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.27, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vevgo8fYBKBJFkBKh1Rj3mO3b7LHmQznnkyeT8Kw8HXPD/eBO37BvAr4ucWK3Us6Tdae1M2QKtIrwIjRUHeuIkkSV/TszYjEInJ4Tz5xMh4vymk+3Ct0y69LttXdkHKmIL25Cdt9EnoBw5aKPRLTb/388GyTGi3C61JN+XaEhQL1mmMey8KwHZz57HYk5hcaJOHRIfCTL2seps/cfkEaZczLM6NVw3WnJYj/wI+5Ltzu6nXb+/DRDSLBYon5Gm5rXHgQUUcmiC+Z7cZL9rrb9Cj5YLG6JXBANCLJbc//H2VkykoEvWePuAgBrZKxAxBi/LvPc3U3QzvLZHMOe2XaIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyrCjYWF7oOJtiWyIm+ptOXToBsm8M6v3ZukhS9h7Dg=;
 b=Zx4S8lquEn7rfL3x2kX5pKBjqZjImguStu1EF3ZK/aHNB5VFMs0n4GkecxvCAruJL3hJE/8eXNv9/uBKIU4ObOXt0fZvrdNgemUkfEflxxGi/Du1Q/z4z/i89FG4D7Nny6iupUpi7SPW/YaHQHfj/2ceBB7I7GRw+9/9Hyogm8aJdb+pLyaNMgFPzhEcl3rR+dk9I84ui+NU31t+GZbCkaA6XqzXdxtoxxQQ7GKZ0w8lJ9hJQuVpUjjcZ77sjLr2I+dqFC0Qw5GCZI4olXlXWQYlcL8HIG4JxZyCIRiFtKwOymdEwrPMH7e6vz4EEhYO7noEyk6yIMZi05ZMdvD/Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyrCjYWF7oOJtiWyIm+ptOXToBsm8M6v3ZukhS9h7Dg=;
 b=hayx/QHtSOXlscSVK5sDp2KtlM8Z+jlZm4zCJEkc5yujq7pUh8Eup6HZF/8PBKSH5VbBJ/IQwO3zPDi3RtyPyDucNuefzApShkN6KzFUH3aZbNkv2WKcXaOwj398wOu9l8NTiTvGojrLI9zKt+hmwcyvHPpZ6lzdTlTzeBc0JK0=
Received: from PH7P220CA0093.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::16)
 by SJ2PR10MB7039.namprd10.prod.outlook.com (2603:10b6:a03:4c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 14:58:50 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:510:32d:cafe::5c) by PH7P220CA0093.outlook.office365.com
 (2603:10b6:510:32d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 14:58:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Wed, 18 Mar 2026 14:58:48 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 09:58:19 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 09:58:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 09:58:19 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62IEvrjX1014945;
	Wed, 18 Mar 2026 09:58:15 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v6 3/3] conf: Enable dynamic security layer for LUKS
Date: Wed, 18 Mar 2026 20:27:32 +0530
Message-ID: <20260318145732.2115521-4-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318145732.2115521-1-s-tripathi1@ti.com>
References: <20260318145732.2115521-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|SJ2PR10MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: b1dbada0-51bb-4278-b8be-08de84fedc57
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	wCO6xowe/EF5MlZxxAZ7HMKKfG4eS2JE3B3UuH5irnfCHSbJ3PbvW0bRjWifW1CUhZldVCtYoEnQSiedGwLMFVgbpaLaz0bOiiXX77cOtNByDqNGDyWfhB6137VlGiZ/NyX7/yFVwjhkosmXdIsjcvfIwM/BXSBtbTZBi4Jg+J4D0v186Dvtvf9OU/Z+fcdyEtQt+Jj5j0uaPJwjnFPQBfJu9um06nmKLRjeNnhp5hJPsHcqnbWdNUIh9BmrCOITtDZ0U5ASO8xh3ExEcrARBhTZl1F+8nkrzftNmEFiSsNS55ug/RKFOq92VbDQUBZ87hhYH07RKAjmP2fqUT3cUx5Tatt9HJZWaOiAJ3sUcJF5+vgZN0ZXdkigu1lwD+vAmoldU0iFoZLumyPdX1l7DTMGFpaIIMKdcKMfG8a54+BpcCvaEydL0o9qyrfpYWg+NueiineaslweGwDGXIEfrywpiZmzIqfqqkE+1U3iLWZBtMwoaTUKXj7gAkNGAiAaLDO8ali8BbhadVC781UwpTgp+uBJgNK317A01e8/6/xkd1EzAHuR2e+U1I2djHHheylIT4P3Z56rY88DNIMC3qwyqZJ4iabKT1zWJ0VETi4n/lsw1XO1KZ8Do+B8zqjCcf3DN9U2s+lzvZ9MdTGXMAr7sUt8u81694xLAeX/Vl6AnzKBnwu3XYWZv4n2Trzcsoq2Ira7gAMTYJZB+UAx5wnJ72kEGCWeEsj4Y64hQfE=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zLSeXxavUTWqz/lQ13pi6wFo8Bg4ROBtWJvnC9tI6X3I/hMPrX/a62EgFA9fJqpD79lGua7W2sUe8m4SUq1nSlxt/l0F0DTJY8+hq2D37B1H/qKwsgkDmnvjjNb1AlTOxPkC/pj6L6xnJ6IfQU9iZ2lY5H7vrthnNLW45O677Hyi2w4HWB2l/fi5i1P41xn2NvgJFsoJgnf2V4jN/aPwlie+e/c+g32tsHFxmkrf7RUIZ8vMEdjIGr1J8W+OnRfJQNTDTfo8+t/nldEw62YTguUN1RwmHkt7p0zUoy6CpqIoeqS9kAuQ0JWakudEAAFftq/4yj/WshyKyMyJljYfpbx+FxN6uRZOUGbH6wNuETtrJyINhHl2+t3+rmEtRd9VNoZOgcqil0pKhZUlyP6IqDVwraylMOQSFTon2V5K5I3oPWm6Hxzb0HbQ8VS0b6xT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 14:58:48.5214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1dbada0-51bb-4278-b8be-08de84fedc57
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7039
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2026 14:59:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19762

Register dynamic-layers/security in layer.conf to conditionally
build LUKS encryption support when meta-security layer is present.

Update ti-core-initramfs.inc to auto-enable initramfs generation
when DISTRO_FEATURES contains 'luks'.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 meta-ti-bsp/conf/layer.conf                            | 2 ++
 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index f78da573..ce2883ac 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -24,6 +24,8 @@ LAYERRECOMMENDS_meta-ti-bsp =3D " \
=20
 BBFILES_DYNAMIC +=3D " \
     openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recip=
es*/*/*.bbappend \
+    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bb \
+    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bbappend \
 "
=20
 SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-=
ti-bsp/conf/machine/include/ti-core-initramfs.inc
index 9d3cc612..15c05e04 100644
--- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -5,7 +5,7 @@
 #   TI_CORE_INITRAMFS_ENABLED =3D "0"
 #
 #-------------------------------------------------------------------------=
-----
-TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KER=
NEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') else '0'}"
+TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KER=
NEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.co=
ntains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
=20
 TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
 TI_CORE_INITRAMFS_EXTRA_INSTALL ?=3D ""
--=20
2.34.1


