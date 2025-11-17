Return-Path: <s-joshi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B0ACE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 08:35:51 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5251.1763368532312951554
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 00:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=rENG0RwL;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.201.53, mailfrom: s-joshi@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msLE7ebwTltk7nok0MxXvvVHrcEj3kUYPFdp9mJgKaddA9oxWm5d5Hc/cSIhEWApwk3eaL39slqkXb3MM1H4XkZrKbg09lihLpeqfQUojnRasfB1Bs9nq42eEa3GihAbLj116MXVcx4N0xlvKMpWnT+i35WrfcNSxNQAoSaQg++8NCXi37Fqyt/3lDSh+YZTkzhD65sPqIYDB/to+xs/I/SmYbaRY3bObEsR/lKEuu2t0jQj5KP800qU+xes/QpO6AMg8mJ2O6n5UtuF+ansBtyNED7/6hsx2T7jBg8Zi1ddcc2NUvzHVi1JIUicFv7iSNeMRU5YAjRoxGHJ5+mMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpGyQk5KPR8paK4sVPocx5zUWH7oLp+11dcEgqFfIZ0=;
 b=U0qKoBuzyE1F4rOGJGuD8cgAqyHSxLPXHXs01OEsUfoTaiO+/wBJSAXlCUtQfbwmNLBAinQCjo0L7r8An8frm3OsGT7o1bbpeWt2llXW9TYn3A21hVXTx6gqZANzPdiBIsTxHPbDHcxk042vBGqyQQQxUuwDa4dxRxCBTAfoN6+nzYNnfo3D43c4VjRWXrMndjUFaVOP75tR2LUunExmIF6gi0d67Qdrghd8sQSxX3dkNc24oJwOvoOkg9mBVQKMhE0ea76E8cQklsSd3Hpnq8NdIQCr4A4rRbUm30wmBFshglN059I3I71x20XMPMFZtSJ9k4xKlD3fz3uZoqh29A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpGyQk5KPR8paK4sVPocx5zUWH7oLp+11dcEgqFfIZ0=;
 b=rENG0RwLbaFkTxFqjQMWwMaWgefAtqbiEGbtrwG/TJN9EFKgsfFZt+owdC6R9GOC8xosPgMedZFtHelagPTg3Glq+ACv12gNO8ytNTSkAr23eudAL+O55ut5H6P8h1PhvbGSJVmtC67yF3jyFID23Gkae1LgN6JeZACTMdgf5T0=
