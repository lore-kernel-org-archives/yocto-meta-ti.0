Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8545DF55446
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:49:18 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37521.1771987752857692193
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 18:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=pPXw0SYH;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.69, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJzS0BmZipPMqG6sMjArG/R0G+6homodceSrwQY0vnY1kLeh5kay7VxE6fndZpsjenSK1A/IuW6Fddu7h8WYL816uxpOGiX65e9wbfFHMYdUA4OHVKYnRDursbJkwCLVfGQbI/+AjcylC8r80+aFbefLh1D2pnStbUv6AHINItQ8Elrp2T5vd/FvmnOkj8R2rMHVtDowc4vB6Mh2cVlrBI/9dS3fo3uvZJkEoKiTR1LFvbS08eEqpg966qnllpm5XYPGZXolRMrPMn3MK7tjnZ3DQ1D9a+3fYKarhDRnNy38zElBiVqpJFKnrtMK9cDpuGU7Z+SocBEe+cTN7r5+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4k+qNvmsTV/uYXQVa2c/JaQrwCKdSPfzgF87NFavB0=;
 b=G9lrm+YpODtohgidX+fmhMq5fNKbB4U3Yf08RSsJ/OZrxi9FElUW3EkB4Qiaqx0jlnP75Pf6r1iJNdJvhoSdcsXnH3kuZqYIZ/CpppDYhoEWGPN7Jh3cOATA8RzKLuy6K1Nt3IDNI1V4rV6co4K1OZJbRgVTk9OC4nx5vBaH1RiCMroC/TdwGxuHdVoGpwnFMpnBlvP9Wnh4dpDons76b0KgASEGhs2ahjLofXv+nC8LbELKLE0FPuBjD+zB/7f5324WVRZBZqAIOoF2ItwUdSRVany1spO3YPJK103lDhPpqQvWgFcQ0uCNRcGT2g1JtxHIk+21FXiYOEak7CoEGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4k+qNvmsTV/uYXQVa2c/JaQrwCKdSPfzgF87NFavB0=;
 b=pPXw0SYHxor5Nq136RxvjqN+2nXRa7U4UCqdAUslG4DRy+GV8dGjUb+6rUTEDNMYQjrYdi9S+or+kT2W/ECbYHiaSBrqN7BfwvCN/cR15ywCJZSvBetoHHMObNknRS+Eaf54HCfOh4PiWIDWWGBBLLcIz39dszUqU+z5ADIbKzo=
Received: from BN9PR03CA0724.namprd03.prod.outlook.com (2603:10b6:408:110::9)
 by CH0PR10MB7533.namprd10.prod.outlook.com (2603:10b6:610:183::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 02:49:09 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::ae) by BN9PR03CA0724.outlook.office365.com
 (2603:10b6:408:110::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 02:49:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 02:49:09 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:49:08 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:49:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 20:49:07 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P2n7RY3837104;
	Tue, 24 Feb 2026 20:49:07 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vv4xX-0000000CCci-2yp0;
	Tue, 24 Feb 2026 20:49:07 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/4 v2] ti-rpmsg-char: Set DISABLE_STATIC = ""
