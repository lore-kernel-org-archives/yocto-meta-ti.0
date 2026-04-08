Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095B710FC443
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 21:04:37 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.116919.1775682268202792785
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 14:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=T+2wYVRi;
 spf=pass (domain: ti.com, ip: 40.93.198.14, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAk1Z+lCLEWSIzXFSY3Ij67r9dO0i8rK7zefbppGYckBLSr5cgFRpKFiilUzSo0Nqfw509Q3VWjemu6UDw/69oBjTnVsFHpH2nJ717xXv3OEs7XQRMvS7Kq8JC6YYCivY23cTu7BnFpI+Cpw6iMfUoe8VTiA0qNBnzdNGXAbL5sg7oQQyG1Vnj9bI4bpOzhayILIUCA+VRkxzlpWYbclfTSaYpsTMAwY8TzC40blCcG3FMvXLKgF/b9Xwhsna6MVag0gA2Rhee6hmegF01a27ixH/CXCzheOygXvRVaUcUJ9Bs3KcQ4yVWHJU0NpHpcw99ArjrXdHOtSX7qntYRLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmM96oM48TMF2NpIY7UQJQJOBI/+uzjNtdGwp8jvffM=;
 b=FXvPeYsjEaNktvN9I7mN/2a00+gIgn7fAKvBeO+fLykwpECTwth6jrWQVcUwjIYL/TdYknzKgpWEGDNUIBoThVC6jbTyJtQN1qE0pt4piwXG6ZV61Q34NjNgO8PhYinsB1M6yCeA2pc/N6Z8+uYtAl2HFwgGP/mF07Z81khyaxZsb3iUPXsvAj4EFo6SbC7okfZzSmk+vN2tJpjh5PxQQqRi9Ospsp1oKcv5vGD85+kKXvSVUQBMMtdAjbaV1sm8uiW+SyHYCkTy0BfjUmqBg+hwk8+LbgFT6tBZ17E7SaR9dxpdDqGpPt+cD8Zfx7akFBcMmuK2xcFfFqLSeEuSQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmM96oM48TMF2NpIY7UQJQJOBI/+uzjNtdGwp8jvffM=;
 b=T+2wYVRi54XmY9FKILDNz9CkckUEaGKGeR4aPizLgilfiXF3L9CiO8rOHn6NTxy45Kt9I9YHaWTbQXhcXpgHr6dzyvZbStnIszXuKJLdxc7GGThapjpl2/9uHLbxHh40Ns8dWBLnIWn0llh+F8+IIboEeORLIsE1v5kjqid7I5U=
Received: from DSSP221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::19) by
 SJ1PR10MB5977.namprd10.prod.outlook.com (2603:10b6:a03:488::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 21:04:24 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:8:3d5:cafe::54) by DSSP221CA0002.outlook.office365.com
 (2603:10b6:8:3d5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 21:04:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 21:04:23 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 16:04:23 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 16:04:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Apr 2026 16:04:23 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 638L4NRG1391370;
	Wed, 8 Apr 2026 16:04:23 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wAa4U-00000005fJM-4Bz8;
	Wed, 08 Apr 2026 16:04:23 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] check_yocto_rules: Add new exclude file
Date: Wed, 8 Apr 2026 16:04:22 -0500
Message-ID: <20260408210422.1350433-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|SJ1PR10MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: d1314ceb-481f-4641-de01-08de95b26970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	LHioaCP3uSpxotymz0K0UrRrOAF7MAIJ6DGDL3khKrnbvDf9uYx1B4AEqqjxkMTZLxKMC9TiACM26R20qx/T/haWgmvXHqOGuZINvEzQUpEY81iWZ8aszGyWaclM8rSh0YMpcWm+HBvteXlQVtdVl/zKe0TY6DG9XjfdWY8n7jIxftMI+6DTb2N+JWXBoGgt42Z0QoWuXLgYUWUPaIu7PZzhZSYQv2jAiOHc3Z6iJeGQhlpK6bNxjkBCmjKypg0cPsQSEjoAcjS75lp0DPwD6qz04sRNKjKzmMLiicXjfZia99RPLim873Irj30NAHM/B+vXFTKTBCOZGGtZMlWl3vIOn66ifmXai5Da0mlwN5kDxUmk8fZcRRqbIX4dYFWH8PT67K9B8FGu99IkUqQCn+ITh8+gikPOAqaUe8RHivG/eAfB8wcrmR0Zk2EKVlQ+ALUf4GdhqvHqf1XpTlU5vbcImbTKj+1LpcVL7lhvWSeLq+NLnHC6mQqkwY3DyQMCy8T28YeyGCKle52ZiiRmpPpqQdWXLIEhgTU+d1Ts3nw14k5qIlpy/5/rebN0F8f88S4KdlyPEQAKf1TysCqy69lC2zGhjptDfgZe0mggscgVcOixCGqTtSubAXKlxF/H770gqQS/2+efvN42hn/4tgii71Qw4la05UTnT8xALAoL9GRW+f0eXHFyQUSAYRGwGZ7LbXs0rKy49/ojiihf9yHz3gKQy6pjEv5XuGkzkMXIym1WP1LU1ffZ0+E72yvVVLCCcr2ryEJ4h5qvnGegZg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lt+iEHf7CML7qkz3KAXgbToDKgCWafzpUoU+VFc9Jzqafgr4zksSt7B0rneqDSX3Z0WATq77Oub2Mh9ZsR+21j3lMqa05YccwZmC1kjTY/3dlWct8bnjGWTpFO64WzBkTrIqINZmKi4MjAfP5w97SrzPCZ3fj164cvPIKuch9pF7vzTfLcvxvYSh4uYjR9gjcx3YeYehKQeFpwsgLdpSqPqxuNABBMWyVfRJAC5iEalhOHX/u3Yk0sj1TDFdmsl2GNFtJKgvyAUxjsUOVIhdrVCel9WNf6pnDNNQehwlDnlTqQPdpYUYlCrUihIdnq/BH4CIB22TaPQ5K184SxFph7KNHhn+JXn7ROaBr+KlJdverABDHutjHGRhhKqbE9jEGslgdQm/SkZ1O/dWRZJscqWupTIUMG4tBGOhm3Q1paMWDcVjqobPxVLB9xste6NX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 21:04:23.6333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1314ceb-481f-4641-de01-08de95b26970
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5977
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Apr 2026 21:04:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19838

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 66b9ae74..2eda8066 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -20,7 +20,8 @@
             "meta-ti-bsp/recipes-security/optee/optee-%.bbappend",
             "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-bsp/u-b=
oot/u-boot-ti-%.bbappend",
             "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-ti/init=
ramfs/packagegroup-ti-core-initramfs.bbappend",
-            "meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/pac=
kagegroup-ti-core-initramfs.bbappend"
+            "meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/pac=
kagegroup-ti-core-initramfs.bbappend",
+            "meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/ti-=
core-initramfs.bbappend"
         ]
     },
     "GUARD-2" : {
--=20
2.43.0


