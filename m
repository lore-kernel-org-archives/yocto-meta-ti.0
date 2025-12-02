Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AB0D12689
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 22:32:22 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1257.1764714742182075611
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 14:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Y1kirvon;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.66, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lq/niCEdU+kFl453RQVZmAyDaMtm5SaxTzn/dACSg0JDX7cN4cTm/oPkeexh4Ty2y9aihzT19qaBcO5LErSsPrU1doxkLyvuWqgFXapn3hwNo5eWY5yG38WIiJis0Bd0DI5JMmBVxOwuMLz0Tw9uBKkJEYffKNekYjT5FsRVg2oAlPCtoj8VQmF1yAE8bK0589+GE9CWKyjKKML5BPm2y6cmr3gusKIq0TGCDTXnRq9YnqbnUtBOK7KQvmUGb8Uj9x17ocI4XF6klpZ7IFgQrA/sC76pNqUIoSX6r+PSYywJD+PqLHLoKWJXnV3rLmpUQfirO/o3UmRE3VafDTnegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZf014M6VEJZX8Dqv3XDRnTOVii37bQG1cyTGcCJ4Kg=;
 b=IvrU6KW/3Sqy0ZXTxP3trMyYFUJAxfGG2pWzxGO3Ye+UST3wsTwiRy8V3nveU3B0hwbqLnTlwKSwUd5gLw9z14ZGg2kT7iNyVBxnX5B7ux8I+QoDlPrpCRSxV+M6uTx02A+jpOvG/kJKjeAeYsLSNb1d0iN55mkWbXjKhDIcwsWQM0OV2+PFh3bYXMcTkv1Sy4zDQsslM29x+HWubzkHqWDOIWDrQCI2m4KM3aZ9Xl3UtjO9f0Vq4FOtnSlaCORZfX/b6qA3HzDjWgqEpeFivNwfnG5H9TkgyokYxgzqFfgWgj9dLcfO1+jyCvDXAApu7Sg534eEm11wlTnLlJ9upQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZf014M6VEJZX8Dqv3XDRnTOVii37bQG1cyTGcCJ4Kg=;
 b=Y1kirvonpBOpBZgYbTAbRniARL2JaOZg3+Uj39WxxMQI2zD37TsiEAAnFBQ0pxPeg0su6SpHzLF4geslU7ZBs36NehQSpzAWJN5rtCDyad17GoZlCw+XpUYJrHKTMzQvn0R30DrRUlrdwCjAZhYiAi36mCnm8JvZOvI/J72PXA4=
Received: from IA4P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::8)
 by IA3PR10MB8274.namprd10.prod.outlook.com (2603:10b6:208:570::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 22:32:19 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::31) by IA4P220CA0004.outlook.office365.com
 (2603:10b6:208:558::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 22:32:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 22:32:18 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 16:32:15 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 16:32:13 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 16:32:13 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2MWCvU2994337;
	Tue, 2 Dec 2025 16:32:13 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 2/4] u-boot: Remove defaults for UBOOT_SUFFIX and SPL_BINARY