Date: Tue, 24 Feb 2026 20:49:04 -0600
Message-ID: <20260225024907.2908365-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|CH0PR10MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: b754859f-64c8-49cf-df4d-08de74187314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|34070700014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K5/dDuKO9mwl9HZqakqc2ySrHkjVZTOuke+IWrs0Q9Q2bvkuBwnkJ22gWGi1?=
 =?us-ascii?Q?VcIKxHTNLGcFtoMSjQtNl3IKojH+CTEcjCrmRTqXR1YhJiZ4Xt6xPE0qj6Ec?=
 =?us-ascii?Q?tE0Ue25GODuUos9MgiZaM+3iedqK0IgjE7Ojf1ET4CrGR2AlkrB8tTekrEsR?=
 =?us-ascii?Q?UPRaF9E+hMlv4mV48Zc1I+Al9Dbhlr8Y6Go7CjD9XrmPrhS6GYlnouLT0wPA?=
 =?us-ascii?Q?keLXoSO1Ifds9bbDI2cFppY4Cl+LIjOy3Ozjb26m7KMfOWFOq+uh2jbxZ8oV?=
 =?us-ascii?Q?8e3dTklOy9NxTvpKT2DTdIAetIUOEY9dAyP3IYWoLnpAqvru/1l8QE7GYm/c?=
 =?us-ascii?Q?qoHKVXB0ZiesCt4eQrpezmm/baK5eusR4vpQxbm0NkCITFUJqsPIYXLp0ZhZ?=
 =?us-ascii?Q?Z2ODHQz05S7gCFlb94wFFwpPvic9uHux+hfh/nvPXTYB3Owm1y7/xfQFBCL+?=
 =?us-ascii?Q?/YFIRni+GE1MrrnmdDsx43DfBQNP8RRNEHcYdiEkZOYiX9PgnQQo55vUKJoQ?=
 =?us-ascii?Q?0Nff+fg63Dj2TTREIhRwa32Dt+8V7bQ1IsM1oJGI9S33VYZtOWPY0ArMzSq0?=
 =?us-ascii?Q?+XAPYjxv7tfdgr5zsywT7pd4evbJh/1R+d52Pdw5/FkXk5F4YV2yLRrBVfdN?=
 =?us-ascii?Q?PDxD5NiqGyiBvnT4ReQ0JFsP4vy70lspNSEuEmsrdv6T/TpF1m/zoU6+9bPj?=
 =?us-ascii?Q?o3NYZY9q7m6VSGPnQxG70bAu7JObN/Eg9pz+k/diINKmlf+xAFwgxPUekD4X?=
 =?us-ascii?Q?+QpEe4XJoFfEHmuNm4aVTF56lpTDBwKaIsyvqPnozrt3IkqA1ki8TnMj7qKL?=
 =?us-ascii?Q?ygPMCxL3CbcC5C8T2ldL1aDfL93/O6Q+BWX4CLiy8m0ZhcqU/do/ZweNMjyM?=
 =?us-ascii?Q?ctdfe2rC5xfMuw9AqEiP382lCt4EOvoaoPYkWO4T24awGaUHJ9ej9kIxUcIt?=
 =?us-ascii?Q?uBTl9ADLbh9Plw/ALILuAcZ1NVMXqoyDUMn+G7sFd0UAbUJ1bCRVKZtMLKpM?=
 =?us-ascii?Q?F5dk5me+zqD+84p9lxPU3FWSQNz02VhCN0eHLtu1GrbJX/ZulhjowEdn41Jt?=
 =?us-ascii?Q?gXPsR6zfFt1cVUa7iJViJmS9H4fq2xZaOA0UEm6MbtxWTrJ9PuZX9dDxRcYw?=
 =?us-ascii?Q?mVjqfZS7kUdbH71gSC11PQ5/LsVW7tOfdRfd6JEWv+npm9mIhXjXIoEiXMsa?=
 =?us-ascii?Q?jrw2Nx0Ia/g/NicicfB1WFrieGnIdSXcze1lnu1iRqE7Im8Hb8MSoq2FQQeR?=
 =?us-ascii?Q?H5gOOJS6X6tLUPBUl71rC/uEB4nlW8MaHnK62G3VB0VveahDwA9k8dSjfkUy?=
 =?us-ascii?Q?3lVbsCdRmyOJxnHVcW8dOzZFEWQpKCZlJqJhoBT+xkVRs61hwU2micyDzpd4?=
 =?us-ascii?Q?gIG1UwI90o52K75xpOjMEM8uVrcUwLkiGtg9BvGbLYEmDWWjO4qNDenDb2Fj?=
 =?us-ascii?Q?tKpAH+fJaUQap2VRkRyhCgUEFWUJQdx8sdGLOxLXYbgxky8wvLmaXfo+BDib?=
 =?us-ascii?Q?f+1LKJHxmCuhf62hMLoh3TSp9UxTa5ioTA0RIgYqi4Uy4F8QdgPsyOh+8BpG?=
 =?us-ascii?Q?sECvg7ceOcKzo5AMlFRSUnwHhz6GH6PnULJxoKntPGzGytBm8OCVnvU/a/uG?=
 =?us-ascii?Q?f/XXFyrtj6tRimaeAM7x2Z3uw5PdEv+Huaecpwt/DOUZ+QGvhInqUJqdiR4G?=
 =?us-ascii?Q?5yWT/Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(34070700014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	l+2whMmlwfa2RU3DUP1OyiXdUC7/Q78Ff9pNU81vGWjliXzA6sqzRcDAQiBHhFATH9blk5WhlayxdelNTJWc0U7vIfezZQYNZ7/uH9LtVuMMF252EigvYDptzNUd3bVNzT6KIz4YmCZbPdkunVhPnr3Y98mpRAtFnuaCAB53i3PFcSWO3UaeRcpqUjYiSqobbJu6z1MOdNcZ7TslLIzocDv5QxlqJMOkbPA53GqB8mHbpL46oU2aJuNkl0dj4E2VJpo8EVzTpsEsy6TABTcV6gZp+TRxZzWaGCXySdn+5skY6kdDiZfYeFAmaFf8k8Ia6Z9Soj3tNmrYrmRpieNuKV3rhr4ZFMlP5+qmXQY0VCE/26/RCG6qWXSP8NRzrFrFSTFVlPYdgZwjmsnw2BNf4T4MOraayl/wQmZJCHUJ7bCC2q3WFHaZqUxm8HDXKyTi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 02:49:09.0754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b754859f-64c8-49cf-df4d-08de74187314
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7533
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 02:49:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19597

As of [1], static libs are disabled by default.  But this package relies
on static libs, so we need to allow for building them.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D03fc931bfe9=
ea3fa9f33553e6020cbc067b24291

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Moved the setting from the .inc into the .bb file.

 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb b/meta-ti-bsp/=
recipes-ti/ipc/ti-rpmsg-char_git.bb
index 63711a3b..50565300 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb
@@ -5,3 +5,5 @@ require ti-rpmsg-char.inc
 inherit autotools pkgconfig
=20
 PR =3D "r0"
+
+DISABLE_STATIC =3D ""
--=20
2.43.0