Received: from DM6PR11CA0002.namprd11.prod.outlook.com (2603:10b6:5:190::15)
 by SJ0PR10MB4637.namprd10.prod.outlook.com (2603:10b6:a03:2d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 08:35:30 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:5:190:cafe::13) by DM6PR11CA0002.outlook.office365.com
 (2603:10b6:5:190::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 08:35:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 08:35:29 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:35:25 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:35:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 02:35:25 -0600
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AH8ZOwW2182668;
	Mon, 17 Nov 2025 02:35:25 -0600
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>, <k-malarvizhi@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][scarthgap][PATCH v4] meta-ti-bsp: optee: Ensure libckteec.so symlink is installed
Date: Mon, 17 Nov 2025 14:04:08 +0530
Message-ID: <20251117083407.3719468-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|SJ0PR10MB4637:EE_
X-MS-Office365-Filtering-Correlation-Id: 964a0c79-a4c5-4dbd-4d5d-08de25b443e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8u0mjPiEEXzA3uUl3QcsTwp3ahpmp4BppzHrZ+5exGvdAQHLWOXLfo2M/Fa3?=
 =?us-ascii?Q?2XpgpiByYyArre+cxjkNadr4RSjCiU6VwZGbC6kd5WzIlBBKPyQB2Y2GTEE1?=
 =?us-ascii?Q?bpB1x4zwwYnFh4EvgN6C/9BZWw5pfpPEkumhTtMXdw1C+GZ6/oivgzN2uiON?=
 =?us-ascii?Q?m53v6Uj4iTNkfT1T0TNV0uCFe6Njl50rwL+YciACxgR89djkzgqHRsArL6bS?=
 =?us-ascii?Q?t9xm+ZxPNXkcthYlalLT5BNJF9tHZY8gFIj1rrIxlCeZJ8QSZdVWQsLu7pkB?=
 =?us-ascii?Q?oxP4WrvateeK24mGInbuNmOMGGrFuPjpAShmvj85jaN32pZz7CDvgdHNoRiy?=
 =?us-ascii?Q?ld7jOojwHGibIE3dMXScScbkxQbFo0i9bdA8MY5/ONn3d/FodMdafNpfguJj?=
 =?us-ascii?Q?8rdfCyec+XXitlLbLCYxbWOyN0bUpGJLwd/IZO77RxZ5V/OLPmcZex8aRrDM?=
 =?us-ascii?Q?TDXebC6nroZkrgUQHaXXONWn/pLRuQFvVxdQYfOjImZX9qCtKpLo/5XqTsUE?=
 =?us-ascii?Q?pBi4aIq+IiEmUaM+pxHsfxBd2WMloDB0/B9s/8OIlQhgD9ezv1aRVe9wss4C?=
 =?us-ascii?Q?CNLlqN1jHb+ZvqqwOAEQ2nlo5sCAXKLfrPFb+DFdVEzB8Xm7aCUiQ8wbQ8hM?=
 =?us-ascii?Q?cZuzEEMqiKIkGIlW6sD6vpIctyvrRvLv3CDqDCu3pACRjF49EEjtKuWRtfSa?=
 =?us-ascii?Q?08ydeXiHPt47vxRDsAPbEezqrDz9M1gKamOIN0PWo323oHwbc58ffMnR7qJj?=
 =?us-ascii?Q?+VcWlYE04xz4yVSLfY6JRiocw4vmYFNApc3guiBY0Rn+QJfc3fjXqRnn5y+G?=
 =?us-ascii?Q?3QPbYCkCJA86X1+uz3LT7+a6uB7fW/LH9NipUZqDaZapEg7hqt2EDfokPhhs?=
 =?us-ascii?Q?MURHJA9aWH8NiaTDuWqpU9moZLwLiErAteX2uXAIxJx5PPytzgP5+5XUjDlA?=
 =?us-ascii?Q?tN9YTEX411Hrm07PL+nEPtQPfPGMkM+XMrDWBCOvxqBWyFy54WGMMiCmsY/a?=
 =?us-ascii?Q?AYBC/aNcmDq5FEQVtiY/vv7PEEywyfs9mz00zw6TJBgR7fO5+zvoYLqCxIHw?=
 =?us-ascii?Q?GWEDShYqevPApy96TIm/pi1+1VOAjm89DpE2UHUJHBRqP+zzV1PIK96w3xaw?=
 =?us-ascii?Q?SYlvaiEOSgKxAnlmQa4tnaby6VmQuqjw2poAniZVKXtDX+7f/b+N2usc9RsH?=
 =?us-ascii?Q?OPPgBGNeNs4zc4KNDWiz7CfWbpcKWWyoX5YgZ1A+3H0t6aBem4mFWLgSKw8/?=
 =?us-ascii?Q?hriZe5mBI1xwzKBg2bNCb2HO+491rSUl0fiRO5uxfKjlf3LNiJkxn0DYGvl2?=
 =?us-ascii?Q?TBuNFfiN+MYTyTgzPt6vTm3Xp6LZvvqEcOkgjXEozLcvnifl/OkIbzWIDk1X?=
 =?us-ascii?Q?qMYD6HDerQbF/vZN+bgYTxwK6WYNvIbaiUWWpAdtVcvjw13egWZHCAKAC1eZ?=
 =?us-ascii?Q?K5314yPfpD1KLC8FgFb0SFHuFq6YSTlGCfLK+W8DCOCX/55oVtRVSdWoMzHt?=
 =?us-ascii?Q?51Cwv/ABCuUZCa1QepFqoHhTWPbtUqw4UGwOV8ai7NRP38UL40BK4DB5pJ5v?=
 =?us-ascii?Q?QHqje0Z1OUW7n4j4A2s=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 08:35:29.5867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 964a0c79-a4c5-4dbd-4d5d-08de25b443e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4637
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Nov 2025 08:35:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19278

Presently, /usr/lib/libckteec.so is not installed. Instead, the only
symlink present is /usr/lib/libckteec.so.0 which points to
libckteec.so.0.1.0. This makes OpenSSL commands fail since it looks for
/usr/bin/libckteec.so.

So ensure that this symlink is installed by explicitly adding a
FILES:${PN} assignment.

Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
---
v3 -> v4:
* I realized that libckteec.so.0* and the PKCS#11 TA file were both already=
 installed in the SDK.
  Therefore, in v4, I have removed the logic for that since its redundant n=
ow. CFG_PKCS11_TA and
  CFG_REE_FS are enabled by-default.
* v4 only fixes one issue: the absence of libckteec.so. /usr/bin/libckteec.=
so should link to
  /usr/bin/libckteec.so.0 which then links to /usr/bin/libckteec.so.0.1.0.
* Link to v3:
https://lore.kernel.org/yocto-meta-ti/20251113104522.2443817-1-prc@list.ti.=
com/T/#t
---
 .../recipes-security/optee/optee-client-ti-overrides.inc     | 1 +
 meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend   | 5 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client-ti-over=
rides.inc

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.i=
nc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
new file mode 100644
index 00000000..dd6a9d01
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
@@ -0,0 +1 @@
+FILES:${PN} +=3D "${libdir}/libckteec.so*"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/m=
eta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
index f193e78b..0cee127f 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
@@ -2,3 +2,8 @@ OPTEE_TI_VERSION =3D ""
 OPTEE_TI_VERSION:ti-soc =3D "${BPN}-ti-version.inc"
=20
 require ${OPTEE_TI_VERSION}
+
+OPTEE_TI_OVERRIDES =3D ""
+OPTEE_TI_OVERRIDES:ti-soc =3D "${BPN}-ti-overrides.inc"
+
+require ${OPTEE_TI_OVERRIDES}
--=20
2.34.1