Date: Tue, 2 Dec 2025 16:32:08 -0600
Message-ID: <20251202223210.3816583-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251202223210.3816583-1-afd@ti.com>
References: <20251202223210.3816583-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|IA3PR10MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: d501ee7e-92c9-4296-d1b1-08de31f2a73e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zj/toLPNoue3laquwqOpORIgtj1+TO/M03fVfNsuyht7Z3p/EVU7CAVUvM1d?=
 =?us-ascii?Q?6pOJFUPcxR9VsxMGzo/Yg6bDcf+zBtKlSmk2mHAWhLpd3IvFd3KHPMY2H8B3?=
 =?us-ascii?Q?Zn6VBy00DhytMDZSn845FhBchk89bca7e3Ctm9aLXZaRp+u7nFmSm70XwOSi?=
 =?us-ascii?Q?2Xu9SVzeIJdGES/Jx9CoOampPBSz0vpZG2J2QAfEn+fN6JDFOczNOVF6J5Hu?=
 =?us-ascii?Q?JPVXrtFgdf/SbAMlB2T8InopJUtBeTGBY5OFxDksj8gpDpRs9kUfrXfzAnhq?=
 =?us-ascii?Q?jFr43Hwc0LKg9kK5pk3In4P/VqqtuYxPUijguJDub+kYIDqcqyg5KFuy15iF?=
 =?us-ascii?Q?FMLpLVfG1xRBWnLXHCrlemf9S1juLLc9VHNCAwoJVRx4zJa8vAZNWRgwO/18?=
 =?us-ascii?Q?v1AnmNltffeRvh9RcmXU2HLV+LnyHksFFAzQLi/v3yIAq6y3Q+0fdLFtjWeR?=
 =?us-ascii?Q?wK6OeunFCiOwj5Cd/M8P27QEB4dENVUPq9RLwH6e2PCZm0utqHYzONMsfpQs?=
 =?us-ascii?Q?GkhT36uK18CAzvV3jr/WsaFKhu2LMTBAgMlZ+Pk2xlrR0NsjImtZQEgpmX3l?=
 =?us-ascii?Q?7mSeedvXSRDIUUG0RWHC06aYqtXrkCmopm8+5h7SKQpIQEY0mT5qnwcByscN?=
 =?us-ascii?Q?thSyV/uklmnSzTB0sjE49eoLwFEnmJoBDWhxRSn9PABPZu+S4r4up9oJzKqh?=
 =?us-ascii?Q?b5q2+DHULXB3pXtAVpO0ZWt7Bb4t8qIblb4wNM7AeT3nXNf6YJcmJKHb3f3y?=
 =?us-ascii?Q?yzxNx7rcdTKarOySuc/9ngELBJLoGBRulLMXT45ORqNqsNBXSS4sqBH7QR3Y?=
 =?us-ascii?Q?IjJp/yNTbaLffI4RxC580+lAXeLIDvqKBn7T7uH1/VgP1yEbfh8CTKDAGGYd?=
 =?us-ascii?Q?ukP6JnOONCXbsBtkP2EgS28jJaWDTyiR14QcQQilbfSm83h0o14z4ufPQgtE?=
 =?us-ascii?Q?v/RygRl7lkpo6YucIiKC7q9q4NnovWCU5unwH0V+3ltU0GQTYUMg/pC3jHgZ?=
 =?us-ascii?Q?EAGW+ZBqkJOx9dyFNPwjuY1pOCE8a6YYYJvtI5Z2AyzK0/3qM3xdqtNhgLjU?=
 =?us-ascii?Q?z3RXhT/mLxArc2mCYjCOsaovBMtRDeyYNqllbpFXPfwWuxBEmM+5uBCtrbs6?=
 =?us-ascii?Q?R4/4w3vpo4rZYUmJ54Mz/DFSb6UOGaNrHgRt094jP+p26Go/q3P5d0s6S5WR?=
 =?us-ascii?Q?8k4ZwdTvrwTzDT8x5zhap3nYx7WeMCDA/PUQjYTuRnS6/8fRyEgqumMbchHj?=
 =?us-ascii?Q?h25feH2MqY7tWRJExbjxQjs0TgjDnCFP7mL/utPREJqLTbxY1gw9SDwR0GIg?=
 =?us-ascii?Q?VGlx+YpYHyL6fcPzwWGl7KR5+40L2FeLGHpduJCnkpSdzVHj5l7JFg9s3uac?=
 =?us-ascii?Q?Fg8JMpekSRJVg8uCMQx/ESEXtkPrMFILXiEn/zHfRvunmDHB1WXRxFX8mh5Q?=
 =?us-ascii?Q?hMiZjhGCAcc9p/Dy0/TQ7ieSseEReJsMpZ+Ym3Qzbrgvo6XsJggPbYKOWp/x?=
 =?us-ascii?Q?ChleW5wSKPibEyxlW6Y//IZOBCvYf5sKbawNDdKMWVlHN6edeIIhK3iXFHvJ?=
 =?us-ascii?Q?zmFJCgQE/bqD+hxYako=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:32:18.9799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d501ee7e-92c9-4296-d1b1-08de31f2a73e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8274
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Dec 2025 22:32:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19320

These were set to the defaults we would expect from OMAP class U-Boot,
but as all board families set these including the OMAP class MACHINEs
we can remove these defaults. This helps in the cases that we do not
want to define one of these, such as SPL_BINARY in the case of OMAP-L138
which does not use SPL.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/omapl138-lcdk.conf  | 1 -
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf b/meta-ti-bsp/conf=
/machine/omapl138-lcdk.conf
index 458caaff..c1e47926 100644
--- a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
+++ b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
@@ -6,7 +6,6 @@ require conf/machine/include/omapl138.inc
=20
 UBOOT_MACHINE =3D "omapl138_lcdk_config"
 UBOOT_SUFFIX =3D "ais"
-SPL_BINARY =3D ""
=20
 UBOOT_ENTRYPOINT =3D "0xc0008000"
 UBOOT_LOADADDRESS =3D "0xc0008000"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/rec=
ipes-bsp/u-boot/u-boot-ti.inc
index de4a37b4..277ec7fe 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -5,9 +5,6 @@ do_compile:prepend () {
     echo ${scm_version} > ${S}/.scmversion
 }
=20
-UBOOT_SUFFIX ?=3D "img"
-SPL_BINARY ?=3D "MLO"
-
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
 require u-boot-mergeconfig.inc
--=20
2.39.2


